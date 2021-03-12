# frozen_string_literal: true

require './lib/file_validator'
require './lib/entries_loader'
require './lib/entries_parser'
require './lib/page_views_sorter'
require './lib/console_display'

# This class manages process of parsing and output file
class Manager
  attr_reader :file_path, :entries_loader, :entries_parser, :page_views_sorter

  FILE_PATH_INDEX = 0
  PAGE_VISITS_HEADER = 'List of webpages with most page views ordered from most pages views to less page views'
  PAGE_UNIQ_VIEWS_HEADER = 'List of webpages with most unique page views'

  def initialize(args)
    @file_path = args[FILE_PATH_INDEX]
    @entries_loader = EntriesLoader.new
    @entries_parser = EntriesParser.new
    @page_views_sorter = PageViewsSorter.new
  end

  def show_page_visits
    handle(EntriesParser::PAGE_VISITS, PAGE_VISITS_HEADER)
  end

  def show_pages_uniq_views
    handle(EntriesParser::PAGE_UNIQ_VIEWS, PAGE_UNIQ_VIEWS_HEADER)
  end

  private

  def handle(parse_type, header)
    log_entries_enumerator = entries_loader.load_entries_into_enumerator(file_path)
    parsed_log_entries_by_views = entries_parser.parse(log_entries_enumerator, parse_type)
    sorted_log_entries_by_views = page_views_sorter.sort(parsed_log_entries_by_views)

    ConsoleDisplay
      .new(header: header, page_views_array: sorted_log_entries_by_views, description: parse_type)
      .output
  end
end
