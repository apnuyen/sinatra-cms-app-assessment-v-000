class ApplicationController < Sinatra::Base 

	use Rack::Flash 
	
	get '/' do 
		erb :index 
	end 

	helpers do 
		def logged_in? 
			!!session[:user_id]
		end 

		def current_user 
			User.find(session[:user_id])
		end 
	end 
	

end 