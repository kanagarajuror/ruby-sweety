class Patient < ActiveRecord::Base
  attr_accessible :reading_value, :user_id
  belongs_to :user
  validates :reading_value, presence: true
  scope :today_readings, lambda { where("date(created_at) = ?", Time.now.strftime("%Y-%m-%d").to_date)}
  scope :today_result, lambda { where("date(created_at) = ?", Time.now.to_date.strftime("%Y-%m-%d"))}
  scope :between_date, lambda {|begin_date, end_date| where("date(created_at) between ? and ?",begin_date, end_date)}

def self.check_count
		result = Patient.today_readings.count
		if result < 4
			false
		else
			true
		end
end	

def self.month_to_date_wise(user,params={})
		reading_date = params["reading"]
		end_date = Date.new(reading_date["created_at(1i)"].to_i,reading_date["created_at(2i)"].to_i,reading_date["created_at(3i)"].to_i)
		begin_date = end_date.beginning_of_month
		total = user.patients.between_date(begin_date,end_date)
[total.minimum(:reading_value).to_i, total.maximum(:reading_value).to_i, total.average(:reading_value).to_i]


end

def self.month_wise(user,params={})
		reading_date = params["reading"]
		begin_date = Date.new(reading_date["created_at(1i)"].to_i,reading_date["created_at(2i)"].to_i,reading_date["created_at(3i)"].to_i)
		end_date = begin_date.end_of_month
		total = user.patients.between_date(begin_date,end_date)
[total.minimum(:reading_value).to_i, total.maximum(:reading_value).to_i, total.average(:reading_value).to_i]
end
end
