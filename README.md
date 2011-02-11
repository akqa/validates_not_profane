# validates_not_profane

This is a fork of Michael Edgar's [validates\_not\_profane](https://github.com/michaeledgar/validates_not_profane)
plugin, updated to a Rails 3 style validator gem.

## Description

validates_not_profane provides a hook into the Profanalyzer gem as a validation
for your ActiveRecord models. It's use is simple:

    validates_not_profane :column_name, :column_2

Will cause the model to produce errors if that column contains profanity
in its value. Of course, since the Profanalyzer gem is customizable, so is
the validation:

    validates_not_profane :post_title, :racist => true, :sexual => false

will block racial slurs, but nothing else.

    validates_not_profane :post_title, :tolerance => 5

will block only the most vile of profanity. The scale for tolerance is
from 0-5, which is mostly subjective, in all honesty.

## Features/Problems

* Tolerance-based profanity checking
* Switch between checking all words, racist terms, sexual words, or some mixture
* Custom substitutions
* Boolean-based profanity checking

## Install (with bundler)

In your Gemfile:

    gem 'validates_not_profane', :git => "git@github.com:akqa/validates_not_profane.git"

Then run `bundle install`

## License

    (The MIT License)

    Copyright (c) 2009 Michael J. Edgar

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    'Software'), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
