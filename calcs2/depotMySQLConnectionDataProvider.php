<?php

/*
** Initiates DB connections for other files
*/

Class depotMySQLConnectionDataProvider {
	public $address;
	public $usr;
	public $pw;
	public $DB;

	public function __construct() {
		$this->address = "192.168.44.200";
		$this->usr     = "cFullUserPW";
		$this->pw      = "c5ul1Use1QP";
		$this->DB      = "Consulting";		
	}

}//class

?>