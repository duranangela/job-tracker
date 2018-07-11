class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_three_company_by_interest
    select("companies.*, avg(level_of_interest) AS avg_level")
    .joins(:jobs)
    .group(:company_id, :id)
    .order('avg_level DESC')
    .limit(3)
  end

  def job_avg_lvl_interest
    jobs.average(:level_of_interest)
  end

end
