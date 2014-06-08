require 'sinatra'
require 'json'

get '/' do
  "Learning Ruby on Heroku"
end

get '/animals.json' do
  content_type :json
  {:animal => ["elephant", "cat", "dog"]}.to_json
end
