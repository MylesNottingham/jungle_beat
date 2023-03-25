require "rspec"
require "./lib/node"
require "./lib/linked_list"

RSpec.describe LinkedList do
  before(:each) do
    @list = LinkedList.new
  end

  describe "Iteration 1" do
    it "exists" do
      expect(@list).to be_a(LinkedList)
    end

    it "begins without a head" do
      expect(@list.head).to eq(nil)
    end

    it "returns the input value of append when called" do
      expect(@list.append("doop")).to eq("doop")
      expect(@list.append("deep")).to eq("deep")
    end

    it "creates a node with append and makes it the head of the linked list" do
      @list.append("doop")

      expect(@list.head).to be_a(Node)
    end

    it "accurately checks the next node in the list" do
      @list.append("doop")

      expect(@list.head.next_node).to eq(nil)

      @list.append("deep")

      expect(@list.head.next_node).to be_a(Node)
    end

    it "counts the number of nodes in the linked list" do
      expect(@list.count).to eq(0)

      @list.append("doop")

      expect(@list.count).to eq(1)

      @list.append("deep")

      expect(@list.count).to eq(2)
    end

    it "reads the data of the head node" do
      @list.append("doop")

      expect(@list.head.data).to eq("doop")
    end

    it "returns data of head node as a string" do
      @list.append(5)

      expect(@list.to_string).to eq("5")
    end

    it "returns data of all nodes as one string" do
      @list.append("doop")
      @list.append("deep")

      expect(@list.to_string).to eq("doop deep")
    end
  end

  describe "Iteration 2" do
    it "returns the input value of prepend when called" do
      expect(@list.prepend("dop")).to eq("dop")
    end

    it "creates a node with prepend and makes it the head of the linked list" do
      @list.prepend("dop")

      expect(@list.head).to be_a(Node)
    end

    it "prepends a node to an established list" do
      @list.append("plop")
      @list.append("suu")
      @list.prepend("dop")

      expect(@list.head.data).to eq("dop")
    end

    it "still returns data of all nodes as one string" do
      @list.append("plop")
      @list.append("suu")
      @list.prepend("dop")

      expect(@list.to_string).to eq("dop plop suu")
    end

    it "still counts" do
      expect(@list.count).to eq(0)

      @list.append("plop")
      @list.append("suu")

      expect(@list.count).to eq(2)

      @list.prepend("dop")

      expect(@list.count).to eq(3)
    end
  end

  it "returns the input value of insert when called" do
    expect(@list.insert(0, "woo")).to eq("woo")
  end

  it "inserts a node at the head of an empty list" do
    @list.insert(0, "woo")

    expect(@list.head).to be_a(Node)
  end

  it "inserts a node at the head of an established list" do
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")
    @list.insert(0, "woo")

    expect(@list.to_string).to eq("woo dop plop suu")
  end

  it "inserts a node into a list at the defined index" do
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")
    @list.insert(1, "woo")

    expect(@list.to_string).to eq("dop woo plop suu")
  end

  it "inserts a node at the end of a list" do
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")
    @list.insert(3, "woo")

    expect(@list.to_string).to eq("dop plop suu woo")
  end

  it "raises 'Invalid Index' exception with index too high" do
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")

    expect { @list.insert(5, "woo") }.to raise_error(RuntimeError, "Invalid Index")
  end

  it "raises 'Invalid Index' exception with index too low" do
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")

    expect { @list.insert(-1, "woo") }.to raise_error(RuntimeError, "Invalid Index")
  end
end