require "spec_helper"

describe Zebra::Zpl::Rfid do
  it "can be initialized with the ascii text to print" do
    ascii = "ascii text to print"
    rfid = described_class.from_ascii(ascii)
    expect(rfid.data).to eq ascii
    expected_zpl = "^RFW,A^FD#{ascii}^FS"
    expect(rfid.to_zpl).to eq expected_zpl
  end

  it "can be initialized with the hex to print" do
    hex = "hex to print"
    rfid = described_class.from_hex(hex)
    expect(rfid.data).to eq hex
    expected_zpl = "^RFW,H^FD#{hex}^FS"
    expect(rfid.to_zpl).to eq expected_zpl
  end
end
