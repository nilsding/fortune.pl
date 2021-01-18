#!/usr/bin/env perl
# fortune.pl -- a quick and dirty replacement for `fortune -s'
# Copyright (C) 2021 Georg Gadinger <nilsding@nilsding.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

use strict;
use warnings;

my $fortunes_file = shift(@ARGV) or die "usage: $0 FORTUNE_FILE";
my $max_length = 160;

my @fortunes = do {
  local $/ = "\n%\n";
  open my $file, "<", $fortunes_file or die "could not open ${fortunes_file}";
  <$file>;
};

@fortunes = grep(do { length($_) < $max_length }, @fortunes);

my $fortune = $fortunes[rand(@fortunes)];
$fortune =~ s/\n%\n//m;

print("${fortune}\n");
