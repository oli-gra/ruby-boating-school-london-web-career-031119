class Student

attr_reader :first_name, :test_name, :test_status, :instructor

ALL = []

def initialize(first_name)
  @first_name = first_name
  ALL << self
end

def self.all
  ALL
end

def add_boating_test(test_name,status,instructor)
  # "Don't Crash 101", "pending", puff
  BoatingTest.new(self,test_name,status,instructor)
end

def self.find_student(name)
  self.all.each do |student|
    return student if student.first_name.downcase == name.downcase
  end
end

def self.grade_percentage(student)
  tests = BoatingTest.all.select{|test|test.student == self}
  tests.select{|test|test.test_status=='passed'}.count.to_f / tests.count.to_f * 100
end

end
