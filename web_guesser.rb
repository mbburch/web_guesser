require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:message => message}
end

def check_guess(guess)
  if guess > settings.number
    too_high(guess)
  elsif guess < settings.number
    too_low(guess)
  elsif guess == settings.number
    "You got it right!"
  end
end

def too_high(guess)
  if (guess - 5) > settings.number
    "Way too high!"
  elsif guess > settings.number
    "Too high!"
  end
end

def too_low(guess)
  if (guess + 5) < settings.number
    "Way too low!"
  elsif guess < settings.number
    "Too low!"
  end
end
