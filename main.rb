require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/base'
require 'rack-flash'
require_relative './models'

use Rack::Flash, sweep: true

set :database, "sqlite3:example.sqlite3"
set :sessions, true


def current_user
  session[:user_id].nil? ? nil : User.find(session[:user_id])
end


get '/' do
  @title = "login"
  erb :login
end

post '/login' do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    flash[:notice] = "You've successfully signed in!"
    session[:user_id] = @user.id
    redirect to '/profile'
  else
    flash[:alert] = "Sorry! Your username/password is incorrect."
    redirect to '/login'
  end
end

get '/profile' do
  @title = "profile page"
  erb :profile
end

get '/create' do
  @title = "create"
  erb :create
end

