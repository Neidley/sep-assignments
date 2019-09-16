include RSpec

require_relative 'node_actor'

RSpec.describe HashItem, type: Node do
  let (:bacon) { Node.new("Kevin Bacon") }
  let (:lawrence) { Node.new("Jennifer Lawrence") }
  let (:woody) { Node.new("Woody Harrelson") }
  let (:emma) { Node.new("Emma Stone") }
  let (:stan) { Node.new("Stan Lee") }
  let (:downey) { Node.new("Robert Downey Jr.") }
  let (:zach) { Node.new("Zach Galifianakis") }
  let (:ed) { Node.new("Ed Helms") }

  describe "#add_movie" do
    it "properly inserts a new movie into node's film_actor_hash array" do
      bacon.add_movie("X-Men: First Class", lawrence)
      expect(bacon.film_actor_hash[0].key).to eq "X-Men: First Class"
      expect(bacon.film_actor_hash[0].value_array[0].name).to eq "Jennifer Lawrence"
    end

    it "properly assigns left node" do
      bacon.add_movie("X-Men: First Class", lawrence)
      lawrence.add_movie("X-Men: First Class", bacon)
      expect(bacon.left.name).to eq "Jennifer Lawrence"
      expect(lawrence.left.name).to eq "Kevin Bacon"
    end

    it "properly assigns right node if left node is occupied" do
      bacon.add_movie("X-Men: First Class", lawrence)
      lawrence.add_movie("X-Men: First Class", bacon)
      lawrence.add_movie("Hunger Games", woody)
      expect(lawrence.right.name).to eq "Woody Harrelson"
    end
  end

  describe "#print_info" do
     specify {
       expected_output = "Jennifer Lawrence is in X-Men: First Class with Kevin Bacon.\nJennifer Lawrence is in Hunger Games with Woody Harrelson.\n"
       lawrence.add_movie("X-Men: First Class", bacon)
       lawrence.add_movie("Hunger Games", woody)
       expect { lawrence.print_info }.to output(expected_output).to_stdout
     }
  end
end
