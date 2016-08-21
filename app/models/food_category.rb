class FoodCategory < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 5..15 }

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end
end