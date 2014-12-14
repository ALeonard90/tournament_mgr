require 'sinatra'
require 'sinatra/activerecord'

#Don't forget to add database name in config/database.yml
require_relative './models/user.rb'
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
    redirect('/users')
  else
    @user = user
    erb :sign_up
  end
end

get '/login' do
	erb :login
end

post '/login' do
	user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect('/users')
  else
    @errors << "Invalid email or password. Try again!"
    erb :login
  end
end

get '/logout' do
	session.clear
	redirect('/')
end
