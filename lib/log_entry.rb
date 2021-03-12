# frozen_string_literal: true

# This class defines structure of file entry
class LogEntry
  attr_reader :url, :ip

  def initialize(url:, ip:)
    @url = url
    @ip = ip
  end
end
