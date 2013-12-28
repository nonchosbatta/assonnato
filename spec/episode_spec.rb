#! /usr/bin/env ruby
require 'assonnato'

describe 'Assonnato' do
  before do
    @episode = Assonnato::Episode.new 'http://localhost:4567'
  end

  it 'returns all the episodes of the given show' do
    res = @episode.all! 'Monogatari Second Series'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.episode.should     eql(1)
  end

  it 'can\'t search episodes' do
    expect {
      @episode.search!('monogatari')
    }.to raise_error(NotImplementedError)
  end

  it 'returns a specific episode of the given show' do
    res = @episode.get! 'Monogatari Second Series', 1
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.episode.should     eql(1)
  end
end