# == Schema Information
#
# Table name: ingredients
#
#  id               :integer          not null, primary key
#  name             :string
#  image_url        :string
#  food_category_id :integer
#  vegetarian       :boolean
#  vegan            :boolean
#  celiac           :boolean
#  diabetic         :boolean
#  calories         :integer
#  proteins         :integer
#  carbohydrates    :integer
#  fats             :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Ingredient < ActiveRecord::Base
  belongs_to :food_category

  validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :image_url, presence: true, uniqueness: true
  validates :food_category_id, presence: true, numericality: { only_integer: true }
  validates :vegetarian, presence: true, inclusion: { in: [true, false] }
  validates :vegan, presence: true, inclusion: { in: [true, false] }
  validates :celiac, presence: true, inclusion: { in: [true, false] }
  validates :diabetic, presence: true, inclusion: { in: [true, false] }
  validates :calories, presence: true, numericality: true
  validates :proteins, presence: true, numericality: true
  validates :carbohydrates, presence: true, numericality: true
  validates :fats, presence: true, numericality: true

  validates :food_category, presence: true

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end
end
