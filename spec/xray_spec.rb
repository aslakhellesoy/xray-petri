require_relative '../lib/clinic'

describe Clinic do
  before do
    @clinic = Clinic.new(
      waiting: 3,
      available: 1
    )
  end
  
  after do |e|
    name = e.metadata[:description_args][0].gsub(/\s+/, '_')
    File.open("model/#{name}.txt", "w") do |io|
      io.puts @clinic.log
    end
  end
  
  it "can process one patient" do
    @clinic.enter
    @clinic.make_photo
    @clinic.leave

    expect(@clinic.waiting).to eq(2)
    expect(@clinic.xray_room).to eq(0)
  end

  it "does not allow 2 people to enter" do
    @clinic.enter
    expect do
      @clinic.enter
    end.to raise_error(/enter/)
  end
end