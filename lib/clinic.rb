class Clinic
  attr_accessor :waiting, :xray_room
  
  def enter
    @waiting -= 1
    @xray_room += 1
  end

  def make_photo
  end
  
  def leave
    @xray_room -= 1
  end
end