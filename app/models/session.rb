# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#  token      :string
#

class Session < ActiveRecord::Base
  require 'securerandom'

  validate :validate_user

  def self.find_by!(params)
    params[:username] = params.delete(:id) if params[:id]
    super params
  end

  def self.create!(params)
    params[:token] = SecureRandom.hex(32)
    super params
  end

  private

  def validate_user
    user = User.find_by_username username
    raise StandardError, 'Username or password are wrong' unless user && (user.password == password)
  end
end
