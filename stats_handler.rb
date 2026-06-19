require_relative "handler"

class StatsHandler < Handler
  def initialize
    @events = []
    at_exit { print_summary }
  end

  def handle(event)
    @events << event
  end

  private

  def print_summary
    return if @events.empty?

    puts "\n=== LifeTrack Session Summary ==="
    puts "Total events: #{@events.length}"
    puts "Total time:   #{@events.sum(&:duration)} min"
    puts ""

    grouped = @events.group_by(&:type)
    grouped.each do |type, events|
      total = events.sum(&:duration)
      puts "  #{type.capitalize}: #{events.length} event(s), #{total} min"
    end

    puts "================================="
  end
end
