class UsersController < ApplicationController

	get '/signup' do 
		if logged_in? 
			redirect to '/meals' 
		else 
			erb :'/users/new' 
		end 
	end 

	post '/signup' do 
		if params[:username] == "" || params[:email] == "" || params[:password] == "" 
			flash[:message] = "Please enter information for all fields." 
			redirect '/signup' 
		else 
			@user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
			session[:user_id] = @user.id 
			redirect to '/meals' 
		end 
	end 

	get '/users/:slug' do 
		@user = User.find_by_slug(params[:slug]) 
		erb :'/users/show'
	end 

	get '/login' do 
		if logged_in? 
			redirect to :'/meals' 
		else 
			erb :'/users/login' 
		end 
	end 

	post '/login' do 
		@user = User.find_by(:username => params[:username]) 
		if @user && @user.authenticate(params[:username]) 
			session[:user_id] = @user.id 
			redirect to :'meals' 
		else 
			flash[:message] = "Login info incorrect. Pleast log in again with the correct username and password." 
			redirect to '/login' 
		end 
	end 

	get 'logout' do 
		session.clear 
		redirect '/login' 
	end 

end 