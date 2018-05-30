require_relative "../lib/StarTrekCLI.rb"
require_relative "../lib/StarTrekCLI/series.rb"
require_relative "../lib/StarTrekCLI/season.rb"

Season = StarTrekCLI::Season
Series = StarTrekCLI::Series

describe Season do
  let(:a_series) { Series.new("Foo") }
  let(:a_season) { Season.new(a_series, 1) }

  it "can initialize a season" do
    expect(a_season).to be_a(Season)
  end

  it "initializes with a number" do
    four = Season.new(a_series, 4)
    expect(four.number).to eq(4)
  end

  it "initializes with a series" do
    voyager = Series.new("Voyager")
    one = Season.new(voyager, 1)
    expect(one.series).to eq(voyager)
  end

    it "adds itself to its parent series" do
      voyager = Series.new("Voyager")
      one = Season.new(voyager, 1)
      expect(voyager.seasons).to include(one)
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
