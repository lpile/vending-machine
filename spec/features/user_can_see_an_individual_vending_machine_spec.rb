require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'I see the name of all of the snacks associated with that vending machine along with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = Snack.create!(name: "Pizza", price: 2.22)
    snack_2 = Snack.create!(name: "Candy", price: 3.22)
    snack_3 = Snack.create!(name: "Fish", price: 4.22)
    dons.snacks << [snack_1, snack_2, snack_3]

    visit machine_path(dons)
    save_and_open_page
    expect(page).to have_content("#{snack_1.name}: #{snack_1.price}")
    expect(page).to have_content("#{snack_2.name}: #{snack_2.price}")
    expect(page).to have_content("#{snack_3.name}: #{snack_3.price}")
  end
end
