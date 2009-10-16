# rack-noslashdot

rack-noslashdot will redirect anyone who has been refered by slashdot (and doesn't mask their HTTP_REFERER header)

# usage

just 

    config.middleware.use "NoSlashdot", :redirect => 'http://slashdot.org'

or let the default kick in

    config.middleware.use "NoSlashdot"

# license

Copyright (c) 2009 Christopher Redinger. See LICENSE for details.

# thanks
This is just a play on Julio Cesar's NoIE middleware.
http://github.com/juliocesar/rack-noie

in response to Peter Cooper's tweet
http://twitter.com/peterc/status/4926493168
