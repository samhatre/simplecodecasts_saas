# controllers files are always named in plural form
class ProfilesController < ApplicationController
  def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] )
    @profile = Profile.new
  end
  
  def create 
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end
  
  def edit 
    @user = User.find( params[:user_id] )
    @profile = @user.profile
  end
  
  # whenever user makes chnages to the profile it come to "Update" action created below #
def update
  @user = User.find( params[:user_id] )           #establish which user profile we are editing 
  @profile = @user.profile                        #store user profile data in @profile variable 
  if @profile.update_attributes(profile_params)   # checking in db if data is updated
    flash[:success] = "Profile Updated!"
    redirect_to user_path( params[:user_id] )     # display the edited profile
  else
    render action: :edit                         #redirecting user to edit page
  end
end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
end