# frozen_string_literal: true

# This class defines type of string output
class Display
  attr_reader :header, :array, :description

  def initialize(header: '', array: [], description: '')
    @header = header
    @array = array
    @description = description
  end

  def output
    puts build_string_to_output
  end

  private

  def build_string_to_output
    output = "\n#{header}\n"
    array.each { |page, visits| output += "#{page} #{visits} #{description} \n" }

    output
  end
end
