# frozen_string_literal: true

require './lib/log_manager'

manager = LogManager.new(ARGV)

manager.show_page_visits
manager.show_pages_uniq_views
