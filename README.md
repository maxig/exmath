ExMath
======

A collection of useful functions related to mathematics.


##Float Equality

The `ExMath.close_enough?/4` function implements equality comparison for
floating point numbers. An absolute epsilon is used for values close to zero,
for all other values ULP based comparison is used. The algorithm is based on
[this blog post](https://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/)
by Bruce Dawson.


##License

Copyright © 2015 Ookami Kenrou <ookamikenrou@gmail.com>
This work is free. You can redistribute it and/or modify it under the terms of
the Do What The Fuck You Want To Public License, Version 2, as published by
Sam Hocevar. See the LICENSE file or the [WTFPL homepage](http://www.wtfpl.net)
for more details.

