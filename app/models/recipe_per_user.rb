# == Schema Information
#
# Table name: recipes_per_users
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  user_id    :integer
#  favorite   :boolean          default(FALSE)
#  owned      :boolean          default(FALSE)
#  vote       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecipePerUser < ActiveRecord::Base
  self.table_name = 'recipes_per_users'

  belongs_to :recipe, class_name: 'Recipe'
  belongs_to :user, class_name: 'User'

  validates :recipe_id, presence: true, numericality: { only_integer: true }
  # validates :user_id, presence: true, numericality: { only_integer: true }
  validates :favorite, presence: true, inclusion: { in: [true, false] }
  validates :owned, presence: true, inclusion: { in: [true, false] }
  validates :vote, numericality: { only_integer: true }, inclusion: { in: [1, 2, 3, 4, 5] }

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end

  def self.create!(params)
    params[:user_id] = User.find_by_username(params[:username]).id
    super params
  end
end
