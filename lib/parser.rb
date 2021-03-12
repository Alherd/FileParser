# frozen_string_literal: true

require './lib/log_entry'

# This class parses array of entries to array with visits
class Parser
  PAGE_VISITS = 'visits'
  PAGE_UNIQ_VIEWS = 'unique views'

  def initialize
    @visits = []
  end

  def parse(entries, parse_type)
    load_visits(entries) if @visits.empty?
    visits_grouped_by_urls ||= group_visits_by_urls

    map_visits_by_parse_type(visits_grouped_by_urls, parse_type)
  end

  private

  def load_visits(entries)
    entries.each do |entry|
      splitted_string = entry.split(' ')
      next unless splitted_string.count == 2

      url, ip = splitted_string
      @visits << LogEntry.new(url: url, ip: ip)
    end
  end

  def map_visits_by_parse_type(visits_grouped_by_urls, parse_type)
    case parse_type
    when PAGE_VISITS
      visits_grouped_by_urls.map { |url, visits| [url, visits.count] }
    when PAGE_UNIQ_VIEWS
      visits_grouped_by_urls.map { |url, visits| [url, visits.map(&:ip).uniq.count] }
    else
      puts 'Unknown parse type'
      []
    end
  end

  def group_visits_by_urls
    @visits.group_by(&:url)
  end
end
