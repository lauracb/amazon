# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
end
