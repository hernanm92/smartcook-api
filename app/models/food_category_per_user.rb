# == Schema Information
#
# Table name: food_categories_per_users
#
#  id               :integer          not null, primary key
#  food_category_id :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  username         :string
#

class FoodCategoryPerUser < ActiveRecord::Base
  self.table_name = 'food_categories_per_users'

  belongs_to :food_category, class_name: 'FoodCategory'
  belongs_to :user, class_name: 'User'

  validates :food_category_id, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :username, presence: true

  def update!(params)
    params[:user_id] = user_id
    super params
  end

  def self.create!(params)
    params[:user_id] = User.find_by_username(params[:username]).id
    super params
  end
end
