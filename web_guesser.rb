require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)


get '/' do
  guess = params["guess"].to_i
  message, color = check_guess(guess)
  erb :index, :locals => {:message => message, :color => color}
end

def check_guess(guess)
  if guess > settings.number
    too_high(guess)
  elsif guess < settings.number
    too_low(guess)
  elsif guess == settings.number
    ["You got it right!", 'green']
  end
end

def too_high(guess)
  if (guess - 5) > settings.number
    ["Way too high!", 'red']
  elsif guess > settings.number
    ["Too high!", 'pink']
  end
end

def too_low(guess)
  if (guess + 5) < settings.number
    ["Way too low!", 'red']
  elsif guess < settings.number
    ["Too low!", 'pink']
  end
end
