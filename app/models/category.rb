class Category < ApplicationRecord
  has_many :jobs, dependent: :destroy

  validates :title, uniqueness: true
end
