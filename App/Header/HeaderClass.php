<?php
	
	class Header extends Database
	{

		public function readCategories() 
		{
			return parent::get("SELECT * FROM estate_types WHERE parent = 0 AND actived = 1");

		}

		public function readLanguages() 
		{
			return parent::get("SELECT id, title FROM languages WHERE actived = 1");
		}
	}