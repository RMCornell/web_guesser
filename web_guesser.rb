require 'sinatra'
require 'sinatra/reloader' if development?

rand = rand(10)

get '/' do
  @random_number = rand
  @guess = params["guess"].to_i
  @message = guess_checker
  erb :index
end

def guess_checker
  if @guess > @random_number
    "Your guess of #{@guess} was too high!"
  elsif @guess < @random_number
    "Your guess of #{@guess} was too low!"
  else @guess == @random_number
    "Well Played!"
  end
end


