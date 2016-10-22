#
# Table name: tip
#
#  id          :integer          not null, primary key
#  description :string
#  username    :string

class Tip < ActiveRecord::Base
  validates :description, presence: true
  validates :username, presence: true
end
