class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(beats)
    beats.split.each do |beat|
      @list.append(beat)
    end
    beats
  end

  def count
    @list.count
  end

  def play
    `say -r 500 -v Boing #{@list.to_string}`
  end
end
