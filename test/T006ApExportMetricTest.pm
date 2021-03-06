package T006ApExportMetricTest;
use strict;
use warnings;

# Constructor.
# Arguments: $testSuite - the test suite this test belongs to
sub new {
	my $class = shift;
	my $self  = { 
		'testSuite'  => shift,
	};
	my $rc = bless $self, $class;
	return $rc;
}

# Execute the Test Case
# Arguments: (none)
# Returns: error message if test case failed, 0 otherwise
sub execute {
	my $self = shift;

	my $m = new ApExportMetrics('test_metric');
	$m->inc('{environment="test"}');
	$m->inc('{environment="dev"}');
	$m->inc('{hostname="localhost"}');
	my @L = $m->getLabels();
	if (!grep(/^\{hostname="localhost"\}$/, @L)) {
		return "#getLabels() failed (expected: '{hostname=\"locahost\"}, actual: NULL)";
	}
	return 0;
}

1;
