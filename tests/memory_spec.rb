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
end

describe Employee do

  it "should assign a unique id" do
    first_employee = Employee.new
    1.should be_equal first_employee.id
    
    second_employee = Employee.new
    2.should be_equal second_employee.id

    third_employee = Employee.new
    3.should be_equal third_employee.id
  end

  it "should maintain: name, id, ssn, address, hourly rate" do
    first_employee = Employee.new do |e, c, d|
      e.name = "Olga Allauca"
      e.ssn = "111-1111-11"
      e.home_address = "234 Antiquera Ave"
      e.hourly_rate = 71 + c + d
    end

    

    "Olga Allauca".should be == first_employee.name
    "111-1111-11".should be == first_employee.ssn
    "234 Antiquera Ave".should be  == first_employee.home_address
    80.should be == first_employee.hourly_rate
  end

end



