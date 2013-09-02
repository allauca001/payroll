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

	def self.over_hours(num)
  	return num - 40 if num > 40
  	return 0
  end

  def self.overtime(hourly_rate, hours)
  	overtime = self.over_hours num=hours
  	return overtime * hourly_rate * 1.5
  end

  def self.overtime_perhour(hourly_rate, overtime_rate)
  	pay_perhour = hourly_rate * overtime_rate
  	return hourly_rate if pay_perhour < 87.25
  	return pay_perhour
  end

 


 end
	 


