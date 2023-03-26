require "rspec"
require "./lib/node"
require "./lib/linked_list"
require "./lib/jungle_beat"

RSpec.describe JungleBeat do
  before(:each) do
    @jb = JungleBeat.new
  end

  describe "Iteration 4" do
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
      expect(@jb.append("woo hoo shu")).to eq("woo hoo shu")
    end

    it "can count nodes" do
      @jb.append("deep doo ditt")

      expect(@jb.count).to eq(3)

      @jb.append("woo hoo shu")

      expect(@jb.count).to eq(6)
    end
  end
end
