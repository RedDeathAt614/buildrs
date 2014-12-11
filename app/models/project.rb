class Project < ActiveRecord::Base
	belongs_to :user
	has_many :project_image_attachments, :dependent => :destroy
	has_many :project_files, :dependent => :destroy
	has_many :project_likes, :dependent => :destroy
	has_many :project_views, :dependent => :destroy
	has_many :project_comments, :dependent => :destroy
	has_many :project_tag_maps, :dependent => :destroy
	has_many :project_tags, :through => :project_tag_maps
	accepts_nested_attributes_for :project_image_attachments, :project_files

	after_initialize :set_defaults

	def likeProject user_id
    	if (!likedProject?(user_id))
	    	ProjectLike.create(:project_id => self.id, :user_id => user_id)
	    	self.updateLikes
	    end
	end

	def likedProject? user_id
		self.project_likes.pluck(:user_id).include?(user_id) || self.user_id == user_id
	end

	def viewProject user_id
		if (!viewedProject?(user_id)) # only counting unique views if I identify a user (i.e. if the user is logged in)
			if (user_id)
				ProjectView.create(:project_id => self.id, :user_id => user_id)
				self.updateViews(0)
			else
				# Should I count views where the user is not signed in?
				self.updateViews(1)
			end
		end
		self.views
	end

	def viewedProject? user_id
		if (user_id)
			self.project_views.pluck(:user_id).include?(user_id) || self.user_id == user_id
		else
			false
		end
	end

	def commentedProject? user_id
		if (user_id)
			self.project_comments.pluck(:user_id).include?(user_id) || self.user_id == user_id
		else
			true # You have to be logged in to be able to rate and comment
		end
	end

	def updateScore
		scores = self.project_comments.all.pluck(:score)
		scores.delete(0)
		if (scores.length > 0)
			self.update(:score => scores.sum.to_f / scores.length.to_f)
		end
	end

	def updateLikes
		self.update(:likes => self.project_likes.length)
	end

	def updateViews value
		self.update(:views => self.project_views.length + value)
	end

	private
	def set_defaults
		self.likes ||= 0;
		self.views ||= 0;
		self.score ||= 0;
	end
end
