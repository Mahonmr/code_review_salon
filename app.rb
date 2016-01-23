require('sinatra')
require('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
require('pg')
require('pry')
also_reload('./lib/**/*.rb')

DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
  erb(:index)
end

get('/clients') do
  @clients = Client.all
  erb(:Clients)
end

get('/client/new') do
  erb(:client_form)
end

post('/client/create') do
  new_client = Client.create(params)
  new_client.save
  redirect('/clients')
end

get('/client/:id/show') do
  @client = Client.find(params.fetch("id").to_i)
  erb(:client_show)
end

get('/client/:id/edit') do
  @client = Client.find(params.fetch("id").to_i)
  erb(:client_edit)
end

post('/client/:id/update') do
  client = Client.find(params.fetch("id").to_i)
  client.update(params)
  redirect('/clients')
end

get('/client/:id/delete') do
  client = Client.find(params.fetch("id").to_i)
  client.delete
  redirect('/clients')
end

#============= stylists ======================

get('/stylists') do
  @stylists = Stylist.all
  erb(:stylists)
end

get('/stylist/new') do
  erb(:stylist_form)
end

post('/stylist/create') do
  new_stylist = Stylist.create(params)
  new_stylist.save
  redirect('/stylists')
end

get('/stylist/:id/show') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @clients = @stylist.clients
  erb(:stylist_show)
end

get('/stylist/:id/edit') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  erb(:stylist_edit)
end

post('/stylist/:id/update') do
  stylist = Stylist.find(params.fetch("id").to_i)
  stylist.update(params)
  redirect('/stylists')
end

get('/stylist/:id/delete') do
  stylist = Stylist.find(params.fetch("id").to_i)
  stylist.delete
  redirect('/stylists')
end

get('/stylist/:id/add_clients') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @clients = Client.all
  erb(:stylist_clients)
end

get('/stylist/:stylist_id/add_clients/:id') do
  client = Client.find(params.fetch("id").to_i)
  client.update(params)
  redirect("/stylist/#{params.fetch('stylist_id').to_i}/add_clients")
end
