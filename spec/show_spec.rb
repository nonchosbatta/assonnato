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

  it 'search all the shows which name is similar to the given keyword' do
    res = @show.search! 'strike'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.name.should        eql('Strike the Blood')
  end

  it 'returns all the ongoing shows of the given fansub' do
    res = @show.all! :ongoing, fansub: 'Omnivium'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.fansub.should      eql('Omnivium')
  end

  it 'returns all the ongoing shows in wich the given user has worked' do
    res = @show.all! :ongoing, user: 'Roxas Shadow'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
  end

  it 'returns all the ongoing shows in wich the given user has worked in the given role' do
    res = @show.all! :ongoing, { user: 'Roxas Shadow', role: :translator }
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.translator.should  eql('Roxas Shadow')
  end

  it 'returns all the informations of the given show' do
    res = @show.get! 'Strike the Blood'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.id.should          eql(1)
  end
end