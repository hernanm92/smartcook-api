class RecipesPerUser < ActiveRecord::Base
  belongs_to :recipes
  belongs_to :users

  validates :recipe_id, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :favorite, presence: true, inclusion: { in: [true, false] }
  validates :owned, presence: true, inclusion: { in: [true, false] }
  validates :vote, numericality: { only_integer: true }, inclusion: { in: [1, 2, 3, 4, 5] }

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end
end
