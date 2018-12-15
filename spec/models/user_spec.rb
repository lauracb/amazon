#Este archivo debe tener la palabra _spec.rb para que pueda reconocer que el test es con rspec
require 'rails_helper'

RSpec.describe User, type: :model do
    context "valid Factory" do
        it "has a valid factory" do
            expect(FactoryBot.build(:user)).to be_valid
        end
    end
end