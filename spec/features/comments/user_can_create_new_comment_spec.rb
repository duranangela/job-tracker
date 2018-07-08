require 'rails_helper'

describe "a user can add new comment" do
  scenario "user can create new comment" do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(title: "jobs")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category1, company: company)

    visit job_path(job)

    fill_in "comment[content]", with: 'Called back manager'
    click_button 'Create Comment'

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content('Called back manager')
  end
end
