require 'sinatra'
require 'pry-byebug'

get '/boss' do
  erb :boss
end

post '/boss' do 
  my_message = params[:message]

  erb :show_message, locals: { message: my_message }
end
