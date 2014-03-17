#! /usr/bin/env ruby
require 'assonnato'

describe Assonnato::Episode do
  let(:client) { Assonnato::Episode.new Assonnato.new('pigro.omnivium.it') }

  it 'returns all the episodes of given show' do
    res = client.all          'Strike the Blood'
    res.should                be_kind_of(Array)
    res.should_not            be_empty
    res.first.should          be_kind_of(Struct)
    res.first.episode.should  eql(1)
  end

  it 'can\'t search episodes' do
    expect {
      client.search 'le_too_derp'
    }.to raise_error(NotImplementedError)
  end

  it 'returns a specific episode of given show' do
    res = client.get          'Strike the Blood', 1
    res.should                be_kind_of(Array)
    res.should_not            be_empty
    res.first.should          be_kind_of(Struct)
    res.first.episode.should  eql(1)
  end

  it 'returns the last episode of each show with given status' do
    res = client.last         :ongoing
    res.should                be_kind_of(Array)
    res.should_not            be_empty
    res.first.should          be_kind_of(Struct)
  end
end