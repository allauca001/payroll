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
