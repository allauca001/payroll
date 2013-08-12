class Payroll

	attr_reader :address

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

	def check_pay(address)
		@address = address
	end

	def eft_pay(bank_account)
		@bank_account = bank_account
	end

	def deliver
		if @address
			return "delivered via mail"
		else
			return "cannot deliver"
		end
	end
		
end
