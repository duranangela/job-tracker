require 'rails_helper'

describe 'user can delete category' do
  it 'user can delete category' do
    category = Category.create(title: "Development")

    visit categories_path

    click_link "Delete"

    expect(page).to have_content("#{category.title} was successfully deleted!")
  end
end
