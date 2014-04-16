module DaysHelper
	def time_string(minutes)
		h = (minutes / 60).floor
		m = (minutes % 60).to_i
		if (m < 10)
			m = "0" + m.to_s
		end
		return h.to_s + ":" + m.to_s
	end

	def graph_data
		days = Day.find(:all, :order => "day asc")
		hours = []
		indices = []
		days.each do |d|
			time = Time.utc(d.day.year, d.day.month, d.day.day).tv_sec * 1000
			hours.push([time, d.avg7time / 60])
			indices.push([time, d.avg7index])
		end
		{ "Hours" => hours, "Apnea Hypopnea Index" => indices }
	end
end
