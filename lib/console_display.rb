# frozen_string_literal: true

# This class defines type of string output
class ConsoleDisplay
  attr_reader :header, :page_views_array, :description

  def initialize(header: '', page_views_array: [], description: '')
    @header = header
    @page_views_array = page_views_array
    @description = description
  end

  def output
    puts build_string_to_output
  end

  private

  def build_string_to_output
    output = "\n#{header}\n"
    page_views_array.each { |page, visits| output += "#{page} #{visits} #{description} \n" }

    output
  end
end
