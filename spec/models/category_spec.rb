require 'rails_helper'

describe Category, type: :model do
  describe "relationships" do
    it {should have_many(:jobs)}
  end
end
