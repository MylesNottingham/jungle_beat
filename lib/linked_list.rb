class LinkedList
  attr_reader :head
  
  def initialize
    @head = nil
    @count = nil
    @to_string = nil
  end

  def append(node)
    @head = Node.new(node)
  end
end