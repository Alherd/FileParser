# frozen_string_literal: true

# This class defines structure of page views to display
class PageViewsDisplayStructure
  attr_reader :header, :page_views, :description

  def initialize(header:, page_views:, description:)
    @header = header
    @page_views = page_views
    @description = description
  end
end
