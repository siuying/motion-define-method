# motion-define-method

RubyMotion static compilation do not allow define method in runtime. This 
gem is a hack to reimplement define_method in runtime using method_missing. 

## Setup

Install the gem:

```
gem install motion-define-method
```

Require the gem in Rakefile:

```ruby
require 'rubygems'
require 'motion-define-method'

Motion::Project::App.setup do |app|
  app.name = 'MyApp'
end
```

Now you can use define_method in your code! Just note that method_missing is
much slower than real method and this should really not be used in production
code. Good luck!

## License

```
Copyright (c) 2012, Francis Chong <francis@ignition.hk>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```