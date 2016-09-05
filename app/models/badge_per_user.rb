# == Schema Information
#
# Table name: badges_per_users
#
#  id         :integer          not null, primary key
#  badge_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BadgePerUser < ActiveRecord::Base
  self.table_name = 'badges_per_users'

  belongs_to :badge, class_name: 'Badge'
  belongs_to :user, class_name: 'User'

  validates :badge_id, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :username, presence: true

  def update!(params)
    params[:user_id] = user_id
    super params
  end

  def self.create!(params)
    params[:user_id] = User.find_by_username(params[:username]).id
    super params
  end
end
