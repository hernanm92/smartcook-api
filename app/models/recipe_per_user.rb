# == Schema Information
#
# Table name: recipes_per_users
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  user_id    :integer
#  favorite   :boolean          default(FALSE)
#  owner      :boolean          default(FALSE)
#  vote       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#  like       :boolean
#  validated  :boolean
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
  end
end
