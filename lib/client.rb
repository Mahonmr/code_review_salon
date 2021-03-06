class Client
  attr_reader(:id, :first_name, :last_name, :hair_style,
    :preferred_appointment, :stylist_id)

  def initialize(attribute)
    @id = attribute.fetch(:id)
    @first_name = attribute.fetch(:first_name)
    @last_name = attribute.fetch(:last_name)
    @hair_style = attribute.fetch(:hair_style)
    @preferred_appointment = attribute.fetch(:preferred_appointment)
    @stylist_id = attribute.fetch(:stylist_id).to_i
  end

  def self.all
    returned_clients = DB.exec("SELECT * FROM clients;")
    Client.map_results_to_objects(returned_clients)
  end

  def self.create(params)
    Client.new({
      :id => nil,
      :first_name => params.fetch("first_name"),
      :last_name => params.fetch("last_name"),
      :hair_style => params.fetch("hair_style"),
      :preferred_appointment => params.fetch("preferred_appointment"),
      :stylist_id => nil,
      })
  end

  def save
    saved_client = DB.exec("INSERT INTO clients (first_name, last_name, hair_style, preferred_appointment, stylist_id)
      VALUES ('#{@first_name}', '#{@last_name}', '#{@hair_style}', '#{@preferred_appointment}', #{@stylist_id}) RETURNING id;")
      @id = saved_client.first.fetch("id").to_i()
  end

  def update(attributes)
    @id = self.id
    @first_name = attributes.has_key?("first_name") ? attributes.fetch("first_name") : self.first_name
    @last_name = attributes.has_key?("last_name") ? attributes.fetch("last_name") : self.last_name
    @hair_style = attributes.has_key?("hair_style") ? attributes.fetch("hair_style") : self.hair_style
    @preferred_appointment = attributes.has_key?("preferred_appointment") ? attributes.fetch("preferred_appointment") : self.preferred_appointment
    @stylist_id = attributes.fetch("stylist_id").to_i
    DB.exec("UPDATE clients SET (first_name, last_name, hair_style, preferred_appointment, stylist_id) \
      = ('#{@first_name}', '#{@last_name}', '#{@hair_style}', '#{@preferred_appointment}', #{@stylist_id}) WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM clients WHERE id = #{self.id};")
  end

  def self.find(id)
    Client.all.each do |client|
      return client if client.id == id
    end
    client = nil
  end

  def self.map_results_to_objects(returned_clients)
    clients = []
    returned_clients.each() do |client|
      clients << Client.new({
        :id => client.fetch('id').to_i(),
        :first_name => client.fetch('first_name'),
        :last_name => client.fetch('last_name'),
        :hair_style => client.fetch('hair_style'),
        :preferred_appointment => client.fetch('preferred_appointment'),
        :stylist_id => client.fetch('stylist_id')
        })
    end
    clients
  end

  def ==(another_client)
    self.id == (another_client.id) &&
    self.first_name == (another_client.first_name) &&
    self.last_name == (another_client.last_name) &&
    self.hair_style == (another_client.hair_style) &&
    self.preferred_appointment == (another_client.preferred_appointment) &&
    self.stylist_id == (another_client.stylist_id)
  end
end
