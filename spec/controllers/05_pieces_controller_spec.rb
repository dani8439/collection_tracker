require 'spec_helper'

describe PiecesController do
  before do
    @piece = Piece.create(:name => "Jug", :size => "1.5 Pint", :quantity => "4")
    @pattern = Pattern.create(:name => "Utility", :theme => "Blues")
    @piece.patterns << @pattern
    @piece.save
  end

  after do
    Piece.destroy_all
    Pattern.destroy_all
  end

  it "allows you to view form to create a new piece" do
    visit '/pieces/new'
    expect(page.body).to include('<form')
    expect(page.body).to include('piece[name]')
    expect(page.body).to include('piece[size]')
    expect(page.body).to include('piece[quantity]')
    expect(page.body).to include('piece[pattern_ids][]')
    expect(page.body).to include('pattern[name]')
    expect(page.body).to include('pattern[theme]')
  end
end
