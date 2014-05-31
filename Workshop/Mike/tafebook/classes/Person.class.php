<?php

	class Person {
		// Properties

		private $personId;
		private $email;
		private $password;
		private $firstName;
		private $lastName;
		private $about;
		private $gender;

		// Getters and Setters


		/**
		 * [description here]
		 *
		 * @return [type] [description]
		 */
		public function getPeroonId() {
		    return $this->getPeroonId;
		}

		/**
		 * [Description]
		 *
		 * @param [type] $new[ Prop name ] [description]
		 */
		public function setPersonId($personId)) {
		    $this->personId = $personId;

		    return $this;
		}


		/**
		 * [description here]
		 *
		 * @return [type] [description]
		 */
		public function getEmail() {
		    return $this->email;
		}

		/**
		 * [Description]
		 *
		 * @param [type] $newEmail [description]
		 */
		public function setEmail($email) {
		    $this->$email = $email;
		    return $this;
		}

		public function getFirstname() { return $this->firstname;}
		public function setFirstname($value) { return $this->firstname = $value;}

	}

?>