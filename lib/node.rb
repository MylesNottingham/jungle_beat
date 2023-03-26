class Node
  attr_reader :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end

  def set_next_node(node)
    @next_node = node
  end
end
