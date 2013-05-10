LedScreen
=========

Perl Module to control the Led Screen (model unknown)

Usage:

```perl

#!/usr/bin/perl

use utf8;

use lib '/home/ledscreen/ledscreen';
use LedScreen;

my $ledscreen = LedScreen->new(ledscreen_ip => '127.0.0.1');

$ledscreen->send_ledscreen_message({message => $ARGV[0] . $ledscreen->standard_message});

print "sent ".$ARGV[0]."\n";
```
