include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("Pacific Rim", 72) }

  let (:heap) { MinBinaryHeap.new(root) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      heap.insert(root, braveheart)
      expect(root.left.title).to eq "Braveheart"
    end

    it "properly inserts a new node as a right child" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      expect(root.right.title).to eq "Star Wars: Return of the Jedi"
    end

    it "properly inserts a new node as a left-left child" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      expect(root.left.left.title).to eq "Donnie Darko"
    end

    it "properly inserts a new node as a left-right child" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      expect(root.left.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right-left child" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      heap.insert(root, matrix)
      expect(root.right.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a right-right child" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      heap.insert(root, matrix)
      heap.insert(root, district)
      expect(root.right.right.title).to eq "District 9"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      expect(heap.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      heap.insert(root, braveheart)
      expect(heap.find(root, braveheart.title).title).to eq "Braveheart"
    end

    it "properly finds a left-left node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      expect(heap.find(root, donnie.title).title).to eq "Donnie Darko"
    end

    it "properly finds a left-right node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      expect(heap.find(root, inception.title).title).to eq "Inception"
    end

    it "properly finds a right node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      expect(heap.find(root, jedi.title).title).to eq "Star Wars: Return of the Jedi"
    end

    it "properly finds a right-left node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      heap.insert(root, matrix)
      expect(heap.find(root, matrix.title).title).to eq "The Matrix"
    end

    it "properly finds a right-right node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      heap.insert(root, matrix)
      heap.insert(root, district)
      expect(heap.find(root, district.title).title).to eq "District 9"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(root, braveheart)
      heap.delete(root, braveheart.title)
      expect(heap.find(root, braveheart.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.delete(root, donnie.title)
      expect(heap.find(root, donnie.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      heap.delete(root, inception.title)
      expect(heap.find(root, inception.title)).to be_nil
    end

    it "properly deletes a right node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.delete(root, jedi.title)
      expect(heap.find(root, jedi.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      heap.insert(root, matrix)
      heap.delete(root, matrix.title)
      expect(heap.find(root, matrix.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      heap.insert(root, matrix)
      heap.insert(root, district)
      heap.delete(root, district.title)
      expect(heap.find(root, district.title)).to be_nil
    end

    it "properly deletes a node with one child" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.delete(root, braveheart.title)
      expect(heap.find(root, braveheart.title)).to be_nil
      expect(heap.find(root, donnie.title).title).to eq "Donnie Darko"
    end

    it "properly deletes a node with two children" do
      heap.insert(root, braveheart)
      heap.insert(root, jedi)
      heap.insert(root, donnie)
      heap.insert(root, inception)
      heap.delete(root, braveheart.title)
      expect(heap.find(root, braveheart.title)).to be_nil
      expect(heap.find(root, donnie.title).title).to eq "Donnie Darko"
      expect(heap.find(root, inception.title).title).to eq "Inception"
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDonnie Darko: 85\nInception: 86\nThe Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(root, braveheart)
       heap.insert(root, jedi)
       heap.insert(root, donnie)
       heap.insert(root, inception)
       heap.insert(root, matrix)
       heap.insert(root, district)
       heap.insert(root, shawshank)
       heap.insert(root, martian)
       heap.insert(root, hope)
       heap.insert(root, empire)
       heap.insert(root, mad_max_2)
       expect { heap.printf }.to output(expected_output).to_stdout
     }
  end
end
