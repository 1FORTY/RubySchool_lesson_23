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

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@email = params[:email]
	@email_text = params[:message_email]
	@contact = "Email: #{@email}; Message: #{@email_text}.
"

	file = File.open 'public/email.txt', 'a'
		file << @contact
	file.close

	'Thanks for your message. We get his.'
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@name = params[:username]
	@phone = params[:phone]
	@time = params[:datetime]
	@hairdresser = params[:hairdresser]
	if @hairdresser == 'Выберите парикмахера'
		@hairdresser = 'Любой'
	end

	@info = "Name: #{@name}; Phone: #{@phone}; Time: #{@time}; Hairdresser: #{@hairdresser},
"

	person = File.open 'public/user.txt', 'a'
		person << @info
	person.close

	'Спасибо, мы успешно получили ваши данные и с радостью ждём вас!'
end

get '/admin' do
	erb :admin
end

post '/admin' do
	@name = params[:user]
	@password = params[:password]

	if @name == 'admin' and @password == 'secret'
		@admin = 'Hello admin'
	else
		"#{@name}  #{@password}"
		@user = 'Hello user'
	end
end
