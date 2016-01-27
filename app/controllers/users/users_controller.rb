class UsersController < ApplicationController
  def show
    @user = User.find( params[:id] )
    #variable = db.find( parameter with id) ... explanation for line 3
  end
