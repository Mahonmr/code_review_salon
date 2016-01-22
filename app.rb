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
