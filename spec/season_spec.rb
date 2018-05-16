require_relative "../lib/StarTrekCLI/season.rb"

describe Season do
  let(:a_season) { Season.new("Foo") }

  it "can initialize a season" do
    expect(a_season).to be_a(Season)
  end

  it "initializes with a number" do
    one = Season.new(1)
    expect(one.number).to eq(1)
  end

  it "does not allow you to change its number" do
    expect { a_season.number = "Empire Strikes Back" }.to raise_error NoMethodError
  end

  it "does not allow you to change its season" do
    expect { a_season.episodes = "Empire Strikes Back" }.to raise_error NoMethodError
  end

  describe "#episodes" do

    it "initializes with an episodes array" do
      expect(a_season.episodes).to be_a(Array)
    end

    it "initializes episodes as empty" do
      expect(a_season.episodes).to be_empty
    end

    it "can be called" do
      expect { a_seasons.episodes }.not_to raise_error NoMethodError
    end

    it "does not allow you to change its episodes" do
      expect { a_season.episodes = "S01E02" }.to raise_error NoMethodError
    end

  end

end # Seasons
