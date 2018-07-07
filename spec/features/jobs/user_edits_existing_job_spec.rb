require 'rails_helper'

describe "User visits job page" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)
    click_link('Edit')

    fill_in 'job[title]', with: 'Junior Developer'
    fill_in 'job[description]', with: 'Pretty cool'
    fill_in 'job[level_of_interest]', with: 75
    fill_in 'job[city]', with: 'Boulder'
    click_button 'Update'

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("Junior Developer")
    expect(page).to have_content("Pretty cool")
    expect(page).to have_content(75)
    expect(page).to have_content("Boulder")
  end
end
