class Ingredient < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :image_url, presence: true, uniqueness: true
  validates :category_id, presence: true, numericality: { only_integer: true }
  validates :vegetarian, presence: true, inclusion: { in: [true, false] }
  validates :vegan, presence: true, inclusion: { in: [true, false] }
  validates :celiac, presence: true, inclusion: { in: [true, false] }
  validates :diabetic, presence: true, inclusion: { in: [true, false] }
  validates :calories, presence: true, numericality: true
  validates :proteins, presence: true, numericality: true
  validates :carbohydrates, presence: true, numericality: true
  validates :fats, presence: true, numericality: true

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end
end
