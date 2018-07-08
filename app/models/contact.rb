class Contact < ApplicationRecord
  belongs_to :company

  validates_presence_of :full_name, :position, :email
end
