require 'rails_helper'

describe 'user can delete category' do
  it 'user can delete category' do
    category = Category.create(title: "Development")

    visit categories_path

    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("#{category.title} was successfully deleted!")
  end
end
