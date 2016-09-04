# == Schema Information
#
# Table name: badges_per_users
#
#  id         :integer          not null, primary key
#  badge_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BadgesPerUserSerializer < ActiveModel::Serializer
  attributes :id
end
