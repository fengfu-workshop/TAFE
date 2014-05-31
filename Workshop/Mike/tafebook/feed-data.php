<?php

require_once('classes/tools.class.php');
require_once('classes/DAL.class.php');
$dal = new DAL();
$password = cryptPassword('123');

function runSQL($sql) {
	Global $dal;
	out($sql);
	if ($dal->ExecuteNonQuery($sql)) out("Done.");
}

// runSQL("INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('dixon.lawson@gmail.com', '$password', 'Dixon', 'Lawson', 'I am Dixon Lawson', 'M')");
// runSQL("INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('Michael.Jordan@gmail.com', '$password', 'Michael', 'Jordan', 'I am Michael Jordan', 'M')");
// runSQL("INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('Adam.Scott@gmail.com', '$password', 'Adam', 'Lawson', 'I am Adam Lawson', 'M')");
// runSQL("INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('Tiger.Woods@gmail.com', '$password', 'Tiger', 'Woords', 'I am Tiger Woords', 'M')");
// runSQL("INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('Tommy.Jones@gmail.com', '$password', 'Tommy', 'Jones', 'I am Tommy Jones', 'M')");
// runSQL("INSERT INTO person (email, password, firstName, lastName, about, gender) VALUES ('Marcus.Hams@gmail.com', '$password', 'Marcus', 'Hams', 'I am Marcus Hams', 'M')");

// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (1, 2)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (2, 1)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (1, 3)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (3, 1)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (1, 4)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (4, 1)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (1, 5)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (5, 1)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (1, 6)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (6, 1)");

// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (2, 3)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (3, 2)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (2, 4)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (4, 2)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (2, 5)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (5, 2)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (2, 6)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (6, 2)");

// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (3, 4)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (4, 3)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (3, 5)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (5, 3)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (3, 6)");
// runSQL("INSERT INTO friendship (personId1, personId2) VALUES (6, 3)");

// runSQL("INSERT INTO post (personId, postDateTime, post) VALUES (1, '2014-5-31', 'How can I see the specific value of the sql_mode?')");
// runSQL("INSERT INTO post (personId, postDateTime, post) VALUES (2, '2014-6-1', 'Building Dynamic Websites with PHP and MySQL')");
// runSQL("INSERT INTO post (personId, postDateTime, post) VALUES (3, '2014-6-2', 'Froala Editor is an easy to include and easy to use plugin')");

?>