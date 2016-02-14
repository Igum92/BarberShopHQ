#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end

class Contacts < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers=Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do

	c = Client.new params[:client]

	if c.save
		erb "<h3> Спасибо! Вы записались! </h3>"
	else
		erb "<h3>Ошибка!</h3>"
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
 	@comment = params[:comment]

 	c = Contacts.new
 	c.comment = @comment
 	c.save

	erb "<h3> Спасибо! Нам важен Ваш комментарий </h3>"

end

