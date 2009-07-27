use strict;
use warnings;
use inc::Module::Install;

name 'Method-Cumulative';
all_from 'lib/Method/Cumulative.pm';

requires 'Sub::Attribute';

requires_xs 'XS::MRO::Compat';

test_requires 'Test::More'      => 0.62;
test_requires 'Test::LeakTrace' => 0.08;
test_requires 'parent';

tests 't/*.t';
author_tests 'xt';

clean_files qw(
	Method-Cumulative-* *.stackdump
	*.gcda *.gcno *.gcov
	nytprof *.out
	cover_db
);

WriteAll;
