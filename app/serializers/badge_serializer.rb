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
#  amount      :integer
#  badge_type  :string
#

class BadgeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url, :badge_type, :amount
end
