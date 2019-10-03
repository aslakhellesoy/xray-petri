require_relative '../lib/clinic'

describe Clinic do
  it "can process one patient" do
    # Given
    clinic = Clinic.new
    clinic.waiting = 3
    clinic.xray_room = 0

    # When
    clinic.enter
    clinic.make_photo
    clinic.leave

    # Then
    expect(clinic.waiting).to eq(2)
    expect(clinic.xray_room).to eq(0)
  end
end