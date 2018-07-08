require 'rails_helper'

describe "a user can see all comments for a job" do
  scenario "user sees all comments for a job" do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(title: "jobs")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category1, company: company)
    comment1 = Comment.create!(content: "Talk to manager", job: job)
    comment2 = Comment.create!(content: "Code challenge", job: job)

    visit job_path(job)

    expect(page).to have_content("#{comment1.content}")
    expect(page).to have_content("#{comment2.content}")
  end
  scenario "user sees all comments in descending order" do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(title: "jobs")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category1, company: company)
    comment1 = Comment.create!(content: "Talk to manager", job: job)
    comment2 = Comment.create!(content: "Code challenge", job: job)

    visit job_path(job)

    page.body.index(comment2.content).should < page.body.index(comment1.content)
  end
end
