# == Schema Information
#
# Table name: frequent_users
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  frequent_user_id  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  username          :string
#  frequent_username :string
#

class FrequentUser < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :frequent_user, class_name: 'User', foreign_key: 'frequent_user_id'

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :frequent_user_id, presence: true, numericality: { only_integer: true }
  validates :username, presence: true
  validates :frequent_username, presence: true

  def update!(params)
    params[:user_id] = user_id
    params[:frequent_user_id] = frequent_user_id
    super params
  end

  def self.create!(params)
    params[:user_id] = User.find_by_username(params[:username]).id
    params[:frequent_user_id] = User.find_by_username(params[:frequent_username]).id
    super params
  end
end
