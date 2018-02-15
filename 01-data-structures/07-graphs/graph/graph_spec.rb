include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
  let (:bacon) { Node.new("Kevin Bacon") }

  let (:graph) { Graph.new(bacon) }

  let (:lawrence) { Node.new("Jennifer Lawrence") }
  let (:woody) { Node.new("Woody Harrelson") }
  let (:emma) { Node.new("Emma Stone") }
  let (:stan) { Node.new("Stan Lee") }
  let (:downey) { Node.new("Robert Downey Jr.") }
  let (:zach) { Node.new("Zach Galifianakis") }
  let (:ed) { Node.new("Ed Helms") }

  describe "#find" do
    it "properly finds an actor/node given a name(string) and root(node)" do
      bacon.add_movie("X-Men: First Class", lawrence)
      lawrence.add_movie("X-Men: First Class", bacon)
      lawrence.add_movie("Hunger Games", woody)
      woody.add_movie("Hunger Games", lawrence)
      woody.add_movie("Zombieland", emma)
      emma.add_movie("Zombieland", woody)
      emma.add_movie("Amazing Spider-man", stan)
      stan.add_movie("Amazing Spider-man", emma)
      stan.add_movie("Iron Man 2", downey)
      downey.add_movie("Iron Man 2", stan)
      downey.add_movie("Due Date", zach)
      zach.add_movie("Due Date", downey)
      zach.add_movie("The Hangover", ed)
      ed.add_movie("The Hangover", zach)
      expect(graph.find(bacon, "Kevin Bacon")).to eq bacon
      expect(graph.find(bacon, "Jennifer Lawrence")).to eq lawrence
      expect(graph.find(bacon, "Woody Harrelson")).to eq woody
      expect(graph.find(bacon, "Emma Stone")).to eq emma
      expect(graph.find(bacon, "Stan Lee")).to eq stan
      expect(graph.find(bacon, "Robert Downey Jr.")).to eq downey
      expect(graph.find(bacon, "Zach Galifianakis")).to eq zach
      expect(graph.find(bacon, "Ed Helms")).to eq ed
    end
  end

  describe "#find_kevin_bacon" do
    it "given a node, returns a string if Bacon number is greater than 6" do
      bacon.add_movie("X-Men: First Class", lawrence)
      lawrence.add_movie("X-Men: First Class", bacon)
      lawrence.add_movie("Hunger Games", woody)
      woody.add_movie("Hunger Games", lawrence)
      woody.add_movie("Zombieland", emma)
      emma.add_movie("Zombieland", woody)
      emma.add_movie("Amazing Spider-man", stan)
      stan.add_movie("Amazing Spider-man", emma)
      stan.add_movie("Iron Man 2", downey)
      downey.add_movie("Iron Man 2", stan)
      downey.add_movie("Due Date", zach)
      zach.add_movie("Due Date", downey)
      zach.add_movie("The Hangover", ed)
      ed.add_movie("The Hangover", zach)
      expect(graph.find_kevin_bacon(ed)).to eq "This actor has a Bacon number higher than 6!"
    end

    it "given a node, returns an array of movies connecting node to Kevin Bacon" do
      bacon.add_movie("X-Men: First Class", lawrence)
      lawrence.add_movie("X-Men: First Class", bacon)
      lawrence.add_movie("Hunger Games", woody)
      woody.add_movie("Hunger Games", lawrence)
      woody.add_movie("Zombieland", emma)
      emma.add_movie("Zombieland", woody)
      emma.add_movie("Amazing Spider-man", stan)
      stan.add_movie("Amazing Spider-man", emma)
      stan.add_movie("Iron Man 2", downey)
      downey.add_movie("Iron Man 2", stan)
      downey.add_movie("Due Date", zach)
      zach.add_movie("Due Date", downey)
      expect(graph.find_kevin_bacon(zach)).to eq ["Zach Galifianakis in Due Date with Robert Downey Jr.", "Robert Downey Jr. in Iron Man 2 with Stan Lee", "Stan Lee in Amazing Spider-man with Emma Stone", "Emma Stone in Zombieland with Woody Harrelson", "Woody Harrelson in Hunger Games with Jennifer Lawrence", "Jennifer Lawrence in X-Men: First Class with Kevin Bacon"]
    end
  end


end
