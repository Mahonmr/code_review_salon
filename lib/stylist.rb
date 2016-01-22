class Stylist
  attr_reader(:id, :first_name, :last_name, :date_of_employment,
    :certification_from, :certification_completed)

  def initialize(attribute)
    @id = attribute.fetch(:id)
    @first_name = attribute.fetch(:first_name)
    @last_name = attribute.fetch(:last_name)
    @date_of_employment = attribute.fetch(:date_of_employment)
    @certification_from = attribute.fetch(:certification_from)
    @certification_completed = attribute.fetch(:certification_completed)
  end

  def self.all
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    Stylist.map_results_to_objects(returned_stylists)
  end

  def self.create(params)
    Stylist.new({
      :id => nil,
      :first_name => params.fetch("first_name"),
      :last_name => params.fetch("last_name"),
      :date_of_employment => params.fetch("date_of_employment"),
      :certification_from => params.fetch("certification_from"),
      :certification_completed => params.fetch("certification_completed"),
      })
  end

  def save
    saved_stylist = DB.exec("INSERT INTO stylists (first_name, last_name, date_of_employment, certification_from, certification_completed)
      VALUES ('#{@first_name}', '#{@last_name}', '#{@date_of_employment}', '#{@certification_from}', '#{@certification_completed}') RETURNING id;")
      @id = saved_stylist.first.fetch("id").to_i()
  end

  def update(attributes)
    @id = self.id
    @first_name = attributes.fetch("first_name")
    @last_name = attributes.fetch("last_name")
    @date_of_employment = attributes.fetch("date_of_employment")
    @certification_from = attributes.fetch("certification_from")
    @certification_completed = attributes.fetch("certification_completed")
    DB.exec("UPDATE stylists SET (first_name, last_name, date_of_employment, certification_from, certification_completed) \
      = ('#{@first_name}', '#{@last_name}', '#{@date_of_employment}', '#{@certification_from}', '#{@certification_completed}') WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
  end

  def self.map_results_to_objects(returned_stylists)
    stylists = []
    returned_stylists.each() do |stylist|
      stylists << Stylist.new({
        :id => stylist.fetch('id').to_i(),
        :first_name => stylist.fetch('first_name'),
        :last_name => stylist.fetch('last_name'),
        :date_of_employment => stylist.fetch('date_of_employment'),
        :certification_from => stylist.fetch('certification_from'),
        :certification_completed => stylist.fetch('certification_completed')
        })
    end
    stylists
  end

  def ==(another_stylist)
    self.id == (another_stylist.id) &&
    self.first_name == (another_stylist.first_name) &&
    self.last_name == (another_stylist.last_name) &&
    self.date_of_employment == (another_stylist.date_of_employment) &&
    self.certification_from == (another_stylist.certification_from) &&
    self.certification_completed == (another_stylist.certification_completed)
  end
end
