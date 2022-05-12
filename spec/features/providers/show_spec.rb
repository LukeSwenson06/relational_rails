require 'rails_helper'

RSpec.describe "specific provider and show attributes ", type: :feature do

  it "can show 1 provider by ID and display all attributes" do
    provider = Provider.create(  name: "John Smith",
                                  age: 23,
                                  doctor: true,
                                  review_rating: 4
                                )
  visit "/providers/#{provider.id}"

  expect(page).to have_content(provider.name)
  expect(page).to have_content(provider.age)
  expect(page).to have_content(provider.doctor)
  expect(page).to have_content(provider.review_rating)
  end
end
