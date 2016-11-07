# == Schema Information
#
# Table name: recipes_per_users
#
#  id                  :integer          not null, primary key
#  recipe_id           :integer
#  user_id             :integer
#  favorite            :boolean          default(FALSE)
#  owner               :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  username            :string
#  like                :boolean
#  validated           :boolean
#  positive_validation :boolean
#  stars               :integer
#

class RecipePerUser < ActiveRecord::Base
  self.table_name = 'recipes_per_users'

  belongs_to :recipe, class_name: 'Recipe'
  belongs_to :user, class_name: 'User'

  after_initialize :set_defaults

  validates :recipe_id, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :username, presence: true
  validates :favorite, inclusion: { in: [true, false] }
  validates :owner, inclusion: { in: [true, false] }
  validates :like, inclusion: { in: [true, false] }
  validates :validated, inclusion: { in: [true, false] }
  validates :stars, inclusion: { in: [nil, 1, 2, 3, 4, 5] }

  before_create :validate_recipe
  before_update :validate_recipe, if: :positive_validation_changed? # se hace before_update, porque en el after la receta ya tiene que estar validada para darle la insignia

  after_create :update_badges_validate_recipe
  after_update :update_badges_validate_recipe, if: :validated_changed? # cuando valida cualquier receta

  after_create :update_badges_create_recipe
  after_update :update_badges_create_recipe, if: :positive_validation_changed? # cuando valida positivo una receta

  after_create :update_likes, if: :like_changed?
  after_update :update_likes, if: :like_changed?

  after_create :update_stars, if: :stars_changed?
  after_update :update_stars, if: :stars_changed?

  def update!(params)
    params[:user_id] = user_id
    super params
  end

  def self.create!(params)
    params[:user_id] = User.find_by_username(params[:username]).id
    super params
  end

  private

  def set_defaults
    self.like = false if like.nil?
    self.validated = false if validated.nil?
  end

  def update_badges_validate_recipe
    user = User.find_by_username(username)
    badges_left = Badge.where(badge_type: 'validate') - user.badges
    validated_recipes_amount = RecipePerUser.where(username: username, validated: true).count
    badges_left.each do |badge|
      BadgePerUser.create!(username: username, badge_id: badge.id) if badge.amount == validated_recipes_amount
    end
  end

  def update_badges_create_recipe
    return unless positive_validation_changed? to: true
    recipe = Recipe.find_by_id(recipe_id)
    user = recipe.owner

    return unless user # si recien se crea la receta (y todavia no tiene su relacion con el owner)

    badges_left = []
    badges_left = Badge.where(badge_type: 'vegan') - user.badges if recipe.vegan
    created_vegan_recipes_amount = RecipePerUser.where(username: user.username, owner: true).map(&:recipe).select(&:validated).select(&:vegan).count
    badges_left.each do |badge|
      BadgePerUser.create!(username: user.username, badge_id: badge.id) if badge.amount == created_vegan_recipes_amount
    end

    badges_left = []
    badges_left = Badge.where(badge_type: 'vegetarian') - user.badges if recipe.vegetarian
    created_vegetarian_recipes_amount = RecipePerUser.where(username: user.username, owner: true).map(&:recipe).select(&:validated).select(&:vegetarian).count
    badges_left.each do |badge|
      BadgePerUser.create!(username: user.username, badge_id: badge.id) if badge.amount == created_vegetarian_recipes_amount
    end

    badges_left = []
    badges_left = Badge.where(badge_type: 'celiac') - user.badges if recipe.celiac
    created_celiac_recipes_amount = RecipePerUser.where(username: user.username, owner: true).map(&:recipe).select(&:validated).select(&:celiac).count
    badges_left.each do |badge|
      BadgePerUser.create!(username: user.username, badge_id: badge.id) if badge.amount == created_celiac_recipes_amount
    end

    badges_left = []
    badges_left = Badge.where(badge_type: 'diabetic') - user.badges if recipe.diabetic
    created_diabetic_recipes_amount = RecipePerUser.where(username: user.username, owner: true).map(&:recipe).select(&:validated).select(&:diabetic).count
    badges_left.each do |badge|
      BadgePerUser.create!(username: user.username, badge_id: badge.id) if badge.amount == created_diabetic_recipes_amount
    end
  end

  def validate_recipe
    return unless positive_validation_changed? to: true
    validations_needed = [{ from_users: 1, to_users: 50, percentage: 0.1 }, { from_users: 50, users: 200, percentage: 0.05 }, { from_users: 200, users: 100000, percentage: 0.01 }]
    # porcentaje de validacion segun cantidad de usuarios (lo ideal seria una funcion logaritmica)

    users_amount = User.count
    percentage = validations_needed.find { |validation| users_amount >= validation[:from_users] && users_amount < validation[:to_users] }[:percentage]
    users_needed = users_amount * percentage
    users_needed = users_needed.to_i.positive? ? users_needed : 1

    positive_validations_amount = (RecipePerUser.where(recipe_id: recipe_id, positive_validation: true).count - RecipePerUser.where(recipe_id: recipe_id, positive_validation: false).count) + 1 # como estas en el before update, todavia no esta considerando la actual
    # validaciones positivas - negativas
    if positive_validations_amount >= users_needed
      recipe = Recipe.find(recipe_id)
      recipe.update!(validated: true)
    end
  end

  def update_likes
    RecipePerUser.reset_column_information
    self.recipe.update!(likes: self.recipe.likes + 1) if like_changed? from: false, to: true # tengo que agregar un like a la receta
    self.recipe.update!(likes: self.recipe.likes + 1) if like_changed? from: nil, to: true
    self.recipe.update!(likes: self.recipe.likes - 1) if like_changed? from: true, to: false # tengo que sacarle un like a la receta
  end

  def update_stars
    RecipePerUser.reset_column_information
    return unless stars_changed?
    recipes_per_users_with_stars = RecipePerUser.where(recipe_id: self.recipe_id).where.not(stars: nil)
    amount_of_stars = recipes_per_users_with_stars.count
    stars_sum = recipes_per_users_with_stars.to_a.inject(0) { |sum, recipe_per_user| sum + recipe_per_user.stars }
    self.recipe.update!(stars: stars_sum.to_f / amount_of_stars.to_f)
  end
end
