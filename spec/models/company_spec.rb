require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
    it {should have_many(:contacts)}
  end

describe 'class methods' do
  it "find three top companies by job level of interest" do
    category1 = Category.create(title: "jobs")
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create(name: 'Kohls')
    Job.create!(title: "Developer", level_of_interest: 3, city: "Denver", category_id: category1.id, company_id: company_1.id)
    Job.create!(title: "Game Dev", level_of_interest: 5, city: "Denver", category_id: category1.id, company_id: company_1.id)
    Job.create!(title: "Analyst", level_of_interest: 2, city: "Boulder", category_id: category1.id, company_id: company_2.id)

    expected_result = [company_1, company_2]

    expect(Company.top_three_company_by_interest).to eq(expected_result)
  end
end

end
