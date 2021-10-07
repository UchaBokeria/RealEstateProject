<?php
	
	class Header extends Database
	{
		
		
		public function read()
		{
			return parent::get("SELECT 1 AS id , 'dd' AS name 
								UNION ALL 
								SELECT 2 AS id , 'aa' AS name");
		}
	}