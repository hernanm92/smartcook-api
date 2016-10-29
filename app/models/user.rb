# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  name       :string
#  email      :string
#  password   :string
#  avatar     :string
#  birthdate  :datetime
#  gender     :string
#  vegetarian :boolean
#  vegan      :boolean
#  celiac     :boolean
#  diabetic   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin      :boolean
#  enabled    :boolean
#

class User < ActiveRecord::Base
  has_many :recipes_per_users, dependent: :destroy, class_name: 'RecipePerUser'
  has_many :recipes, through: :recipes_per_users

  has_many :food_categories_per_users, dependent: :destroy, class_name: 'FoodCategoryPerUser'
  has_many :food_categories, through: :food_categories_per_users, class_name: 'FoodCategory'

  has_many :ingredients_per_users, dependent: :destroy, class_name: 'IngredientPerUser'
  has_many :ingredients, through: :ingredients_per_users

  has_many :badges_per_users, dependent: :destroy, class_name: 'BadgePerUser'
  has_many :badges, through: :badges_per_users

  has_many :frequent_users, dependent: :destroy, class_name: 'FrequentUser'
  has_many :users, through: :frequent_users, source: :frequent_user
  # se trae a los frequent users de la tabla FrequentUser

  validates :username, presence: true, uniqueness: true, length: { in: 5..15 }
  validates :name, presence: true, length: { in: 5..30 }
  validates :email, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :password, presence: true, length: { in: 5..30 }
  validates :enabled, inclusion: { in: [true, false] }

  after_initialize :set_defaults

  def self.find_by!(params)
    params[:username] = params.delete(:id) if params[:id]
    super params
  end

  private

  def set_defaults
    self.vegetarian = false if vegetarian.nil?
    self.vegan = false if vegan.nil?
    self.celiac = false if celiac.nil?
    self.diabetic = false if diabetic.nil?
    self.admin = false if admin.nil?
    self.enabled = true if enabled.nil?
  end
end
