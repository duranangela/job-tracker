require 'rails_helper'

describe 'user sees one category' do
  scenario 'user sees a category' do
    category1 = Category.create(title: "Development")
    company1 = Company.create(name: "HSBC")
    company2 = Company.create(name: "Amazon")
    category1.jobs.create(title: "Developer", level_of_interest: 67, city: "Boulder", company_id: company1.id)
    category1.jobs.create(title: "QA Analyst", level_of_interest: 95, city: "Longmont", company_id: company2.id)

    visit category_path(category1)

    expect(page).to have_content(category1.title)
    expect(page).to have_content("Developer")
    # expect(page).to have_content(company1.name)
    expect(page).to have_content("QA Analyst")
    # expect(page).to have_content(company2.name)
  end
end
