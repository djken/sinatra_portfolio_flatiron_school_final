class MeetingsController < ApplicationController
  get '/meetings' do
    if logged_in?
      @user = User.find(session[:user_id])
        @meetings = Meeting.where(user_id: current_user)
      erb :'meetings/meetings'
    else
      redirect to '/login'
    end
  end

  get '/meetings/new' do
    if logged_in?
      erb :'meetings/create_meeting'
    else
      redirect to '/login'
    end
  end

  post '/meetings' do
    if params[:firstname] == "" || params[:lastname]== ""
      redirect to "/meetings/new"
    else
      @meeting = current_user.meetings.create(:firstname=> params[:firstname], :lastname=> params[:lastname], :address=> params[:address], :phone_number=> params[:phone_number], :schedule=> params[:schedule], :description=> params[:description])
      redirect to "/meetings/#{@meeting.id}"
    end
  end

  get '/meetings/:id' do
    if logged_in?
      @meeting = Meeting.find_by_id(params[:id])
      erb :'meetings/show_meeting'
    else
      redirect to '/login'
    end
  end

  get '/meetings/:id/edit' do
    if logged_in?
      @meeting = Meeting.find_by_id(params[:id])
      if @meeting.user_id == current_user.id
       erb :'meetings/edit_meeting'
      else
        redirect to '/meetings'
      end
    else
      redirect to '/login'
    end
  end

  patch '/meetings/:id' do
      @meeting = Meeting.find_by_id(params[:id])
      @meeting.firstname = (params[:firstname])
      @meeting.lastname = (params[:lastname])
      @meeting.address = (params[:address])
      @meeting.phone_number = (params[:phone_number])
      @meeting.schedule = (params[:schedule])
      @meeting.description = (params[:description])
      @meeting.save
      redirect to "/meetings/#{@meeting.id}"
  end

  delete '/meetings/:id/delete' do
    if logged_in?
      @meeting = Meeting.find_by_id(params[:id])
      if @meeting.user_id == current_user.id
        @meeting.delete
        redirect to '/meetings'
      else
        redirect to '/meetings'
      end
    else
      redirect to '/login'
    end
  end
end
