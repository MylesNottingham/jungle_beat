class LinkedList
  attr_reader :head
  
  def initialize
    @head = nil
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

  def to_string
    if @head
      all_data = [@head.data]
      last_node = @head.next_node
      while last_node
        all_data << last_node.data
        last_node = last_node.next_node
      end
    end
    string = all_data.join(' ').to_s
  end
end