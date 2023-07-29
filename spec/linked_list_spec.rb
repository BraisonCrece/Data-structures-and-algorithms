# frozen_string_literal: true

require_relative "../data-structures/LinkedList/linked_list"

RSpec.describe LinkedList do
  context "with an empty list" do
    describe "#append" do
      it "adds a value to the enf of the list" do
        expect(subject.append("First Value")).to eq "Success: Value 'First Value' was appended"
        expect(subject.head.value).to eq "First Value"
        expect(subject.tail.value).to eq "First Value"
        expect(subject.size).to eq 1
      end
    end

    describe "#prepend" do
      it "adds a value at the start of the list" do
        expect(subject.prepend("New first value")).to eq "Success: Value 'New first value' was prepended"
        expect(subject.head.value).to eq "New first value"
        expect(subject.tail.value).to eq "New first value"
      end
    end

    describe "#isert_at" do
      it "show an error" do
        expect { subject.insert_at(0, "First value") }.to output("Error: The list is empty\n").to_stderr
      end
    end

    describe "#get" do
      it "returns error message if list is empty" do
        expect { subject.get(0) }.to output("Error: The list is empty\n").to_stderr
      end
    end

    describe "#replace" do
      it "returns error message if list is empty" do
        expect { subject.replace(0, "New Value") }.to output("Error: The list is empty\n").to_stderr
      end
    end

    describe "#remove" do
      it "returns error message if the list is empty" do
        expect { subject.remove(0) }.to output("Error: The list is empty\n").to_stderr
      end
    end

    describe "#inspect" do
      it "prints the linked list" do
        expect(subject.inspect).to eq []
      end
    end

    describe "#size" do
      it "returns 0 if the linked list is empty" do
        expect(subject.size).to eq 0
      end
    end
  end

  context "whit nodes already in the list" do
    before do
      subject.append("First Value")
      subject.append("Second Value")
    end

    describe "#append" do
      it "adds a value to the enf of the list" do
        expect(subject.append("Third Value")).to eq "Success: Value 'Third Value' was appended"
        expect(subject.head.value).to eq "First Value"
        expect(subject.tail.value).to eq "Third Value"
        expect(subject.size).to eq 3
      end
    end

    describe "#prepend" do
      it "adds a value at the start of the list" do
        expect(subject.prepend("New first value")).to eq "Success: Value 'New first value' was prepended"
        expect(subject.head.value).to eq "New first value"
        expect(subject.tail.value).to eq "Second Value"
      end
    end

    describe "#isert_at" do
      it "inserts the node on index 0" do
        expect(subject.size).to eq 2
        expect(subject.insert_at(0, "New node")).to eq "Success: Value 'New node' was inserted at index 0"
        expect(subject.head.value).to eq "New node"
        expect(subject.size).to eq 3
      end

      it "inserts the node on the last index" do
        expect(subject.size).to eq 2
        expect(subject.insert_at(2, "New node")).to eq "Success: Value 'New node' was inserted at index 2"
        expect(subject.tail.value).to eq "New node"
        expect(subject.size).to eq 3
      end

      it "inserts the new node in the middle" do
        expect(subject.size).to eq 2
        expect(subject.insert_at(1, "New node")).to eq "Success: Value 'New node' was inserted at index 1"
        expect(subject.head.value).to eq "First Value"
        expect(subject.tail.value).to eq "Second Value"
        expect(subject.size).to eq 3
      end
    end

    describe "#get" do
      it "gets the value at a given index" do
        expect(subject.get(1)).to eq "Second Value"
      end

      it "returns error message if index out of bounds" do
        expect { subject.get(10) }.to output("Index 10 out of bounds\n").to_stderr
      end
    end

    describe "#replace" do
      it "replaces the value at a given index" do
        subject.replace(1, "New First Value")
        expect(subject.get(1)).to eq "New First Value"
      end

      it "returns error message if index out of bounds" do
        expect { subject.replace(10, "New Value") }.to output("Index 10 out of bounds\n").to_stderr
      end
    end

    describe "#remove" do
      it "removes the value at a given index" do
        subject.remove(0)
        expect(subject.get(0)).to eq "Second Value"
      end

      it "returns error message if index out of bounds" do
        expect { subject.remove(10) }.to output("Index 10 out of bounds\n").to_stderr
      end
    end

    describe "#inspect" do
      it "prints the linked list" do
        expect(subject.inspect).to eq ["First Value", "Second Value"]
      end
    end

    describe "#size" do
      it "returns the size of the linked list" do
        subject.append("Third Value")
        expect(subject.size).to eq 3
      end
    end
  end
end
