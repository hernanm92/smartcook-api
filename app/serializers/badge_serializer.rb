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

class BadgeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url
end
