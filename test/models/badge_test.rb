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

require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
