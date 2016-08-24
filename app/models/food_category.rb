# == Schema Information
#
# Table name: food_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodCategory < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 5..15 }

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end
end
