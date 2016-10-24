# == Schema Information
#
# Table name: recipes_per_users
#
#  id                  :integer          not null, primary key
#  recipe_id           :integer
#  user_id             :integer
#  favorite            :boolean          default(FALSE)
#  owner               :boolean          default(FALSE)
#  vote                :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  username            :string
#  like                :boolean
#  validated           :boolean
#  positive_validation :boolean
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
  validates :vote, inclusion: { in: [nil, 1, 2, 3, 4, 5] }

  after_create :update_badges_validate_recipe
  after_update :update_badges_validate_recipe, if: :validated_changed? # cuando valida cualquier receta

  after_create :update_badges_create_recipe
  after_update :update_badges_create_recipe, if: :positive_validation_changed? # cuando valida positivo una receta

  # siempre que se crea, o positive_validation es true
  # validar si gano una nueva insignia, o si se valido la receta
  # save_audit_event('disable', { version: version }) if status_changed? to: 'disabled'
  # after_update :create_update_instances_job, if: :min_instances_changed?

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
    validated_recipes_amount = RecipePerUser.count(username: username, validated: true)
    badges_left.each do |badge|
      BadgePerUser.create!(username: username, badge_id: badge.id) if badge.amount == validated_recipes_amount
    end
  end

  def update_badges_create_recipe
    # DESPUES VALIDO AL USUARIO QUE CARGO LA RECETA
    # do
  end
end
