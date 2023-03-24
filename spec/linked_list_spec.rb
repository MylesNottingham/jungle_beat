require "rspec"
require "./lib/node"
require "./lib/linked_list"

RSpec.describe LinkedList do
  before(:each) do
    @list = LinkedList.new
  end

  it "exists" do
    expect(@list).to be_an_instance_of(LinkedList)
  end

  it "begins without a head" do
    expect(@list.head).to eq(nil)
  end

  it "can returns the input value of append when called" do
    expect(@list.append("doop")).to eq("doop")
    expect(@list.append("deep")).to eq("deep")
  end

  it "can create a node and make it the head of the linked list" do
    @list.append("doop")
    expect(@list.head).to be_a(Node)
  end

  it "can accurately check the next node in the list" do
    @list.append("doop")
    expect(@list.head.next_node).to eq(nil)
    @list.append("deep")
    expect(@list.head.next_node).to be_a(Node)
  end

  it "can count the number of nodes in the linked list" do
    expect(@list.count).to eq(0)
    @list.append("doop")
    expect(@list.count).to eq(1)
    @list.append("deep")
    expect(@list.count).to eq(2)
  end

  it "can read the data of the head node" do
    @list.append("doop")
    expect(@list.head.data).to eq("doop")
  end

  it "can return data of head node as a string" do
    @list.append(5)
    expect(@list.to_string).to eq("5")
  end

  it "can return data of all nodes as one string" do
    @list.append("doop")
    @list.append("deep")
    expect(@list.to_string).to eq("doop deep")
  end
end