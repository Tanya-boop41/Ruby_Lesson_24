#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@date_time = params[:date_time]
	@hairstylist = params[:hairstylist]
	@color = params[:color]

	#@title = 'Благодарим за Ваш выбор!'
	#@message = "Уважаемый(ая) #{@username}, мы будем вас ждать #{@date_time}"

	f = File.open 'C:/Projects/Ruby_Lesson_22/public/users.txt', 'a'
	f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@date_time}, Hairstylist: #{@hairstylist}, Color: #{@color}\n"
	f.close

	erb :visit_result
end

post '/visit_result' do
	erb :visit
end

post '/contacts' do
	@user_email = params[:user_email]
	@text = params[:user_text]

	@title = 'Благодарим за ваше обращение!'
	@message = "Мы свяжемся с вами по электронной почте #{@user_email}"

	f = File.open 'C:/Projects/Ruby_Lesson_22/public/contacts.txt', 'a'
	f.write "User e-mail: #{@user_email}, Text: #{@text}\n"
	f.close

	erb :message
end

