class Issue < ActiveRecord::Base
 attr_accessible :content
 
 belongs_to :user
 
 validates :content, :presence => true, :length => { :maximum => 140 }
 validates :user_id, :presence => true

 default_scope :order => 'issues.created_at DESC'
 

  private

    def self.from_users_followed_by(user)
		followed_ids = user.following.map(&:id).join(", ")
		#if no ids found set ids to 0 because 0 is not a mysql id
		if followed_ids == ''
			followed_ids = 0
		end
		where("user_id IN (#{followed_ids}) OR user_id = :user_id",
        { :user_id => user })
  end


end
