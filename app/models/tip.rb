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
  belongs_to :recipe

  validates :username, presence: true, length: { in: 5..15 }
  validates :recipe_id, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { in: 5..300 }

  def user
    User.find_by_username(self.username)
  end
end
