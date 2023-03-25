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

  def prepend(node)
    if @head
      next_node = @head
      first_node = Node.new(node)
      first_node.set_next_node(next_node)
      @head = first_node
    else
      @head = Node.new(node)
    end
    node
  end

  def insert(index, node)
    length = self.count
    if (0..length).include? index
      if index == 0
        self.prepend(node)
      elsif @head.next_node == nil
        self.append(node)
      else
        count = 1
        previous_node = @head
        slice_node = Node.new(node)
        next_node = @head.next_node
        until count == index
          previous_node = previous_node.next_node
          next_node = previous_node.next_node
          count += 1
        end
        previous_node.set_next_node(slice_node)
        slice_node.set_next_node(next_node)
      end
    else
      raise "Invalid Index"
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

  def find(position, number_of_elements)
    length = self.count
    if position + number_of_elements - 1 <= length && position >= 0 && number_of_elements > 0
      select_data = []
      select_node = @head
      index = 0
      (position + number_of_elements).times do
        if index >= position
          select_data << select_node.data
        end
        select_node = select_node.next_node
        index += 1
      end
    else
      raise "Invalid Parameters"
    end
    string = select_data.join(' ').to_s
  end

  def includes?(data)
    self.to_string.include?(data)
  end

  def pop
    if @head
      if @head.next_node == nil
        pop_node = @head
        @head = nil
      else
        previous_node = nil
        pop_node = @head
        last_node = @head.next_node
        until last_node == nil
          previous_node = pop_node
          pop_node = last_node
          last_node = pop_node.next_node
        end
        previous_node.set_next_node(nil)
      end
      pop_node.data
    else
      raise "Nothing to Pop"
    end
  end
end