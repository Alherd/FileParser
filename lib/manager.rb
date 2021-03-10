# frozen_string_literal: true

require './lib/validator'
require './lib/loader'
require './lib/parser'
require './lib/sorter'
require './lib/string_builder'
require './lib/display'

# This class manages process of parsing and output file
class Manager
  attr_reader :file_path, :loader, :parser, :sorter, :string_builder

  FILE_PATH_INDEX = 0
  PAGE_VISITS_HEADER = 'List of webpages with most page views ordered from most pages views to less page views'
  PAGE_UNIQ_VIEWS_HEADER = 'List of webpages with most unique page views'

  def initialize(args)
    @file_path = args[FILE_PATH_INDEX]
    @loader = Loader.new
    @parser = Parser.new
    @sorter = Sorter.new
    @string_builder = StringBuilder.new
  end

  def show_page_visits
    handle(Parser::PAGE_VISITS, PAGE_VISITS_HEADER)
  end

  def show_pages_uniq_views
    handle(Parser::PAGE_UNIQ_VIEWS, PAGE_UNIQ_VIEWS_HEADER)
  end

  private

  def handle(parse_type, header)
    enumerator = loader.load(file_path)
    parsed_array = parser.parse(enumerator, parse_type)
    sorted_array = sorter.sort(parsed_array)
    string_for_output = string_builder.build(header: header, array: sorted_array, description: parse_type)

    Display.output(string_for_output)
  end
end
