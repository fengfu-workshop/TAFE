<?php

	class DAL
	{

		//Properties

		private $server;
		private $database;
		private $username;
		private $password;
		private $PDO;


		//Methods

		public function __construct()
		{

			//Set up database connection info
			$this->server = 'localhost';
			$this->database = 'tafebook';
			$this->username = 'tafebook';
			$this->password = 'tafebook';

			//Try to connect
			try
			{
				$this->PDO = new PDO("mysql:host={$this->server};dbname={$this->database}", $this->username, $this->password);
				$this->PDO->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			}
			catch (PDOException $e)
			{
				//Log error
				$this->LogException($e, 'Problem connecting to the database server', 'error');
			}

		}

		public function ExecuteQuery($sql, $parameters = array())
		{

			$return = false;

			//Try to execute query
			try
			{
				//Create a statement object using the supplied query
				$statement = $this->PDO->prepare($sql);

				//Assign the parameters to the statement
				$this->AssignParameters($statement, $parameters);

				//Execute query and get result
				$statement->execute();
				$return = $statement->fetchAll();
			}
			catch (PDOException $e)
			{
				//Log error
				$this->LogException($e, 'Problem executing the query', 'error', $sql);
			}

			return $return;

		}

		public function ExecuteScalar($sql, $parameters = array())
		{

			$return = false;

			//Try to execute query
			try
			{
				//Create a statement object using the supplied query
				$statement = $this->PDO->prepare($sql);

				//Assign the parameters to the statement
				$this->AssignParameters($statement, $parameters);

				//Execute query and get result
				$statement->execute();
				$return = $statement->fetchColumn();
			}
			catch (PDOException $e)
			{
				//Log error
				$this->LogException($e, 'Problem executing the scalar query', 'error', $sql);
			}

			return $return;

		}

		public function ExecuteNonQuery($sql, $parameters = array())
		{

			$return = false;

			//Try to execute query
			try
			{
				//Create a statement object using the supplied query
				$statement = $this->PDO->prepare($sql);

				//Assign the parameters to the statement
				$this->AssignParameters($statement, $parameters);

				//Execute query and get result
				$return = $statement->execute();
			}
			catch (PDOException $e)
			{
				//Log error
				$this->LogException($e, 'Problem executing the non-query', 'error', $sql);
			}

			return $return;

		}

		private function AssignParameters($statement, $parameters)
		{

			/*
			 * Structure of parameters array:

			 	$parameters = array(
			 		array('name'=>':parameter1', 'value'=>'some value', 'type'=>PDO::PARAM_STR),
			 		array('name'=>':parameter2', 'value'=>123, 'type'=>PDO::PARAM_INT)
			 	)

			 */

			//Loop through each item in the parameters array
			foreach ($parameters as $parameter)
			{

				//Get information for current parameter and bind it to the statement
				$statement->bindValue(
					$parameter['name'],
					$parameter['value'],
					$parameter['type']
				);

			}

		}

		public function LogException(
			$pException,
			$pUserMsg = '<no error message>',
			$pErrorLevel = 'error',
			$sql = ""
		)
		{

			$this->LogError(
				$pUserMsg,
				$pException->getFile() . ' on line ' . $pException->getLine(),
				$pException->getCode(),
				$pException->getMessage(),
				$pErrorLevel,
				$sql
			);

		}

		public function LogError(
			$pUserMsg = '<no error message>',
			$pFile = '<no file>',
			$pErrorNo = '<xx>',
			$pErrorMsg = '<no error message>',
			$pErrorLevel = 'error',
			$sql
		)
		{

			//Write error to the error log

			//Get current time
			date_default_timezone_set('Australia/Sydney');
			$errorTime = date('Y-m-d H:i:s');

			//Assemble log entry
			$logEntry = "$errorTime :: ($pErrorNo) $pErrorMsg :: $pUserMsg :: $pFile => $sql\r\n";

			//Add the log entry to the log file
			file_put_contents(
				dirname(__FILE__) . '/../log/error.log',
				$logEntry,
				FILE_APPEND
			);


			//Display the user-friendly error message
			echo <<<ERROR

<div class='$pErrorLevel'>
	<h3>We have a problem...</h3>
	<p>$pUserMsg</p>
	<p>Our tech guys will already be working on the issue!</p>
</div>

ERROR;

		}

	}

?>