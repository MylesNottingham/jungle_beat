class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(beats)
    beats.split.each do |beat|
      @list.append(beat)
    end
    @list.to_string
  end

  def count
    @list.count
  end
end