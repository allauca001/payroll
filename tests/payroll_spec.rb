require_relative '../payroll.rb'

describe Payroll do
	
	it "should calculate base pay" do
		#payroll = Payroll.new
		basepay = Payroll.base_pay hourly_rate=80, hours=20
		1600.should be_equal basepay
	end

	it "should calculate gross pay" do
		#payroll = Payroll.new
		grosspay = Payroll.gross_pay hourly_rate=80, hours=[8,8,10,6]
		2560.should be_equal grosspay
	end

	it "should calculate Federal income taxes" do
		#payroll = Payroll.new
		taxpay = Payroll.tax_pay gross_pay=5000, tax_rate=0.25
		(1250.0).should be_equal taxpay
	end
	
end
