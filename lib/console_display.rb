# frozen_string_literal: true

# This class defines type of string output
class ConsoleDisplay
  attr_reader :header, :page_views, :description

  def initialize(display_structure)
    @header = display_structure.header
    @page_views = display_structure.page_views
    @description = display_structure.description
  end

  def output
    puts "\n#{header}\n"
    puts build_string_to_output.join("\n")
  end

  private

  def build_string_to_output
    page_views.map do |page_view|
      "#{page_view.page} #{page_view.views_count} #{description}"
    end
  end
end
