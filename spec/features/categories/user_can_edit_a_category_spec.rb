require 'rails_helper'

describe 'user can edit a category' do
  it 'user can edit a category' do
    category = Category.create(title: "Developer")
    visit edit_category_path(category)

    fill_in "category[title]", with: "QA Analyst"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("QA Analyst")
    expect(page).to_not have_content("Developer")
  end
end
