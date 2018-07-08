require 'rails_helper'

describe Comment, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:content)}
  end
  describe 'relationships' do
    it {should belong_to(:job)}
  end
  describe 'instance methods' do
    it 'orders comments in descending order' do
      company = Company.create(name: 'ESPN')
      category = Category.create(title: 'outside')
      job = Job.create(title: 'hiking', description: 'outside', level_of_interest: 80, city: 'Denver', company_id: company.id, category_id: category.id)
      comment1 = Comment.create!(content: 'cool content', job_id: job.id)
      comment2 = Comment.create!(content: 'boring content', job_id: job.id)

      result = [comment2, comment1]

      expect(job.comments.order_by_date).to eq(result)
    end
  end
end
