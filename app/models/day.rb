class Day < ActiveRecord::Base
	validates_presence_of :day, :avg7index
	validates_numericality_of :avg7time, :avg7index

	attr_accessor :avg7hours, :avg7minutes

	before_validation :set_avg7time

	def avg7minutes
		self.avg7time.nil? ? nil : self.avg7time % 60
	end

	def avg7hours
		self.avg7time.nil? ? nil : (self.avg7time / 60).floor
	end

	def day_string
		if (self.day.nil?)
			return nil
		end
		text = Date::ABBR_DAYNAMES[self.day.wday] + " " + self.day.month.to_s + "/" + self.day.day.to_s
		if (self.day.year < Date.today.year)
			text = text + "/" + (self.day.year % 100).to_s.rjust(2, "0")
		end
		text
	end

	def day_string=(day_string)
		self.day = Time.parse(day_string)
	end
	
	def jquery_date
		if (self.day.nil?)
			day = Time.now
		else
			day = self.day
		end
		
		return day.month.to_s + "/" + day.day.to_s + "/" + day.year.to_s
	end

	def set_avg7time
		self.avg7time = 0
		if (!@avg7hours.nil?)
			self.avg7time = @avg7hours.to_i * 60
		end
		if (!@avg7minutes.nil?)
			self.avg7time = self.avg7time + @avg7minutes.to_i
		end
	end
end
