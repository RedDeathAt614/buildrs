class UserTag < ActiveRecord::Base
	has_many :user_tag_maps
	has_many :users, :through => :user_tag_maps
end
