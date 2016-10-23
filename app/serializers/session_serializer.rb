# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#  token      :string
#  password   :string
#

class SessionSerializer < ActiveModel::Serializer
  attributes :username, :token
end
