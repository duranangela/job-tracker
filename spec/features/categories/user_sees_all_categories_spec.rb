require "rails_helper"

describe "user sees all categories" do
  scenario "a user sees all categories" do
    category1 = Category.create(title: "Development")
    category2 = Category.create(title: "QA")

    visit categories_path

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
  end
end
