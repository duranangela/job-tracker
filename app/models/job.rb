class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_level_of_interest(level_of_interest)
    hash = group(:level_of_interest).count
    hash[level_of_interest]
  end

end
