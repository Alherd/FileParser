# frozen_string_literal: true

# This class sorts arrar by value param
class PageViewsSorter
  def sort(page_views_array)
    page_views_array.sort { |left, right| right.last <=> left.last }
  end
end
