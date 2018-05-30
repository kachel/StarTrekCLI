require_relative "../lib/StarTrekCLI.rb"
require_relative "../lib/StarTrekCLI/series.rb"

Series = StarTrekCLI::Series

describe Series do
  let(:a_series) { Series.new("Foo") }

  # we do not care *what* the series name is!
  it "can initialize a series" do
    expect(a_series).to be_a(Series)
  end

  # we care about name
  it "initializes with a name" do
    voyager = Series.new("Voyager")
    expect(voyager.name).to eq("Voyager")
  end

  it "initializes seasons as empty" do
    expect(a_series.seasons).to be_empty
  end

  it "initializes with a seasons array" do
    expect(a_series.seasons).to be_a(Array)
  end

  # check attr_reader
  it "does not allow you to change its name" do
    expect { a_series.name = "Empire Strikes Back" }.to raise_error NoMethodError
  end

  it "does not allow you to change its season" do
    expect { a_series.seasons = "Empire Strikes Back" }.to raise_error NoMethodError
  end

  describe "#seasons" do

    # we do not care about what series it is
    it "can be called" do
      expect { a_series.seasons }.not_to raise_error NoMethodError
    end

  end # Series#seasons

end # Series
