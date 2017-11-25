require 'sinatra'
require 'pry-byebug'

get '/boss' do
  erb :boss
end

post '/boss' do 
  my_message = params[:message]

  erb :show_message, locals: { message: my_message }
end

WINNING_COMBOS = [['rock', 'scissors'], ['paper', 'rock'], ['scissors', 'paper']]

get '/rps' do 
  erb :rps
end

post '/rps' do 
  @my_move = params[:human_move].downcase
  @comp_move = computer_move
  #binding.pry
  erb :rps_result, locals: { human_move: @my_move, computer_move: @comp_move, result: determine_winner }
end

def computer_move
  ['rock', 'paper', 'scissors'].sample
end

def determine_winner
  moves = [@my_move, @comp_move]
  WINNING_COMBOS.each do |combo|
    binding.pry
    if moves == combo
      @result = 'You Win!'
    elsif moves[0] == moves[1]
      @result = "It's a tie!"
    else
      @result = 'Computer wins!'
    end
  end
  @result
end



