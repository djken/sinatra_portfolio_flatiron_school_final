class BirthdaysController < ApplicationController
    get '/birthdays' do
        if logged_in?
          @user = User.find(session[:user_id])
    
            @birthdays = Birthday.where(user_id: current_user)
          erb :'birthdays/birthdays'
        else
          redirect to '/login'
        end
      end

      get '/birthdays/new' do
        if logged_in?
          erb :'birthdays/create_birthday'
        else
          redirect to '/login'
        end
      end
    
      post '/birthdays' do
        if params[:firstname] == "" || params[:lastname]== ""
          redirect to "/birthdays/new"
        else
          @birthday = current_user.birthdays.create(:firstname=> params[:firstname], :lastname=> params[:lastname], :phone_number=> params[:phone_number], :relationship=> params[:relationship], :birthday=> params[:birthday])
          redirect to "/birthdays/#{@birthday.id}"
        end
      end
    
      get '/birthdays/:id' do
        if logged_in?
          @birthday = Birthday.find_by_id(params[:id])
          erb :'birthdays/show_birthday'
        else
          redirect to '/login'
        end
      end
    
      get '/birthdays/:id/edit' do
        if logged_in?
          @birthday = Birthday.find_by_id(params[:id])
          if @birthday.user_id == current_user.id
           erb :'birthdays/edit_birthday'
          else
            redirect to '/birthdays'
          end
        else
          redirect to '/login'
        end
      end
    
      patch '/birthdays/:id' do
        # if params[:firstname] == "" || params[:lastname] == ""
        #   redirect to "/birthdays/#{params[:id]}/edit"
        # else
          @birthday = Birthday.find_by_id(params[:id])
          @birthday.firstname = (params[:firstname])
          @birthday.lastname = (params[:lastname])
          @birthday.phone_number = (params[:phone_number])
          @birthday.relationship = (params[:relationship])
          @birthday.birthday = (params[:birthday])
          @birthday.save
          redirect to "/birthdays/#{@birthday.id}"
          # redirect to "/birthdays/#{params[:id]}"
        # end
      end
    
      delete '/birthdays/:id/delete' do
        if logged_in?
          @birthday = Birthday.find_by_id(params[:id])
          if @birthday.user_id == current_user.id
            @birthday.delete
            redirect to '/birthdays'
          else
            redirect to '/birthdays'
          end
        else
          redirect to '/login'
        end
      end
end