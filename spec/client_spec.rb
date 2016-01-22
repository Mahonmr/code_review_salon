require ('spec_helper')

describe(Client) do
  describe('attributes of client') do
    it('will return information using attr_reader logic') do
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
      expect(Client.all).to(eq([]))
    end

    it('will select all clients from DB and store in an array') do
      test_client_one.save
      test_client_two.save
      expect(Client.all.length).to eq(2)
    end
  end

  describe('#save') do
    it('saves input to database') do
      client = test_client_one
      client.save
      expect(Client.all).to eq([client])
    end
  end

  describe('#update') do
    it('updates changed attributes to the database for specfic record') do
      client = test_client_one
      client.save
      client.update({"first_name" => 'Plankton', "last_name" => 'Smith', "hair_style" => 'to the side',\
         "preferred_appointment" => 'early afternoon', "stylist_id" => 1})
      expect(client.first_name).to eq('Plankton')
      expect(client.last_name).to eq('Smith')
      expect(client.hair_style).to eq('to the side')
      expect(client.preferred_appointment).to eq('early afternoon')
      expect(client.stylist_id).to eq(1)
    end
  end

  describe('#delete') do
    it('deletes record from database') do
      client = test_client_one
      client.save
      client_two = test_client_two
      client_two.save
      client.delete
      expect(Client.all()).to(eq([client_two]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same information") do
      stylist_one = test_stylist_one
      stylist_two = test_stylist_one
      expect(stylist_one).to eq(stylist_two)
    end
  end
end
