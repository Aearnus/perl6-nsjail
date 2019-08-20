#!perl6

use v6;
use lib 'lib';

use Test;
use Test::META;
use NSJail;

plan 1;

NSJail.new.run('/usr/bin/bash');

done-testing;