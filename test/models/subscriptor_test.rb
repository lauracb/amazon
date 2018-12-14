# == Schema Information
#
# Table name: subscriptors
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SubscriptorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Subscriptor should have a name" do
    @subscriptor = Subscriptor.new
    assert_not @subscriptor.save #indica que no se pudo guardar la variable de instancia
  end
end
