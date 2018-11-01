use DBI;


#
# my $dbh = dbconnect();
#	Quick and simple: connect to CSG db-admin database.
#
sub dbconnect
{
	my $dsn = 'dbi:Pg:dbname=admin;host=db-admin.doc.ic.ac.uk.;port=5432';
	my $dbuser = 'syshostmaint';
	my $dbpass = 'G1veM3TheData';

	$ENV{PGPASSWORD} = $dbpass;	# avoids the password being slapped 
                                	# all over the screen and syslog

	my $dbh = DBI->connect_cached($dsn, $dbuser, undef, {
                PrintError => 0,
                RaiseError => 1,
                AutoCommit => 0,
            }
        );
    die "Cannot get DB handle - " . $DBI::errstr unless defined $dbh;
    return $dbh;
}


1;
