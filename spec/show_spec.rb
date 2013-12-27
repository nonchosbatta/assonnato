#! /usr/bin/env ruby
require 'assonnato'

describe 'Assonnato' do
  before do
    @show = Assonnato::Show.new 'http://localhost:4567', :json
  end

  it 'returns all the shows' do
    res = @show.all!
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.name.length.should > 5
  end

  it 'search all the shows which name is similar to the given keyword' do
    res = @show.search! 'monogatari'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.name.should        eql('Monogatari Second Series')
  end

  it 'doesn\'t get an unknown show' do
    res = @show.search! 'monogatarif'
    res.should                   be_kind_of(Array)
    res.should                   be_empty
  end

  it 'returns all the informations of the given show' do
    res = @show.get! 'Monogatari Second Series'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.id.should          eql(1)
  end
end