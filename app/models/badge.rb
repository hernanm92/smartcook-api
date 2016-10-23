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
#  type        :string
#  amount      :integer
#

class Badge < ActiveRecord::Base
  has_many :badges_per_users, dependent: :destroy, class_name: 'BadgePerUser'
  has_many :users, through: :badges_per_users

  validates :name, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :description, presence: true, length: { in: 5..100 }
end
