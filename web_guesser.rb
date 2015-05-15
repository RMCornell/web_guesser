require 'sinatra'
require 'sinatra/reloader' if development?

rand = rand(10)

get '/' do
  @random_number = rand
  @guess = params["guess"].to_i
  @high_guess = high_guess
  @low_guess = low_guess
  @correct_guess = correct_guess
  erb :index
end

def high_guess
  if @guess > @random_number
    "Your guess of #{@guess} was too high!"
  end
end

def low_guess
  if @guess < @random_number
    "Your guess of #{@guess} was too low!"
  end
end

def correct_guess
  if @guess == @random_number
    "Well Played!"
  end
end



