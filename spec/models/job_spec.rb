require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        computers = Category.new(title: "Job")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: computers)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
    it {should belong_to(:category)}
    it {should have_many(:comments)}
  end

  describe 'class methods' do
    it 'can count jobs by level of interest' do
      category1 = Category.create(title: "jobs")
      company = Company.create(name: 'Kohls')
      company.jobs.create!(title: "Developer", level_of_interest: 3, city: "Denver", category_id: category1.id, company_id: company.id)
      company.jobs.create!(title: "Game Dev", level_of_interest: 4, city: "Denver", category_id: category1.id, company_id: company.id)
      company.jobs.create!(title: "Analyst", level_of_interest: 4, city: "Boulder", category_id: category1.id, company_id: company.id)

      expected_result = {3=>1, 4=>2}

      expect(Job.sort_by_level_of_interest).to eq(expected_result)
    end
    it 'can sort by city' do
      category1 = Category.create(title: "jobs")
      company = Company.create(name: 'Kohls')
      job1 = company.jobs.create!(title: "Developer", level_of_interest: 3, city: "Denver", category_id: category1.id, company_id: company.id)
      job2 = company.jobs.create!(title: "Game Dev", level_of_interest: 4, city: "Denver", category_id: category1.id, company_id: company.id)
      job3 = company.jobs.create!(title: "Analyst", level_of_interest: 4, city: "Boulder", category_id: category1.id, company_id: company.id)

      expected_result = {'Denver'=>2, 'Boulder'=>1}

      expect(Job.sort_by_city).to eq(expected_result)
    end
  end
end
