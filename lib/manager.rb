# frozen_string_literal: true

require './lib/validator'
require './lib/loader'
require './lib/parser'
require './lib/sorter'
require './lib/display'

# This class manages process of parsing and output file
class Manager
  attr_reader :file_path, :loader, :parser, :sorter

  FILE_PATH_INDEX = 0
  PAGE_VISITS_HEADER = 'List of webpages with most page views ordered from most pages views to less page views'
  PAGE_UNIQ_VIEWS_HEADER = 'List of webpages with most unique page views'

  def initialize(args)
    @file_path = args[FILE_PATH_INDEX]
    @loader = Loader.new
    @parser = Parser.new
    @sorter = Sorter.new
  end

  def show_page_visits
    handle(Parser::PAGE_VISITS, PAGE_VISITS_HEADER)
  end

  def show_pages_uniq_views
    handle(Parser::PAGE_UNIQ_VIEWS, PAGE_UNIQ_VIEWS_HEADER)
  end

  private

  def handle(parse_type, header)
    log_entries_enumerator = loader.load_entries_into_enumerator(file_path)
    parsed_log_entries_by_views = parser.parse(log_entries_enumerator, parse_type)
    sorted_log_entries_by_views = sorter.sort(parsed_log_entries_by_views)

    Display.new(header: header, array: sorted_log_entries_by_views, description: parse_type).output
  end
end
