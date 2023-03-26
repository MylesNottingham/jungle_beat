class JungleBeat
  attr_reader :list
  attr_accessor :rate, :voice

  def initialize(beats = nil, rate = 500, voice = "Boing")
    @list = LinkedList.new
    @rate = rate
    @voice = voice
    @direct_call = 1
    append(beats) && @direct_call = 0 unless beats.nil?
  end

  def select_beats(beats)
    approved_beats = "tee dee deep bop boop la na doo ditt woo hoo shu dop".split
    beats.split.select do |beat|
      approved_beats.include?(beat)
    end
  end

  def append(beats)
    selected_beats = select_beats(beats)
    selected_beats.each do |beat|
      @list.append(beat)
    end
    @direct_call += 1
    selected_beats.join(" ") if @direct_call > 1
  end

  def prepend(beats)
    selected_beats = select_beats(beats)
    selected_beats.each do |beat|
      @list.prepend(beat)
    end
    selected_beats.join(" ")
  end

  def count
    @list.count
  end

  def all
    @list.to_string
  end

  def play
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
  end
end
