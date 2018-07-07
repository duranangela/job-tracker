require 'rails_helper'

describe 'user can create a new category' do
  it 'create new category' do
    visit new_category_path

    fill_in "category[title]", with: "BBC"
    click_button "Create"

    expect(current_path).to eq(category_path(Category.last.id))
    expect(page).to have_content("BBC")
  end
end
