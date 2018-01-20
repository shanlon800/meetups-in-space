require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end


get '/meetups/:id' do
  @id = params['id']
  @meeting = Meetup.find(@id)

  @user_meetups = @meeting.user_meetups
  @users = @meeting.users

  if session[:user_id] == nil
    @sign_in_error = "You are not signed in"
  else
    @sign_in_success = "You are signed in"
  end

  erb :'meetups/details'
end


post '/meetups/:id' do
  # binding.pry
  @id = params['id']
  @meeting = Meetup.find(@id)
  #
  @user_meetups = @meeting.user_meetups
  @users = @meeting.users

current_user = User.find_by(id: session[:user_id])

  UserMeetup.create({ user_id: current_user.id , meetup_id: @id })


  erb :'meetups/details'
end



get '/form' do
  erb :'meetups/form'
end


post '/form' do

  @name = params[:name]
  @location = params[:location]
  @description = params[:description]
  @creator = params[:creator]

if @name == "" || @location == "" || @description == "" || @creator == ""
  @error = "Please fill out all fields of the form!"
  erb :'meetups/form'

else
  meetup = Meetup.create({name: @name, location: @location, description: @description, creator: @creator})

# needs to redirect to '/meetups/:id and show 'success
  # redirect '/'
  @meeting = Meetup.find(meetup.id)
  @users = @meeting.users
  erb :'meetups/details'

end

end




get '/meetups' do
  variable = Meetup.all
  @meetups = variable.order(:name)
  erb :'meetups/index'
end
