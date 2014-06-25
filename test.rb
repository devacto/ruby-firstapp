ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'web.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "Customer Application" do

  it 'should return json' do
    get '/customers/1'
    last_response.headers['Content-Type'].must_equal 'application/json;charset=utf-8'
  end
  
end