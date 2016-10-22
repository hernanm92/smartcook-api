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
#  admin      :boolean
#

class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :email, :avatar, :birthdate, :gender, :vegetarian, :vegan, :celiac, :diabetic, :admin
end
