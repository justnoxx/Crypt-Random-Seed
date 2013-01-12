#!/usr/bin/env perl
use strict;
use warnings;
use Crypt::Random::Seed;

# NOTE: We need to read as few bytes as possible -- just as many as we really
# need to test the functionality.  Every byte we read may steal O/S entropy,
# and may mean we block testing for a long time.
# We could check is_blocking if we thought we needed more tests.

use Test::More  tests => 2;

my $source = new Crypt::Random::Seed;

my $byte = $source->get_random_bytes(1);
is( length($byte), 1, "get_random_bytes(1) returned 1 byte" );

# All in one.
my $seed = Crypt::Random::Seed->new->get_random_bytes(4);
is( length($seed), 4, "CRS->new->get_random_bytes(4) returned 4 bytes" );