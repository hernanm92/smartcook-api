# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string
#  image_url   :string
#  stars       :float
#  validated   :boolean
#  description :text
#  vegetarian  :boolean
#  vegan       :boolean
#  celiac      :boolean
#  diabetic    :boolean
#  steps       :text
#  tips        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ActiveRecord::Base
  has_many :ingredients_per_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredients_per_recipes

  validates :name, presence: true, uniqueness: true, length: { in: 5..50 }
  validates :description, presence: true, length: { in: 5..200 }
  validates :steps, presence: true # , length: { in: 5..50 }

  after_initialize :set_defaults
  after_create :set_restrictions
  after_update :set_restrictions # solo si se modifican ingredientes

  def self.find_by!(params)
    params[:username] = params.delete(:id) if params[:id]
    super params
  end

  private

  def set_defaults
    self.steps ||= []
    self.tips ||= []
  end

  def set_restrictions
    self.vegetarian ||= vegetarian?
    self.vegan ||= vegan?
    self.celiac ||= celiac?
    self.diabetic ||= diabetic?
  end

  def vegetarian?
    ingredients.all?(&:vegetarian)
  end

  def vegan?
    ingredients.all?(&:vegan)
  end

  def celiac?
    ingredients.all?(&:celiac)
  end

  def diabetic?
    ingredients.all?(&:diabetic)
  end
end
