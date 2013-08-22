class Payroll

	attr_reader :address, :bank_account
	
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
		elsif @bank_account
			return "delivered by bank account"
		end
	end
end

class Employee 
	attr_reader   :id
	attr_accessor :name, :home_address, :hourly_rate, :ssn 

 	class << self
 		attr_accessor :counter
 	end
 	@counter = 1

	def initialize
		@id = Employee.counter
		Employee.counter += 1
		if block_given?
			yield self, 4, 5
		end
	end

end
