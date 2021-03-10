# frozen_string_literal: true

# This class sorts arrar by value param
class Sorter
  def sort(array)
    array.sort { |left, right| right.last <=> left.last }
  end
end
