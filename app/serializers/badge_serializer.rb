class BadgeSerializer < ActiveModel::Serializer
  attributes :name, :description, :image_url
end
