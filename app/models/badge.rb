# == Schema Information
#
# Table name: badges
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  amount      :integer
#  badge_type  :string
#

class Badge < ActiveRecord::Base
  has_many :badges_per_users, dependent: :destroy, class_name: 'BadgePerUser'
  has_many :users, through: :badges_per_users

  validates :name, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :description, presence: true, length: { in: 5..100 }
  validates :badge_type, presence: true, inclusion: { in: ['vegan', 'vegetarian', 'celiac', 'diabetic', 'validate'] }
  validates :amount, presence: true, length: { in: 1..100 }
end
