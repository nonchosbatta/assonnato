#! /usr/bin/env ruby
require 'assonnato'

describe Assonnato::Show do
  let(:client) { Assonnato::Show.new Assonnato.new('pigro.omnivium.it') }

  it 'returns all the on-going shows' do
    res = client.all             :ongoing
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.status.should      eql('ongoing')
  end

  it 'search all the shows which name is similar to given keyword' do
    res = client.search         'strike'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.name.should        eql('Strike the Blood')
  end

  it 'returns all the on-going shows of given fansub' do
    res = client.all             :ongoing, fansub: 'Omnivium'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.fansub.should      eql('Omnivium')
  end

  it 'returns all the on-going shows in wich given user has worked' do
    res = client.all             :ongoing, user: 'Roxas Shadow'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
  end

  it 'returns all the on-going shows in wich given user has worked in given role' do
    res = client.all             :ongoing, { user: 'Roxas Shadow', role: :translator }
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.translator.should  eql('Roxas Shadow')
  end

  it 'returns all the informations of given show' do
    res = client.get            'Strike the Blood'
    res.should                   be_kind_of(Array)
    res.should_not               be_empty
    res.first.should             be_kind_of(Struct)
    res.first.id.should          eql(1)
  end
end