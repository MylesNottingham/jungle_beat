require "rspec"
require "./lib/node"
require "./lib/linked_list"
require "./lib/jungle_beat"

RSpec.describe JungleBeat do
  describe "Iteration 3" do
    before(:each) do
      @jb = JungleBeat.new
    end

    it "exists" do
      expect(@jb).to be_a(JungleBeat)
    end

    it "begins with a list" do
      expect(@jb.list).to be_a(LinkedList)
    end

    it "begins with a list without a head" do
      expect(@jb.list.head).to eq(nil)
    end

    it "returns argument when append method is called" do
      expect(@jb.append("deep doo ditt")).to eq("deep doo ditt")
    end

    it "appends them all to the list" do
      @jb.append("deep doo ditt")

      expect(@jb.list.head.data).to eq("deep")
      expect(@jb.list.head.next_node.data).to eq("doo")
      expect(@jb.list.head.next_node.next_node.data).to eq("ditt")
    end

    it "can append some more and return the argument" do
      @jb.append("deep doo ditt")
      expect(@jb.append("woo hoo shu")).to eq("woo hoo shu")
    end

    it "can count nodes" do
      @jb.append("deep doo ditt")

      expect(@jb.count).to eq(3)

      @jb.append("woo hoo shu")

      expect(@jb.count).to eq(6)
    end

    it "can append six at once and return the argument" do
      expect(@jb.append("deep doo ditt woo hoo shu")).to eq("deep doo ditt woo hoo shu")
    end

    it "can still count nodes" do
      @jb.append("deep doo ditt woo hoo shu")

      expect(@jb.count).to eq(6)
    end

    it "can ask the list to count nodes too" do
      @jb.append("deep doo ditt woo hoo shu")

      expect(@jb.list.count).to eq(6)
    end

    it "can play them beats" do
      @jb.append("deep doo ditt woo hoo shu")

      expect(@jb.play).to eq("")
    end

    it "can play a ton of them beats" do
      25.times { @jb.append("deep doo ditt woo hoo shu") }

      expect(@jb.play).to eq("")
    end
  end

  describe "Iteration 4" do
    describe "Validating Beats" do
      before(:each) do
        @jb = JungleBeat.new("deep")
      end

      it "instantiates with beat as argument" do
        expect(@jb.list.head).to be_a(Node)
      end

      it "returns nil when append method is called with unapproved argument" do
        expect(@jb.append("Mississippi")).to eq(nil)
      end

      it "does not append unapproved arguments" do
        expect(@jb.list.head.next_node).to eq(nil)

        @jb.append("Mississippi")

        expect(@jb.list.head.next_node).to eq(nil)
      end

      it "returns list as string when all method is called" do
        @jb.append("Mississippi")

        expect(@jb.all).to eq("deep")
      end

      it "can prepend" do
        expect(@jb.prepend("tee tee tee Mississippi")).to eq("tee tee tee")
        expect(@jb.all).to eq("tee tee tee deep")
      end
    end

    describe "Speed & Voice" do
      before(:each) do
        @jb = JungleBeat.new("deep dop dop deep")
      end

      it "can still play them beats" do
        expect(@jb.play).to eq("")
      end

      it "can play them beats slowly" do
        expect(@jb.rate = 100).to eq(100)
        expect(@jb.play).to eq("")
      end

      it "can play them beats slowly in a different voice" do
        @jb.rate = 100

        expect(@jb.voice = "Daniel").to eq("Daniel")

        @jb.play

        expect(@jb.voice = "Alice").to eq("Alice")
        expect(@jb.play).to eq("")
      end

      it "can reset the rate and voice" do
        @jb.rate = 100
        @jb.voice = "Daniel"
        @jb.play

        expect(@jb.reset_rate).to eq(500)
        expect(@jb.reset_voice).to eq("Boing")
        expect(@jb.play).to eq("")
      end
    end
  end
end
