class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :email, :avatar, :birthdate, :gender, :vegetarian, :vegan, :celiac, :diabetic
end
