#!/usr/bin/env perl
use strict;
use warnings;
use Crypt::Random::Seed;

my @methods = (qw/name is_blocking is_strong random_bytes random_values/);

use Test::More  tests => 1;

my $source = new Crypt::Random::Seed;

can_ok($source, @methods);
