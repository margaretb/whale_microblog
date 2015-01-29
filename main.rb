require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/base'
require 'rack-flash'
require_relative './models'

set :database, "sqlite3:example.sqlite3"

get '/' do
  "Hello World"
end