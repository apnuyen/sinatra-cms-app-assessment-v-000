class MealsController < ApplicationController 

	get '/meals' do 
		if !logged_in? 
			redirect to '/login' 
		else 
			@user = User.find(session[:user_id])
			erb :'/meals/index' 
		end 
	end

	get '/meals/new' do 
		if logged_in? 
			erb :'meals/new'
		else 
			redirect to '/login' 
		end 
	end 

	post '/meals' do 
		if params[:item1] != ""
			@meal = Meal.create(:date => params[:date], :mealtype => params[:mealtype], :item1 => params[:item1], :item2 => params[:item2], :item3 => params[:item3], :beverages => params[:beverages], :user_id => session[:user_id])
			@meal.save 
			redirect to "/meals" 
		else 
			flash[:message] = "You must enter at least 1 food item." 
			redirect to "/meals/new" 
		end 
	end 

end 