include RSpec

require_relative 'min_binary_heap'

RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("The Matrix", 87) }


  let (:space_jam) { Node.new("Space Jam", 38)  }
  let (:billy_madison) { Node.new("Billy Madison", 46) }
  let (:superbad) { Node.new("Superbad", 87) }
  let (:jay_and_silent_bob) { Node.new("Jay and Silent Bob Strike Back", 53) }
  let (:tenacious_d) { Node.new("Tenacious D in The Pick of Destiny", 54) }
  let (:tropic_thunder) { Node.new("Tropic Thunder", 82) }
  let (:iron_man) { Node.new("Iron Man", 94) }
  let (:last_jedi) { Node.new("Star Wars: The Last Jedi", 91) }
  let (:walk_hard) { Node.new("Walk Hard: The Dewey Cox Story", 74) }



  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(root, pacific_rim)
      expect(root.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      expect(root.left.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      expect(root.left.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, district)
      expect(root.right.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      expect(root.right.left.title).to eq "The Martian"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(root.right.right.title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, pacific_rim)
      expect(tree.find(root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a left-left node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      expect(tree.find(root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a left-right node" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      expect(tree.find(root, inception.title).title).to eq "Inception"
    end

    it "properly finds a right node" do
      tree.insert(root, district)
      expect(tree.find(root, district.title).title).to eq "District 9"
    end

    it "properly finds a right-left node" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      expect(tree.find(root, martian.title).title).to eq "The Martian"
    end

    it "properly finds a right-right node" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, hope)
      tree.delete(root, hope.title)
      expect(tree.find(root, hope.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.delete(root, pacific_rim.title)
      expect(tree.find(root, pacific_rim.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.delete(root, inception.title)
      expect(tree.find(root, inception.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, district)
      tree.delete(root, district.title)
      expect(tree.find(root, district.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      tree.delete(root, martian.title)
      expect(tree.find(root, martian.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      tree.delete(root, mad_max_2.title)
      expect(tree.find(root, mad_max_2.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "The Matrix: 87\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nPacific Rim: 72\nInception: 86\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nBraveheart: 78\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\nDistrict 9: 90\n"
       tree.insert(root, hope)
       tree.insert(root, empire)
       tree.insert(root, jedi)
       tree.insert(root, martian)
       tree.insert(root, pacific_rim)
       tree.insert(root, inception)
       tree.insert(root, braveheart)
       tree.insert(root, shawshank)
       tree.insert(root, district)
       tree.insert(root, mad_max_2)
       expect { tree.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "The Matrix: 87\nBraveheart: 78\nMad Max 2: The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
       tree.insert(root, mad_max_2)
       tree.insert(root, district)
       tree.insert(root, shawshank)
       tree.insert(root, braveheart)
       tree.insert(root, inception)
       tree.insert(root, pacific_rim)
       tree.insert(root, martian)
       tree.insert(root, jedi)
       tree.insert(root, empire)
       tree.insert(root, hope)
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end
