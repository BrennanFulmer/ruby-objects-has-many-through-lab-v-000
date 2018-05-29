
class Doctor
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    self.class.all << self
  end
  
  def self.all 
    @@all
  end
  
  def new_appointment(date, patient)
    item = Appointment.new(date, patient, self)
    item.doctor = self
    item
  end
  
  def appointments
    Appointment.all.select { |item| item.doctor == self }
  end
  
  def patients
    appointments.collect { |item| item.patient }
  end
end