require './config/environment'

class ApplicationController < Sinatra::Base
  set :method_override, true
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "schedule_secret"
  end

  get '/' do 
    # erb :index
    erb :"users/create_user"
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end
end