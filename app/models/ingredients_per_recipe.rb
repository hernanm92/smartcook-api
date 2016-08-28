class IngredientsPerRecipe < ActiveRecord::Base
  validates :ingredient_id, presence: true, numericality: { only_integer: true }
  validates :recipe_id, presence: true, numericality: { only_integer: true }
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true, length: { in: 1..15 }

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end
end
