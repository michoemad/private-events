class User < ActiveRecord::Base

	  validates :username, presence: true
	  validates :email, presence: true
	  
	  has_many :events, class_name: "Event", foreign_key: "creator_id"
	  has_many :attendances
	  has_many :attended_events, through: :attendances, source: "event"

	  def prev_events
	  	self.attended_events.where("time<?",Date.today)
	  end

	  def upcoming_events
	  	self.attended_events.where("time>=?",Date.today)
	  end
 
end
