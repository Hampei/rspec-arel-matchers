# RSpec Arel Matchers

An experiment to test the scope of complex queries in bitesize pieces without creating a hundred objects.

Or just to test something when controllers are too simple to really have to test, so your coverage doesn't suffer :-P

You can only test where clauses for now, but will add things like order and joins at some point. Probably.


## Examples

```
# @post = Post.joins(:comments).merge(Comment.public).distinct
it 'should only select posts with public comments' do
  expect(assigns[:posts]).to have_where_clause(Comment, :ctype, :eq, 'public')
end
```

## Usage

In spec_helper add

```
require 'rspec/arel_matchers'
RSpec.configure do |config|
  config.include RSpec::ArelMatchers::Matchers
end
```

## Authors

Authored by Henk van der Veen.

Maintained by [Henk van der Veen](http://hampei.github.io/).

## License

Copyright (c) 2014 [Henk van der Veen IT.](http://hampei.github.io/).
All rights reserved. Released under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
