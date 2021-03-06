require 'rails_helper'

describe "User visits job page" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN")
    category1 = Category.create(title: "jobs")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category1)
    job2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category1)

    visit job_path(job1)
    click_link "Delete"

    expect(page).to have_content("Developer was successfully deleted!")
    expect(page).to have_content(job2.title)
  end
end
