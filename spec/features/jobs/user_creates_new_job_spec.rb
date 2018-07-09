require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    Company.create(name: 'ESPN')
    Category.create(title: 'Finance')

    visit new_job_path

    select "Finance", from: "Category"
    fill_in "job[title]", with: "Developer"
    select "ESPN", from: 'Company'
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 4
    fill_in "job[city]", with: "Denver"

    click_button "Create Job"

    expect(current_path).to eq("/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("4")
    expect(page).to have_content("Denver")
  end
end
