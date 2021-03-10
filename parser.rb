# frozen_string_literal: true

require './lib/manager.rb'

manager = Manager.new(ARGV)

manager.show_page_visits
manager.show_pages_uniq_views
