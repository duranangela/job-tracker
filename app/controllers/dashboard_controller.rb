class DashboardController < ApplicationController

  def index
    @jobs = Job.all
    @companies = Company.all
    @level_of_interest = Job.sort_by_level_of_interest
    @top_three_companies = Company.top_three_company_by_interest
    @city_sort = Job.sort_by_city
  end

end
