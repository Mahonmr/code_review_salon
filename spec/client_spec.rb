require ('spec_helper')

describe(Client) do
  describe('attributes of client') do
    it('will return information when inputted') do
      client = test_client_one
      expect(client.id).to eq(nil)
      expect(client.first_name).to  eq('Plankton')
      expect(client.last_name).to eq('Smith')
      expect(client.hair_style).to eq('high and tight')
      expect(client.preferred_appointment).to eq('Mornings')
      expect(client.stylist_id).to eq(1)
    end
  end

  describe('.all') do
    it('will select all clients from DB and store in an array, but empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves input to database') do
      client = test_client_one
      client.save
      expect(Client.all).to eq([client])
    end
  end

  # describe('#update') do
  #   it('updates changed attributes to the database for specfic record') do
  #     stylist = test_stylist_one
  #     stylist.save
  #     stylist.update({"first_name" => 'Paul', "last_name" => 'Mitchell', "date_of_employment" => '1999-01-28 00:00:00',\
  #        "certification_from" => 'Rick Ross School of Beauty', "certification_completed" => '1989-01-28 00:00:00'})
  #     expect(stylist.first_name).to eq('Paul')
  #     expect(stylist.last_name).to eq('Mitchell')
  #     expect(stylist.date_of_employment).to eq('1999-01-28 00:00:00')
  #     expect(stylist.certification_from).to eq('Rick Ross School of Beauty')
  #     expect(stylist.certification_completed).to eq('1989-01-28 00:00:00')
  #   end
  # end
  #
  # describe('#delete') do
  #   it('deletes record from database') do
  #     stylist = test_stylist_one
  #     stylist.save
  #     stylist_two = test_stylist_two
  #     stylist_two.save
  #     stylist.delete
  #     expect(Stylist.all()).to(eq([stylist_two]))
  #   end
  # end
  #
  describe("#==") do
    it("is the same stylist if it has the same information") do
      stylist_one = test_stylist_one
      stylist_two = test_stylist_one
      expect(stylist_one).to eq(stylist_two)
    end
  end
end
