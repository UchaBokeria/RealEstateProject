<?php
	
	class Estate extends Database
	{
		
		public function read()
		{

			return parent::get("SELECT	posts.id,
										posts.title,
										posts.description,
										post_media.dir,
										GROUP_CONCAT(CONCAT(post_settings.title,'=',post_details.`value`)) AS details
								FROM 	posts  
								LEFT JOIN post_media ON posts.thumbnail_id = post_media.id
								LEFT JOIN post_details ON posts.id = post_details.post_id AND post_details.post_setting_id IN(SELECT id FROM post_settings WHERE actived = 1) 
								JOIN  post_settings ON post_settings.id = post_details.post_setting_id 
								WHERE posts.status_id = 1 AND posts.actived = 1
								GROUP BY  posts.id
								ORDER BY  posts.created DESC
								LIMIT 0, 10; ");
		}
	}