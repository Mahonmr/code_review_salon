require('capybara/rspec')
require('./app')
require('spec_helper')

DB = PG.connect({:dbname => 'hair_salon_test'})

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('CRUD for Clients', {:type => :feature}) do
  it('allows the salon owner to add a client') do
    visit('/')
    click_link('Clients')
    click_link('Create New Client')
    fill_in('first_name', :with => 'Mike')
    fill_in('last_name', :with => 'Mahoney')
    fill_in('hair_style', :with => 'short')
    fill_in('preferred_appointment', :with => 'afternoons')
    click_button('Submit')
    expect(page).to(have_content('Mike'))
  end

  it('allows the salon owner to view a client') do
    client = test_client_one
    client.save
    visit("/client/#{client.id}/show")
    expect(page).to(have_content("#{client.first_name}"))
    expect(page).to(have_content("#{client.last_name}"))
    expect(page).to(have_content("#{client.hair_style}"))
    expect(page).to(have_content("#{client.preferred_appointment}"))
  end

  it('allows the salon owner to edit a client') do
    client = test_client_one
    client.save
    visit("/client/#{client.id}/edit")
    fill_in('hair_style', :with => 'long')
    click_button('Submit')
    visit("/client/#{client.id}/show")
    expect(page).to(have_content('long'))
  end

  it('allows the salon owner to delete a client') do
    client = test_client_one
    client.save
    visit("/clients")
    expect(page).to(have_content('Plankton'))
    click_link('Delete')
    expect(page).to_not (have_content('Plankton'))
  end
end
