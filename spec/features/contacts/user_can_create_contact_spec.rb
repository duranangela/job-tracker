require "rails_helper"

describe 'a user visits a company show page' do
  it 'user can create new contacts' do
    company = Company.create(name: "OfficeDepot")

    visit company_path(company)

    fill_in 'contact[full_name]', with: 'John Boe'
    fill_in 'contact[position]', with: 'Manager'
    fill_in 'contact[email]', with: 'johnboe@yahoo.com'
    within('.contacts') do
      click_on 'Create'
    end

    expect(page).to have_content('John Boe')
    expect(page).to have_content('Manager')
    expect(page).to have_content('johnboe@yahoo.com')
  end
end
