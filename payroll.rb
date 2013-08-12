class Payroll

	def self.base_pay(hourly_rate, hours)
		hourly_rate * hours
	end

	def self.gross_pay(hourly_rate, hours)
		total_hours = hours.inject { |sum, x| sum + x }
		base_pay(hourly_rate, total_hours)
	end

	def self.tax_pay(gross_pay, tax_rate)
		gross_pay * tax_rate
	end

end