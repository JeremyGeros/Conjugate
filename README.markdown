Conjugate
=========
[![Build Status](https://travis-ci.org/JeremyGeros/Conjugate.png?branch=master)](https://travis-ci.org/JeremyGeros/Conjugate)

Conjugates verbs into their proper form given a pronoun. Can conjugate irregular verbs that are in this list https://gist.github.com/1841995
Currently only has support for Spanish.

```
Conjugate::Spanish.conjugate(:pronoun => :yo, :verb => 'tener')
=> tengo
```
Can also pass tenses

```
Conjugate::Spanish.conjugate(:pronoun => :yo, :verb => 'tener', :tense => :past)
=> tuve
```

Also now works for French 

```
Conjugate::French.conjugate(:pronoun => :je, :verb => 'acheter', :tense => :present)
=> achète
```

There is also a helper method to pass a language option, either the name or language code
```
Conjugate.conjugate({language: 'french', verb: 'jouer', tense: :present, pronoun: :je})
=> joue

Conjugate.conjugate({language: 'fr', verb: 'jouer', tense: :present, pronoun: :je})
=> joue

Conjugate.conjugate({language: 'spanish', verb: 'comprar', tense: :present, pronoun: :yo})
=> compro

Conjugate.conjugate({language: 'es', verb: 'comprar', tense: :present, pronoun: :yo})
=> compro
```

License
=======

The MIT License (MIT)

Copyright (c) 2013 Jeremy Geros

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

        
          
