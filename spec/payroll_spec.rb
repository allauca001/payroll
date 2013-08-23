require_relative '../payroll.rb'

describe Payroll do

  it "should calculate basepay" do 
    basepay = Payroll.base_pay hourly_rate =25, hours =30
    750.should be_equal basepay
  end


  it "should calculate grosspay" do
    grosspay = Payroll.gross_pay hourly_rate=25, hours=[8, 10, 5]
    575.should be_equal grosspay
  end


  it "should calculate taxes" do
    taxpay = Payroll.tax_pay gross_pay=575, tax_rate=0.25
    (143.75).should be_equal taxpay
  end


  it "should send check to the address" do
    payroll = Payroll.new
    payroll.check_pay address="234 Antiquera Ave"
    "234 Antiquera Ave".should be == address
  
    "delivered via mail".should be == payroll.deliver
  end

  
  it "should deposit eft to the bank account" do
    payroll = Payroll.new
    payroll.eft_pay bank_account=12345678
    12345678.should be == bank_account

    "delivered by bank account".should be == payroll.deliver
  end

  it "should calculate overtime hours" do
    hours = Payroll.over_hours num=65    
    25.should be == hours

    hours = Payroll.over_hours num=35
    0.should be == hours
  end

   it "should calculate overtime 1" do
     overtime = Payroll.overtime hourly_rate=80, hours=65
     3000.should be == overtime
   end

end





	