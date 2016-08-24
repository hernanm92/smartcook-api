# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  name       :string
#  email      :string
#  password   :string
#  avatar     :string
#  birthdate  :datetime
#  gender     :string
#  vegetarian :boolean
#  vegan      :boolean
#  celiac     :boolean
#  diabetic   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length: { in: 5..15 }
  validates :name, presence: true, length: { in: 5..30 }
  validates :email, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :password, presence: true, length: { in: 5..30 }

  after_initialize :set_defaults

  def self.find_by!(params)
    params[:username] = params.delete(:id) if params[:id]
    super params
  end

  private

  def set_defaults
    self.vegetarian = false if vegetarian.nil?
    self.vegan = false if vegan.nil?
    self.celiac = false if celiac.nil?
    self.diabetic = false if diabetic.nil?
  end
end
