require 'rails_helper'

describe "User visits job page" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(title: "jobs")
    category2 = Category.create(title: 'other')
    job = company.jobs.create!(title: "Developer", level_of_interest: 5, city: "Denver", category: category1)

    visit job_path(job)
    click_link('Edit')

    select 'other', from: 'Category'
    fill_in 'job[title]', with: 'Junior Developer'
    fill_in 'job[description]', with: 'Pretty cool'
    fill_in 'job[level_of_interest]', with: 4
    fill_in 'job[city]', with: 'Boulder'
    click_button 'Update'

    expect(current_path).to eq("/jobs/#{job.id}")
    expect(page).to have_content("Junior Developer")
    expect(page).to have_content("Pretty cool")
    expect(page).to have_content(4)
    expect(page).to have_content("Boulder")
  end
end
