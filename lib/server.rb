require 'sinatra/base'
require_relative 'board'
require_relative 'game'
require_relative 'ship'
require_relative 'player'
require_relative 'cell'
require_relative 'water'

class Battleships < Sinatra::Base

  game = Game.new
  board = Board.new(size: 10, content: Cell)
  board.grid.each{|cell| cell.last.content = Water.new}


  get '/' do
    erb :index
  end

  get '/player' do
    erb :player
  end

  post '/player' do
    @name = params[:name]
    @game = game
    if params[:name].empty?
      @message = 'Please enter a name'
      erb :player
    else
      @player = Player.new(@name)
      game.add_player(@player)
      puts @game.inspect
      erb :player
    end
  end

  get "/battleship" do
    @table = board.grid
    @result = ''
    erb :battleship
  end

  post "/battleship" do
    @table = board.grid
    coordinate = params[:coordinate].to_sym
    @result = board.shoot_at(coordinate)
    erb :battleship
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
