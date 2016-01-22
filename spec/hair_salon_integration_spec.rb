require('capybara/rspec')
require('./app')
require('spec_helper')

DB = PG.connect({:dbname => 'hair_salon_test'})

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('CRUD for clients', {:type => :feature}) do
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

describe('CRUD for stylist', {:type => :feature}) do
  it('allows the salon owner to add a stylist') do
    visit('/')
    click_link('Stylist')
    click_link('Create New Stylist')
    fill_in('first_name', :with => 'Joy')
    fill_in('last_name', :with => 'Divison')
    fill_in('date_of_employment', :with => '1999-01-28 00:00:00')
    fill_in('certification_from', :with => 'Beauty School Drop Outs')
    fill_in('certification_completed', :with => '1999-01-28 00:00:00')
    click_button('Submit')
    expect(page).to(have_content('Joy'))
  end

  it('allows the salon owner to view a stylist') do
    stylist = test_stylist_one
    stylist.save
    visit("/stylist/#{stylist.id}/show")
    expect(page).to(have_content("#{stylist.first_name}"))
    expect(page).to(have_content("#{stylist.last_name}"))
    expect(page).to(have_content("#{stylist.date_of_employment}"))
    expect(page).to(have_content("#{stylist.certification_from}"))
    expect(page).to(have_content("#{stylist.certification_completed}"))
  end

  it('allows the salon owner to edit a stylist') do
    stylist = test_stylist_one
    stylist.save
    visit("/stylist/#{stylist.id}/edit")
    fill_in('certification_from', :with => 'Beauty Perm')
    click_button('Submit')
    visit("/stylist/#{stylist.id}/show")
    expect(page).to(have_content('Beauty Perm'))
  end

  it('allows the salon owner to delete a stylist') do
    stylist = test_stylist_two
    stylist.save
    visit("/stylists")
    expect(page).to(have_content('Sponge Bob'))
    click_link('Delete')
    expect(page).to_not (have_content('Sponge Bob'))
  end
end
