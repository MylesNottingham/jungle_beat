class Node
  attr_reader :data
  
  def initialize(data)
      @data = data
      @next_node = nil
  end
end