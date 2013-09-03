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