class UsersController < ApplicationController
  before_action :authenticate_user!  
  
  def index
    
  end
  
  def show
    @user = User.find( params[:id] )
    #variable = db.find( parameter with id) ... explanation for line 3
  end
end