# == Schema Information
#
# Table name: tips
#
#  id          :integer          not null, primary key
#  description :text
#  recipe_id   :integer
#  username    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TipSerializer < ActiveModel::Serializer
  attributes :created_at, :description, :username, :recipe_id
end
