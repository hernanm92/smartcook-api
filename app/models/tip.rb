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
