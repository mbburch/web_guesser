require 'sinatra'
require 'sinatra/reloader'

get '/' do
  num = rand(100)
  "The secret number is #{num}"
end
