require 'zebra/zpl/printable'

module Zebra
  module Zpl
    module Rfid
      def self.from_ascii(data)
        RfidAscii.new(data)
      end

      def self.from_hex(data)
        RfidHex.new(data)
      end

      class RfidAscii
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def to_zpl
          # W,A is for Write ASCII
          "^RFW,A^FD#{data}^FS"
        end
      end

      class RfidHex
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def to_zpl
          # W,A is for Write Hex
          "^RFW,H^FD#{data}^FS"
        end
      end
    end
  end
end
