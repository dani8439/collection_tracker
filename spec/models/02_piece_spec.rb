require 'spec_helper'

describe "Piece" do
  before do
    @piece = Piece.create(:name => "Jug", :size => "1.5 Pint", :quantity => "1")

    @pattern = Pattern.create(:name => "Love & Kisses", :theme => "Pinks")
  end

  it "can initialize a piece" do
    expect(Piece.new).to be_an_instance_of(Piece)
  end

  it "can have a name" do
    expect(@piece.name).to eq("Jug")
  end

  it "can have a size" do
    expect(@piece.size).to eq("1.5 Pint")
  end

  it "can have a quantity" do
    expect(@piece.quantity).to eq("1")
  end

  it "can have many patterns" do
    expect(@piece.patterns.count).to eq(1)
  end

  it "has a pattern" do
    expect(@piece.pattern).to eq(@pattern)
  end
end
