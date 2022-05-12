require 'rails_helper'

RSpec.describe "providers index page", type: :feature do

  it "it can show provider and all attributes" do
    provider = Provider.create(  name: "John Smith",
                                  age: 23,
                                  doctor: true,
                                  review_rating: 4
                                )
  visit "/providers"

  expect(page).to have_content(provider.name)
  expect(page).to have_content(provider.age)
  expect(page).to have_content(provider.doctor)
  expect(page).to have_content(provider.review_rating)


  end
end
