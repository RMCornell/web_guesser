require 'sinatra'
require 'sinatra/reloader' if development?

random = rand(100)

get '/' do
  @random_number = random
  erb :index
end

