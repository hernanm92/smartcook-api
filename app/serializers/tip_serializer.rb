# == Schema Information
#
# Table name: tips
#
#  id         :integer          not null, primary key
#  username   :string
#  recipe_id  :integer
#  description :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TipSerializer < ActiveModel::Serializer
  attributes :created_at, :description, :username, :recipe_id
end
