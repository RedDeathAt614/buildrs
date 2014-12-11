class ProfileController < ApplicationController
  
  def show
  	@profile_user = User.find(params[:id])
  	@profile = current_user
    @user_tag = UserTag.new
  	@user = current_user
  	@projects = @profile_user.projects.order(:created_at).reverse_order
  	@user_tags = @profile_user.user_tags
  	if @projects.length > 3
  		@projects = @projects[0..2]
  	end
  end



  # to edit a user user edit_user_registration_path => http://localhost:3000/users/edit

end
