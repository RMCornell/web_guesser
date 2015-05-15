require 'sinatra'
require 'sinatra/reloader' if development?

@@initial_number = rand(10)

get '/' do
  @random_number = @@initial_number
  @remaining = @@guesses_remaining
  @guess = params["guess"].to_i
  @high_guess = high_guess
  @low_guess = low_guess
  @correct_guess = correct_guess
  @out_of_guesses = out_of_guesses
  erb :index
end

@@guesses_remaining = 5
def out_of_guesses
  if @remaining == 1
    @@guesses_remaining = 0
    "You're out of Guesses. New Number Generated. Guess Again"
  end
end

def high_guess
  if @guess > @random_number
    @@guesses_remaining = @@guesses_remaining - 1
    "Your guess of #{@guess} was too high!"
  end
end

def low_guess
  if @guess < @random_number
    @@guesses_remaining = @@guesses_remaining - 1
    "Your guess of #{@guess} was too low!"
  end
end

def correct_guess
  if @guess == @random_number
    @@guesses_remaining = 5
    "Well Played! New Number Generated! Guess Again"
  end
end



