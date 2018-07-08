require 'rails_helper'

describe 'user visits dashboard page' do
  it 'user sees count of jobs by level of interest' do
    company = Company.create!(name: "ESPN")
      category1 = Category.create(title: "jobs")
      company.jobs.create!(title: "Developer", level_of_interest: 3, city: "Denver", category_id: category1.id, company_id: company.id)
      company.jobs.create!(title: "Game Dev", level_of_interest: 4, city: "Denver", category_id: category1.id, company_id: company.id)
      company.jobs.create!(title: "Analyst", level_of_interest: 4, city: "Boulder", category_id: category1.id, company_id: company.id)

      visit dashboard_path

      expect(page).to have_content("Interest level 4 = 2 job(s)")
      expect(page).to have_content("Interest level 3 = 1 job(s)")
  end
end
