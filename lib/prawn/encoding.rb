# encoding: utf-8
#
# Copyright September 2008, Gregory Brown, James Healy  All Rights Reserved.
#
# This is free software. Please see the LICENSE and COPYING files for details.
#
module Prawn
  module Encoding
    # Map between unicode and WinAnsiEnoding
    #
    class WinAnsi

      def initialize
        @mapping_file = "#{Prawn::BASEDIR}/data/encodings/win_ansi.txt"
        load_mapping if @@mapping.nil?
      end

      # Converts a Unicode codepoint into a valid WinAnsi single byte character.
      #
      # If there is no WinAnsi equivlant for a character, a _ will be substituted.
      #
      def [](codepoint)
        # unicode codepoints < 255 map directly to the single byte value in WinAnsi
        return codepoint if codepoint <= 255

        # There are a handful of codepoints > 255 that have equivilants in WinAnsi.
        # Replace anything else with an underscore
        @@mapping[codepoint] || 95
      end

      private

      def load_mapping
        @@mapping = {}
        RUBY_VERSION >= "1.9" ? mode = "r:BINARY" : mode = "r"
        File.open(@mapping_file, mode) do |f|
          f.each do |l|
            m, single_byte, unicode = *l.match(/([0-9A-Za-z]+);([0-9A-F]{4})/)
            @@mapping["0x#{unicode}".hex] = "0x#{single_byte}".hex if single_byte
          end
        end
      end
    end
  end
end
