class Client
  attr_reader(:id, :first_name, :last_name, :hair_style,
    :preferred_appointment, :stylist_id)

  def initialize(attribute)
    @id = attribute.fetch(:id)
    @first_name = attribute.fetch(:first_name)
    @last_name = attribute.fetch(:last_name)
    @hair_style = attribute.fetch(:hair_style)
    @preferred_appointment = attribute.fetch(:preferred_appointment)
    @stylist_id = attribute.fetch(:stylist_id)
  end

  # def self.all
  #   returned_stylists = DB.exec("SELECT * FROM stylists;")
  #   Stylist.map_results_to_objects(returned_stylists)
  # end
  #
  # def save
  #   saved_stylist = DB.exec("INSERT INTO stylists (first_name, last_name, date_of_employment, certification_from, certification_completed)
  #     VALUES ('#{@first_name}', '#{@last_name}', '#{@date_of_employment}', '#{@certification_from}', '#{@certification_completed}') RETURNING id;")
  #     @id = saved_stylist.first.fetch("id").to_i()
  # end
  #
  # def update(attributes)
  #   @id = self.id
  #   @first_name = attributes.fetch("first_name")
  #   @last_name = attributes.fetch("last_name")
  #   @date_of_employment = attributes.fetch("date_of_employment")
  #   @certification_from = attributes.fetch("certification_from")
  #   @certification_completed = attributes.fetch("certification_completed")
  #   DB.exec("UPDATE stylists SET (first_name, last_name, date_of_employment, certification_from, certification_completed) \
  #     = ('#{@first_name}', '#{@last_name}', '#{@date_of_employment}', '#{@certification_from}', '#{@certification_completed}') WHERE id = #{@id};")
  # end
  #
  # def delete
  #   DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
  # end
  #
  def self.map_results_to_objects(returned_clients)
    clients = []
    returned_clients.each() do |client|
      clients << Client.new({
        :id => client.fetch('id').to_i(),
        :first_name => client.fetch('first_name'),
        :last_name => client.fetch('last_name'),
        :hair_style => client.fetch('hair_style'),
        :preferred_appointment => client.fetch('preferred_appointment'),
        :stylist_id => client.fetch('stylist_id').to_i
        })
    end
    clients
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
