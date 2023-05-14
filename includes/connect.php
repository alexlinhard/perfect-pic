<?php
	$dest = "local";	// "www"  "local"  "sqlite"

	if	($dest == "www") {
	 //$dbPass = "MGwwdfeHiH19";  	// Server Wien
	 $dbPass = ".t9l7w7z2ozh";  	    // Home	
	 $host = "185.51.8.58";
     $dbName = "u191456db1";
     $dbUser = "u191456db1"; 
	 $con = mysqli_connect($host, $dbUser, $dbPass, $dbName); 
	 mysqli_set_charset( $con , "utf8" );

	} else if ($dest == "local"){
	 $dbPass = "rooti";  	    // Home	 	// Server Local
	 $host = "localhost";
     $dbName = "db_bikeshop_al";
     $dbUser = "root"; 
     $con = mysqli_connect($host, $dbUser, $dbPass, $dbName); 
	mysqli_set_charset( $con , "utf8" );

	} else if ($dest == "sqlite"){
      $con = new SQLite3('db_perfectpic_al.db');
	}
?>