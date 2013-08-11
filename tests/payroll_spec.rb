require_relative '../payroll.rb'

describe Payroll do
	
	it "should calculate base pay" do
		payroll = Payroll.new
		basepay = payroll.base_pay hourly_rate=80, hours=20
		1600.should be_equal basepay
	end

	it "should calculate gross pay" do
		payroll = Payroll.new
		grosspay = payroll.gross_pay hourly_rate=80, hours=[8,8,10,6]
		2560.should be_equal grosspay
	end
	
end
