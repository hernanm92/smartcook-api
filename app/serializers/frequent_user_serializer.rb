# == Schema Information
#
# Table name: frequent_users
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  frecuent_user_id  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  username          :string
#  frecuent_username :string
#

class FrequentUserSerializer < ActiveModel::Serializer
  attributes :id
end
