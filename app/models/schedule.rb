class Schedule < ActiveRecord::Base
	belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
	validates_uniqueness_of :user_id, message: "can not have more than one schedule"
    serialize :mon,Array
    serialize :tue,Array
    serialize :wed,Array
    serialize :thu,Array
    serialize :fri,Array
    serialize :sat,Array
    serialize :sun,Array
end
