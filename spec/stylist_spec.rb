require ('spec_helper')

describe(Stylist) do
  describe('attributes of stylist') do
    it('will return information when inputted') do
      stylist = test_stylist_one
      expect(stylist.id).to(eq(nil))
      expect(stylist.first_name).to(eq('Paul'))
      expect(stylist.last_name).to(eq('Mitchell'))
      expect(stylist.date_of_employment).to(eq('1999-01-28 00:00:00'))
      expect(stylist.certification_from).to(eq('Beauty School Drop Outs'))
      expect(stylist.certification_completed).to(eq('1989-01-28 00:00:00'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves input to database') do
      stylist = test_stylist_one
      stylist.save
      expect(Stylist.all).to eq([stylist])
    end
  end

  describe('#update') do
    it('updates changed attributes to the database for specfic record') do
      stylist = test_stylist_one
      stylist.save
      stylist.update({"first_name" => 'Paul', "last_name" => 'Mitchell', "date_of_employment" => '1999-01-28 00:00:00',\
         "certification_from" => 'Rick Ross School of Beauty', "certification_completed" => '1989-01-28 00:00:00'})
      expect(stylist.first_name).to eq('Paul')
      expect(stylist.last_name).to eq('Mitchell')
      expect(stylist.date_of_employment).to eq('1999-01-28 00:00:00')
      expect(stylist.certification_from).to eq('Rick Ross School of Beauty')
      expect(stylist.certification_completed).to eq('1989-01-28 00:00:00')
    end
  end

  describe('#delete') do
    it('deletes record from database') do
      stylist = test_stylist_one
      stylist.save
      stylist_two = test_stylist_two
      stylist_two.save
      stylist.delete
      expect(Stylist.all()).to(eq([stylist_two]))
    end
  end
  #
  # describe("#==") do
  #   it("is the same book if it has the same information") do
  #     book1 = create_test_book
  #     book2 = create_test_book
  #     expect(book1).to(eq(book2))
  #   end
  # end
  #
  # describe('.filter') do
  #   it('filters based on user preference') do
  #     book1 = create_test_book
  #     book1.save
  #     book2 = create_test_book_2
  #     book2.save
  #     expect(Book.filter('Fiction')).to(eq([book2]))
  #   end
  # end
end
