use DBI;
$data_source = 'dbi:Pg:dbname=test;host=127.0.0.1;port=5432';
$dbh = DBI->connect($data_source, 'j3nnn1', '123456') or die('No pudo conectar!');

if($dbh) {
	print 'Testing BD conection'."\n";
	print "It's connected and Exit"."\n";
}
