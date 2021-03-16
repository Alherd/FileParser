# frozen_string_literal: true

# This class sorts arrar by value param
class PageViewsSorter
  def sort(page_views)
    page_views.sort { |left, right| right.views_count <=> left.views_count }
  end
end
