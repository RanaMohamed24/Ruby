class Handler
  def handle(event)
    raise NotImplementedError, "#{self.class} must implement #handle"
  end
end
