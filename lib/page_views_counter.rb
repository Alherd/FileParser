# frozen_string_literal: true

# This class defines structure of page views count
class PageViewsCounter
  attr_reader :page, :views_count

  def initialize(page:, views_count:)
    @page = page
    @views_count = views_count
  end
end
