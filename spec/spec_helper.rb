require('rspec')
require('pg')
require('client')
require('stylist')
require('pry')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
  end
end

def test_stylist_one
  Stylist.new({
    :id => nil,
    :first_name => "Paul",
    :last_name => "Mitchell",
    :date_of_employment => "1999-01-28 00:00:00",
    :certification_from => "Beauty School Drop Outs",
    :certification_completed => "1989-01-28 00:00:00"
    })
end

def test_stylist_two
  Stylist.new({
    :id => nil,
    :first_name => "Sponge Bob",
    :last_name => "Square Pants",
    :date_of_employment => "2014-01-28 00:00:00",
    :certification_from => "Mr Crabs Beauty",
    :certification_completed => "2005-01-28 00:00:00"
    })
end


def test_client_one
  Client.new({
    :id => nil,
    :first_name => "Plankton",
    :last_name => "Smith",
    :hair_style => "high and tight",
    :preferred_appointment => "Mornings",
    :stylist_id => 1
    })
end

def test_client_two
  Client.new({
    :id => nil,
    :first_name => "Mr",
    :last_name => "Crabbs",
    :hair_style => "business up front party in the back",
    :preferred_appointment => "lunch time",
    :stylist_id => 2
    })
end

def test_client_three
  Client.new({
    :id => nil,
    :first_name => "Sandy",
    :last_name => "Adams",
    :hair_style => "high and tight",
    :preferred_appointment => "Mornings",
    :stylist_id => 0
    })
end
