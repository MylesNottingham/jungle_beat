class LinkedList
  attr_reader :head, :to_string
  
  def initialize
    @head = nil
    @to_string = @head.data if @head
  end

  def count
    if @head
      count = 1
      last_node = @head.next_node
      while last_node
        count += 1
        last_node = last_node.next_node
      end
    else
      count = 0
    end
    count
  end

  def append(node)
    if @head
      next_node = @head
      last_node = @head.next_node
      until last_node == nil
        next_node = last_node
        last_node = last_node.next_node
      end
      next_node.set_next_node(Node.new(node))
    else
      @head = Node.new(node)
    end
    node
  end
end