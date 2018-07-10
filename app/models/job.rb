class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_level_of_interest
    group(:level_of_interest).order('level_of_interest DESC').count
  end

  def self.sort_level_interest
    order('level_of_interest DESC')
  end

  def self.sort_by_city
    all.group(:city).count
  end
end
