# frozen_string_literal: true

# This class creates string from params
class StringBuilder
  def build(header: '', array: [], description: '')
    output = "\n#{header}\n"
    array.each { |key, value| output += "#{key} #{value} #{description} \n" }

    output
  end
end
