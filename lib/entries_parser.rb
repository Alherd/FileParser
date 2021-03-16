# frozen_string_literal: true

require './lib/log_entry'
require './lib/page_views_counter'

# This class parses array of entries to array with visits
class EntriesParser
  PAGE_VISITS = 'visits'
  PAGE_UNIQ_VIEWS = 'unique views'

  def initialize
    @log_entries = []
  end

  def parse(log_entries, parse_type)
    load_log_entries(log_entries) if @log_entries.empty?

    map_log_entries_by_parse_type(@log_entries, parse_type)
  end

  private

  def load_log_entries(entries)
    entries.each do |entry|
      splitted_string = entry.split(' ')
      next unless splitted_string.count == 2

      url, ip = splitted_string
      @log_entries << LogEntry.new(url: url, ip: ip)
    end

    group_log_entries_by_urls
  end

  def map_log_entries_by_parse_type(log_entries_grouped_by_urls, parse_type)
    case parse_type
    when PAGE_VISITS
      log_entries_grouped_by_urls.map { |url, views| create_page_views_counter(url, views.count) }
    when PAGE_UNIQ_VIEWS
      log_entries_grouped_by_urls.map { |url, views| create_page_views_counter(url, views.map(&:ip).uniq.count) }
    else
      puts 'Unknown parse type'
      []
    end
  end

  def create_page_views_counter(page, views_count)
    PageViewsCounter.new(page: page, views_count: views_count)
  end

  def group_log_entries_by_urls
    @log_entries = @log_entries.group_by(&:url)
  end
end
