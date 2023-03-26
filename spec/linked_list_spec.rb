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
    describe "prepend" do
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

    describe "insert" do
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

    describe "find" do
      before(:each) do
        @list.append("deep")
        @list.append("woo")
        @list.append("shi")
        @list.append("shu")
        @list.append("blop")
      end

      it "has five nodes in an established list" do
        expect(@list.to_string).to eq("deep woo shi shu blop")
      end

      it "finds a single node" do
        expect(@list.find(2, 1)).to eq("shi")
      end

      it "finds multiple nodes" do
        expect(@list.find(1, 3)).to eq("woo shi shu")
      end

      it "raises 'Invalid Parameters' exception with position too high" do
        expect { @list.find(7, 1) }.to raise_error(RuntimeError, "Invalid Parameters")
      end

      it "raises 'Invalid Parameters' exception with position too low" do
        expect { @list.find(-1, 1) }.to raise_error(RuntimeError, "Invalid Parameters")
      end

      it "raises 'Invalid Parameters' exception with number_of_elements too high" do
        expect { @list.find(0, 7) }.to raise_error(RuntimeError, "Invalid Parameters")
      end

      it "raises 'Invalid Parameters' exception with number_of_elements too low" do
        expect { @list.find(0, 0) }.to raise_error(RuntimeError, "Invalid Parameters")
      end
    end

    describe "includes?" do
      before(:each) do
        @list.append("deep")
        @list.append("woo")
        @list.append("shi")
        @list.append("shu")
        @list.append("blop")
      end

      it "returns true if data is in list" do
        expect(@list.includes?("deep")).to eq(true)
      end

      it "returns false if data is in list" do
        expect(@list.includes?("dep")).to eq(false)
      end
    end

    describe "pop" do
      before(:each) do
        @list.append("deep")
        @list.append("woo")
        @list.append("shi")
        @list.append("shu")
        @list.append("blop")
      end

      it "returns data from last node in list when called" do
        expect(@list.pop).to eq("blop")
        expect(@list.pop).to eq("shu")
      end

      it "removes last node from list" do
        @list.pop
        @list.pop

        expect(@list.to_string).to eq("deep woo shi")
      end

      it "can remove all nodes from list" do
        5.times do
          @list.pop
        end

        expect(@list.head).to eq(nil)
      end

      it "raises 'Nothing to Pop' exception when called on an empty list" do
        5.times do
          @list.pop
        end

        expect { @list.pop }.to raise_error(RuntimeError, "Nothing to Pop")
      end
    end
  end
end
