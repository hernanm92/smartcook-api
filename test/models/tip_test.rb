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

require 'test_helper'

class TipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
