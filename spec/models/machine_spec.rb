require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
    it ".average_price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = Snack.create!(name: "Pizza", price: 2.22)
      snack_2 = Snack.create!(name: "Candy", price: 3.22)
      snack_3 = Snack.create!(name: "Fish", price: 4.22)
      dons.snacks << [snack_1, snack_2, snack_3]

      expect(dons.average_price).to eq(3.22)
    end
  end
end
