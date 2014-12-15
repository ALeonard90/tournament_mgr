require 'sinatra'
require 'sinatra/activerecord'

#Don't forget to add database name in config/database.yml
require_relative './models/user.rb'
require_relative './models/match.rb'
require_relative './models/player.rb'
require_relative './models/tournament.rb'
require_relative './models/pool.rb'
require_relative './config/environments'

enable :sessions

helpers do
  def current_user
    @current_user || nil
  end

  def current_user?
    @current_user == nil ? false : true
  end
end

before do
  @errors ||= []
  @current_user = User.find_by(id: session[:user_id])
end

before "/user/*" do
  unless current_user?
    @errors << "Please sign up or log in."
    redirect "/"
  end
end

get '/' do
	erb :index
end

get '/signup' do
	erb :signup
end

post '/signup' do
	user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect('/user')
  else
    @user = user
    erb :signup
  end
end

get '/login' do
	erb :login
end

post '/login' do
	user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect('/user')
  else
    @errors << "Invalid email or password. Try again!"
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect('/')
end

get "/user" do
  if @current_user.tournaments
    @tournaments = Tournament.where(user_id: session[:user_id])
  else
    @tournaments = []
  end
  erb :user
end

post "/user" do
  Tournament.create(name: params[:name], user_id: session[:user_id])
  redirect "/user"
end

get "/user/:tournnament_id"



