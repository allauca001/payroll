class Payroll
	def base_pay(hourly_rate, hours)
		hourly_rate * hours
	end

	def gross_pay(hourly_rate, hours)
		total_hours = hours.inject { |sum, x| sum + x }
		base_pay(hourly_rate, total_hours)
	end
end