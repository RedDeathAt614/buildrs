class UserTagController < ApplicationController
  def create
  	puts "USERTAG CREATE"
  	content = params[:user_tag][:content]

  	if (content != "")
  		content.downcase!
  		existing = UserTag.where("content = :d",{d: content})
  		u = nil
  		if (existing.length == 0)
  			u = UserTag.create(:content => content)
  		else
  			u = existing.first
  		end
      user_tags = User.find(current_user.id).user_tags.where("content = :d",{d: content})
      if (user_tags.length == 0)
        UserTagMap.create(:user_tag_id => u.id, :user_id => current_user.id)
      end
  	end
  	redirect_to profile_path(current_user.id)
  end
end
