require_relative "handler"

class EventRouter
  def initialize
    @handlers = []
  end

  def register(handler)
    unless handler.is_a?(Handler)
      raise ArgumentError, "#{handler.class} must inherit from Handler"
    end

    @handlers << handler
  end

  def dispatch(event)
    @handlers.each { |h| h.handle(event) }
  end
end
