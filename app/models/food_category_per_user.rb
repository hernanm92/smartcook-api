# == Schema Information
#
# Table name: food_categories_per_users
#
#  id               :integer          not null, primary key
#  food_category_id :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class FoodCategoryPerUser < ActiveRecord::Base
  self.table_name = 'food_categories_per_users'

  validates :category_id, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end
end
