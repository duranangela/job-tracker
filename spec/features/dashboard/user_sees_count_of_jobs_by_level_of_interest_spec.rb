require 'rails_helper'

describe 'user visits dashboard page' do
  it 'user sees count of jobs by level of interest' do
    company = Company.create!(name: "ESPN")
      category1 = Category.create(title: "jobs")
      company = Company.create(name: 'Kohls')
      company.jobs.create!(title: "Developer", level_of_interest: 3, city: "Denver", category_id: category1.id, company_id: company.id)
      company.jobs.create!(title: "Game Dev", level_of_interest: 4, city: "Denver", category_id: category1.id, company_id: company.id)
      company.jobs.create!(title: "Analyst", level_of_interest: 4, city: "Boulder", category_id: category1.id, company_id: company.id)

      visit dashboard_index_path

      expect(page).to have_content("Interest level 4 = 2 job(s)")
      expect(page).to have_content("Interest level 3 = 1 job(s)")
  end

  it "user sees top three companies based on interest level with their average interest level" do
    category1 = Category.create(title: "jobs")
      company_1 = Company.create!(name: "ESPN")
      company_2 = Company.create(name: 'Kohls')
      company_1.jobs.create!(title: "Developer", level_of_interest: 3, city: "Denver", category_id: category1.id, company_id: company_1.id)
      company_1.jobs.create!(title: "Game Dev", level_of_interest: 5, city: "Denver", category_id: category1.id, company_id: company_1.id)
      company_2.jobs.create!(title: "Analyst", level_of_interest: 2, city: "Boulder", category_id: category1.id, company_id: company_2.id)

      visit dashboard_index_path

      expect(page).to have_text("#{company_1.name} #{company_2.name}")
  end
end
