require 'pry'

require 'sinatra'
require 'sinatra/reloader' if development?

random = rand(100)

get '/' do
  @random_number = random
  erb :play
end

__END__

@@play
<h1>Your Secret Number is <%= @random_number %>
