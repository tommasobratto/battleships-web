require 'sinatra/base'

class Battleships < Sinatra::Base

  set :views, Proc.new { File.join(root, ".", "views") }
  
  get '/' do
    erb :index
  end

  get '/player' do
    erb :player
  end

  post '/player' do
    if params[:name].empty?
      @message = 'Please enter a name'
      erb :player
    else
      @player = params[:name]
      erb :player
    end
  end

  get "/battleship" do
    erb :battleship
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
