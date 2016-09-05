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

class FrequentUserSerializer < ActiveModel::Serializer
  attributes :username, :frequent_username
end
