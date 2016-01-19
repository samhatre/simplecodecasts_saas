# controllers files are always named in plural form
class ProfilesController < ApplicationController
    def new 
        #form where a user can fill out their own profile
       @user = User.find( params[:user_id] )
       @variable = params[:hello]
       @profile = @user.build_profile    #we get this build_profile bcoz we have established model associated betn user and profile in routes.rb file
    end
end