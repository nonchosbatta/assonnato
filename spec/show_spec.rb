#! /usr/bin/env ruby
require 'assonnato'

describe 'Assonnato' do
  before do
    @show = Assonnato::Show.new 'http://pigro.omnivium.it:4567'
  end

  it 'returns all the ongoing shows' do
    res = @show.all! :ongoing
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.status.should      eql('ongoing')
  end

  it 'returns all the ongoing shows of the given fansub' do
    res = @show.all! :ongoing, 'Omnivium'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.fansub.sould       eql('Omnivium')
  end

  it 'search all the shows which name is similar to the given keyword' do
    res = @show.search! 'Strike'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.name.should        eql('Strike the Blood')
  end

  it 'doesn\'t get an unknown show' do
    res = @show.search! 'le_too_derp'
    res.should                   be_kind_of(Array)
    res.should                   be_empty
  end

  it 'returns all the informations of the given show' do
    res = @show.get! 'Strike the Blood'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.id.should          eql(1)
  end
end