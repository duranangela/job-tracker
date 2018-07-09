require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(title: "jobs")
    job = company.jobs.create!(title: "Developer", level_of_interest: 3, city: "Denver", category: category1)

    visit jobs_path
    click_link(job.title)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("3")
    expect(page).to have_content(category1.title)
  end
end
