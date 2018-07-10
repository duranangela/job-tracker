require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(title: "jobs")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category1)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category1)

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end

  it 'can see visit a page to view a list of the jobs sorted by level of interest' do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(title: "jobs")
    job1 = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category: category1)
    job2 = company.jobs.create(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category1)
    job3 = company.jobs.create(title: "Analyst", level_of_interest: 40, city: "Seattle", category: category1)

    visit '/jobs?sort=interest'

    expect(page).to have_content("Level of interest #{job1.level_of_interest} : #{job1.title} #{job2.title}")
    expect(page).to have_content("Level of interest #{job3.level_of_interest} : #{job3.title}")
  end

  it 'user sees jobs listed by city query' do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(title: "jobs")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 5, city: "Denver", category: category1)
    job2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 4, city: "New York City", category: category1)

    visit '/jobs?location=Denver'

    expect(page).to have_content(job1.title)
    expect(page).to_not have_content(job2.title)
  end

  it 'user sees jobs listed by category query' do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(title: "jobs")
    category2 = Category.create(title: 'more jobs')
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 5, city: "Denver", category: category1)
    job2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 4, city: "New York City", category: category2)

    visit '/jobs?category=jobs'

    expect(page).to have_content(job1.title)
    expect(page).to_not have_content(job2.title)
  end
end
