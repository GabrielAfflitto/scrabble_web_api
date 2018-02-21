require 'rails_helper'

describe "user can validate a word" do
  context "when a user types a word into the text box" do
    it "should let them know if it's a valid word or not" do
      visit root_path

      fill_in :q, with: "foxes"
      click_on "Validate Word"

      expect(page).to have_content("foxes is a valid word and its root form is fox")
    end
  end

  it "should display a different message for a non valid word" do
    visit root_path

    fill_in :q, with: "foxez"
    click_on "Validate Word"

    expect(page).to have_content("foxez is not a valid word")
  end
end
