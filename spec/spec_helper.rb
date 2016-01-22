require('rspec')
require('pg')
require('client')
require('stylist')

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


# def create_test_patron
#   Patron.new({
#     :id => nil,
#     :name => "Mark"
#     })
# end
#
# def create_test_patron_2
#   Patron.new({
#     :id => nil,
#     :name => "Jeff"
#     })
# end
