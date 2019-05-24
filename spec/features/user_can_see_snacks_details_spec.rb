require 'rails_helper'

RSpec.describe "When a user visits the snacks show page", type: :feature do
  before :each do
    @sam = Owner.create(name: "Sam's Snacks")
    @don = @sam.machines.create(location: "Don's Mixed Drinks")
    @turing = @sam.machines.create(location: "Turing Basement")
    @snack_1 = Snack.create!(name: "Pizza", price: 2.22)
    @snack_2 = Snack.create!(name: "Candy", price: 3.22)
    @snack_3 = Snack.create!(name: "Fish", price: 4.22)
    @don.snacks << [@snack_1, @snack_2, @snack_3]
    @turing.snacks << [@snack_1, @snack_3]
  end

  scenario "I see the attributes of that snack" do

    visit snack_path(@snack_1)

    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content(@snack_1.price)
    expect(page).to have_content(@don.location)
    expect(page).to have_content(@turing.location)
    expect(page).to have_content(@don.average_price)
    expect(page).to have_content(@turing.average_price)
    expect(page).to have_content(@don.count)
    expect(page).to have_content(@turing.count)
  end
end
