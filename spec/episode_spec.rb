#! /usr/bin/env ruby
require 'assonnato'

describe 'Assonnato' do
  before do
    @episode = Assonnato::Episode.new 'http://pigro.omnivium.it:4567'
  end

  it 'returns all the episodes of the given show' do
    res = @episode.all! 'Strike the Blood'
    res.should                be_kind_of(Array)
    res.should_not            be_empty
    res.first.should          be_kind_of(Struct)
    res.first.episode.should  eql(1)
  end

  it 'can\'t search episodes' do
    expect {
      @episode.search!('le_too_derp')
    }.to raise_error(NotImplementedError)
  end

  it 'returns a specific episode of the given show' do
    res = @episode.get! 'Strike the Blood', 1
    res.should                be_kind_of(Array)
    res.should_not            be_empty
    res.first.should          be_kind_of(Struct)
    res.first.episode.should  eql(1)
  end

  it 'returns the last episode of each show with the given status' do
    res = @episode.last! :ongoing
    res.should                be_kind_of(Array)
    res.should_not            be_empty
    res.first.should          be_kind_of(Struct)
  end
end