require 'rails_helper'

describe 'a user visits the company show page' do
  it 'user sees all contacts for a company' do
    company = Company.create(name: "OfficeDepot")
    contact1 = company.contacts.create(full_name: "Elena Dupont", position: "Manager", email: "elena_dupont@yahoo.com")
    contact2 = company.contacts.create(full_name: "Joe Bern", position: "Secretary", email: "joe_bern@yahoo.com")


    visit company_path(company)

    expect(page).to have_content(contact1.full_name)
    expect(page).to have_content(contact1.position)
    expect(page).to have_content(contact1.email)
    expect(page).to have_content(contact2.full_name)
    expect(page).to have_content(contact2.position)
    expect(page).to have_content(contact2.email)

  end
end
