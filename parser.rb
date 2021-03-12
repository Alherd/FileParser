# frozen_string_literal: true

require './lib/log_manager'

log_manager = LogManager.new(ARGV)

log_manager.show_page_visits
log_manager.show_pages_uniq_views
