require_relative "handler"

class FileHandler < Handler
  def initialize(path = "lifetrack.log")
    @path = path
  end

  def handle(event)
    File.open(@path, "a") { |f| f.puts event.to_s }
  end
end
