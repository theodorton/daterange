# DateRange

[![Build Status](https://img.shields.io/codeship/2b277380-6d90-0132-7e93-261dee642691/master.svg?style=flat-square)](https://codeship.com/projects/54247)
[![Version](http://img.shields.io/gem/v/daterange.svg?style=flat-square)](https://rubygems.org/gems/daterange)
[![Downloads](http://img.shields.io/gem/dt/daterange.svg?style=flat-square)](https://rubygems.org/gems/daterange)
[![Open Github issues](http://img.shields.io/github/issues/theodorton/daterange.svg?style=flat-square)](https://github.com/theodorton/daterange/issues)

Parse strings like `yesterday`, `previous_5_months`, `this_hour` to date/time ranges.

```shell
$ gem install daterange
```

```ruby
require 'daterange'

range = DateRange.parse('today')
range.min
# => Wed, 24 Dec 2014 00:00:00 +0000
range.max
# => Wed, 24 Dec 2014 23:59:59 +0000
```

Based on [Keen.io Timeframes](https://keen.io/docs/data-analysis/timeframe/).

# Contributing to daterange

1. Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
2. Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
3. Fork the project.
4. Start a feature/bugfix branch.
5. Commit and push until you are happy with your contribution.
6. Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
7. Open a Pull request for your branch
8. Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2014 Theodor Tonum. See LICENSE for
further details.
