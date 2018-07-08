class Comment < ApplicationRecord

  belongs_to :job

  validates_presence_of :content

  def self.order_by_date
    order('created_at DESC')
  end

end
