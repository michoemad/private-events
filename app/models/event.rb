class Event < ActiveRecord::Base
	belongs_to :creator, class_name: "User"
	validates :name, presence: true
	validates :time, presence: true
	has_many :attendances
	has_many :attendees, through: :attendances, source: "user"

end
