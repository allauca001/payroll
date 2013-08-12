require_relative '../payroll.rb'

describe Payroll do
	
	it "should calculate base pay" do
		basepay = Payroll.base_pay hourly_rate=80, hours=20
		1600.should be_equal basepay
	end

	it "should calculate gross pay" do
		grosspay = Payroll.gross_pay hourly_rate=80, 
																 hours=[8,8,10,6]
		2560.should be_equal grosspay
	end

	it "should calculate Federal income taxes" do
		taxpay = Payroll.tax_pay gross_pay=5000, tax_rate=0.25
		(1250.0).should be_equal taxpay
	end

	it "should send check when address exists" do
		payroll = Payroll.new
		address = "234 Antiquera Ave"
		payroll.check_pay address
		payroll.address.should be == address
		
		"delivered via mail".should be == payroll.deliver
	end

	it "should send a message when no address exists" do
		payroll = Payroll.new
		address = "234 Antiquera Ave"
	  "cannot deliver".should be == payroll.deliver
	end

end

	