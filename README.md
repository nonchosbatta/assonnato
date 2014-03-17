Assonnato
=========
RESTful gem for wrapping [Pigro](https://github.com/nonchosbatta/pigro)'s APIs.

Install
=======
`$ gem install assonnato`

Usage
=====
You can use *Assonnato* in two ways.

The first is creating a new instance of *Assonnato*...
```ruby
require 'assonnato'

assonnato = Assonnato.new       HOST, PORT, SSL
user      = Assonnato::User.new assonnato
user.login 'Username', 'Password'
```

... while the second is performing direct calls to *Assonnato*.
```ruby
require 'assonnato'

assonnato = Assonnato.new HOST, PORT, SSL
assonnato.user.login      'Username', 'Password'
```

Examples
========

*Get shows*
```ruby
assonnato.show.all :ongoing
assonnato.show.all :ongoing, :fansub => 'Omnivium'
assonnato.show.all :ongoing, :user   => 'Roxas Shadow'
assonnato.show.all :ongoing, { user: 'Roxas Shadow', role: :translator }
assonnato.show.get 'Strike the Blood'
```

*Get episodes*
```ruby
assonnato.episode.all  'Strike the Blood'
assonnato.episode.get  'Strike the Blood', 1
assonnato.episode.last :ongoing
```

*Edit an episode*
```ruby
login = assonnato.user.login 'Username', 'Password'
puts "#{login['status']}: #{login['message']}"

episode = assonnato.episode.edit 'Nisekoi', 8, { qchecking: :done }
puts "#{episode['status']}: #{episode['message']}"

logout = assonnato.user.logout
puts "#{logout['status']}: #{logout['message']}"
```

A working example is also available [here](https://github.com/RoxasShadow/Descartes/blob/master/lib/descartes/modules/pigro.rb).
