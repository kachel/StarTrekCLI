require_relative "../lib/StarTrekCLI/episodes.rb"

describe Episodes do
  let(:an_episode) { Episodes.new("Foo") }

  it "can initialize an episode" do
    expect(an_episode).to be_a(Episodes)
  end

  it "initializes with a name" do
    darmok = Episodes.new("Darmok")
    expect(darmok.name).to eq("Darmok")
  end

  it "does *not* allow you to change its name" do
    expect { an_episode.name = "Hera's Heroes" }.to raise_error NoMethodError
  end

  describe "#air_date" do

    it "can be called" do
      expect { an_episode.air_date }.not_to raise_error NoMethodError
    end

    it "does *not* allow you to change its air date" do
      expect { an_episode.air_date = "17 July 2001" }.to raise_error NoMethodError
    end
  end

  describe "#star_date" do

    it "can be called" do
      expect { an_episode.star_date }.not_to raise_error NoMethodError
    end

    it "does *not* allow you to change its star date" do
      expect { an_episode.star_date = "31 March 2450" }.to raise_error NoMethodError
    end
  end

end # Episodes
