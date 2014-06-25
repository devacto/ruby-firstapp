require 'sinatra'
require 'json'

customers = [
    {
        :id => 1,
        :joined => '2000-12-02',
        :name => 'John',
        :city => 'Chandler',
        :orderTotal => 9.9956,
        :orders => [
            {
                :id => 1,
                :product => 'Shoes',
                :total => 9.9956
            }
        ]
    },
    {
        :id => 2,
        :joined => '1965-01-25',
        :name => 'Zed',
        :city => 'Las Vegas',
        :orderTotal => 19.99,
        :orders => [
            {
                :id => 2,
                :product => 'Baseball',
                :total => 9.995
            },
            {
                :id => 3,
                :product => 'Bat',
                :total => 9.995
            }
        ]
    },
    {
        :id => 3,
        :joined => '1944-06-15',
        :name => 'Tina',
        :city => 'New York',
        :ordersTotal => 44.99,
        :orders => [
            {
                :id => 4,
                :product => 'Headphones',
                :total => 44.99
            }
        ]
    },
    {
        :id => 4,
        :joined => '1995-03-28',
        :name => 'Dave',
        :city => 'Seattle',
        :ordersTotal => 101.50,
        :orders => [
            {
                :id => 5,
                :product => 'Kindle',
                :total => 101.50
            }
        ]
    }
]

get '/' do
  send_file 'index.html'
end

get '/customers' do
  return_message = {}

  if customers
    return_message[:error] = 'false'
    return_message[:result] = customers
  else
    return_message[:error] = 'true'
    return_message[:message] = 'No customers found.'
  end

  content_type :json
  return_message.to_json
end

get '/customers/:id' do
  return_message = {}
  result = []

  customers.each do |customer|
    result << customer if customer[:id] == params[:id].to_i
  end

  if result.empty?
    return_message[:error] = 'true'
    return_message[:message] = 'Customer with that ID is not found.'
  else
    return_message[:error] = 'false'
    return_message[:result] = result
  end

  content_type :json
  return_message.to_json
end

get '/orders' do
  return_message = {}
  result = []

  customers.each do |customer|
    customer[:orders].each do |order|
      result << order
    end
  end

  if result.empty?
    return_message[:error] = 'true'
    return_message[:message] = 'No orders found.'
  else
    return_message[:error] = 'false'
    return_message[:result] = result
  end

  content_type :json
  return_message.to_json
end