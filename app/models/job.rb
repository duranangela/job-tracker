class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.sort_by_level_of_interest
    group(:level_of_interest).order('level_of_interest DESC').count
  end

  def self.sort_level_interest
    order('level_of_interest DESC')
  end

  def self.sort_by_city
    all.group(:city).count
  end

  def self.city_sort
    order('city ASC')
  end

  def self.location_params(params)
    where(city: params[:location])
  end

  def self.category_params(params)
    where(category_id:(Category.where(title: params[:category]).first.id))
  end
end
