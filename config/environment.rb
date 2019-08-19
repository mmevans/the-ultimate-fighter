require 'bundler'
Bundler.require


require 'sinatra/activerecord'
require 'ostruct'
require 'date'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'