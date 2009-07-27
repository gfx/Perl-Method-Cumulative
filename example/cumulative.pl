#!perl -w
use strict;

{
	package A;
	use Mouse;

	sub foo{
		print "A";
	}
	sub bar{
		print "A";
	}

	package B;
	use Mouse;
	use Method::Cumulative;

	extends qw(A);
	sub foo :CUMULATIVE{
		print "B";
	}
	sub bar :CUMULATIVE(BASE FIRST){
		print "B";
	}

	package C;
	use Mouse;
	use Method::Cumulative;

	extends qw(A);

	sub foo :CUMULATIVE{
		print "C";
	}
	sub bar :CUMULATIVE(BASE FIRST){
		print "C";
	}

	package D;
	use Mouse;
	use Method::Cumulative;
	use mro 'c3';

	extends qw(C B);

	sub foo :CUMULATIVE{
		print "D";
	}
	sub bar :CUMULATIVE(BASE FIRST){
		print "D";
	}
}
D->foo(); # => DCBA
print "\n";
D->bar(); # => ABCD
print "\n";
