class DashboardController < ApplicationController

  def index
    @jobs = Job.all
    # require "pry"; binding.pry
    @level_of_interest = Job.sort_by_level_of_interest
  end

end
