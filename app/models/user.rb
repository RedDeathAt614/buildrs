class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :project_likes
  has_many :project_views
  has_many :project_comments
  has_many :user_tag_maps
  has_many :user_tags, :through => :user_tag_maps
  mount_uploader :userimage, UserimageUploader

  def projects_scores
  	projects = self.projects
  	likes = 0
  	views = 0
  	score = 0.0
  	nr = projects.length
  	projects.each do |p|
  		if (p.score != 0)
  			score = score + p.score
  		else
  			nr -= 1
  		end
  		likes = likes + p.likes
  		views = views + p.views
  	end
    if (nr != 0)
  	   score = score / nr
    else
       score = 0.0
    end
  	[likes,views,score]
  end
  
end
