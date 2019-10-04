class Clinic
  attr_reader :waiting, :xray_room, :log
  
  def initialize(people)
    @waiting = people[:waiting] || 0
    @available = people[:available] || 0
    @xray_room = people[:xray_room] || 0
    @log = []
    @log << "waiting:#{@waiting}"
    @log << "available:#{@available}"
  end
  
  def enter
    raise "Cannot enter while someone is in the xray room" if @xray_room > 0
    @waiting -= 1
    @xray_room += 1
    @log << "enter"
  end

  def make_photo
    @log << "make_photo"
  end
  
  def leave
    @xray_room -= 1
    @log << "leave"
  end
end