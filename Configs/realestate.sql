-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2021 at 09:41 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realestate`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `profile_pic` varchar(500) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `username` varchar(500) DEFAULT NULL,
  `passcode` varchar(1500) DEFAULT NULL,
  `email_confirmed` int(11) DEFAULT NULL,
  `phone_confirmed` int(11) DEFAULT NULL,
  `last_log` datetime DEFAULT NULL,
  `last_ip_address` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `blocked` int(11) DEFAULT 0,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `fullname`, `firstname`, `lastname`, `email`, `phone`, `age`, `gender`, `birthdate`, `profile_pic`, `role_id`, `country_id`, `city_id`, `zip_code`, `username`, `passcode`, `email_confirmed`, `phone_confirmed`, `last_log`, `last_ip_address`, `status_id`, `created`, `updated`, `blocked`, `actived`) VALUES
(1, 'Administrator', 'admin', 'admin', 'ucha1bokeria@gmail.com', '+995571197490', 20, 1, '2001-03-31 18:13:57', 'https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg', 1, NULL, NULL, '0190', 'admin', '', 1, 1, NULL, NULL, 0, '2021-09-24 18:15:15', NULL, 0, 1);

--
-- Triggers `accounts`
--
DELIMITER $$
CREATE TRIGGER `send_count_in_role_del` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN
		UPDATE roles SET
					 roles.members = roles.members - 1
		 WHERE roles.id  = OLD.role_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `send_count_in_role_upd` AFTER UPDATE ON `accounts` FOR EACH ROW BEGIN	IF(NEW.status_id != OLD.status_id) THEN
		UPDATE roles SET
					 roles.members = roles.members + 1
		 WHERE roles.id  = NEW.role_id;
	END IF;
	
	IF(NEW.actived = 1) THEN
		UPDATE roles SET
					 roles.members = roles.members + 1
		 WHERE roles.id  = NEW.role_id;
	END IF;
	
	IF(NEW.actived = 0) THEN
		UPDATE roles SET
					 roles.members = roles.members - 1
		 WHERE roles.id  = NEW.role_id;
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `send_count_in_roles` AFTER INSERT ON `accounts` FOR EACH ROW BEGIN 
	UPDATE roles SET
				 roles.members = roles.members + 1
	 WHERE roles.id  = NEW.role_id;
	
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `declarations`
--

CREATE TABLE `declarations` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `controller_user_id` int(11) DEFAULT NULL,
  `seen` int(11) DEFAULT NULL,
  `dir` varchar(1500) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `declarations`
--
DELIMITER $$
CREATE TRIGGER `send_post_status` AFTER UPDATE ON `declarations` FOR EACH ROW BEGIN
	UPDATE posts SET
				 posts.status_id = NEW.status_id 
	 WHERE posts.id = NEW.post_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `estate_types`
--

CREATE TABLE `estate_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `posts` int(11) DEFAULT 0,
  `icon_dir` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `id` int(11) NOT NULL,
  `question` varchar(1000) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `help`
--

INSERT INTO `help` (`id`, `question`, `answer`, `user_id`, `created`, `updated`, `actived`) VALUES
(1, 'How to upload a post', 'just do it', NULL, '2021-09-24 18:28:52', NULL, 1),
(2, 'How to draw?', 'idk', NULL, '2021-09-25 02:45:31', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `title`, `created`, `updated`, `actived`) VALUES
(1, 'Geo', '2021-09-24 18:32:41', NULL, 1),
(2, 'Eng', '2021-09-24 18:32:41', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `media_extensions`
--

CREATE TABLE `media_extensions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `permissionLVL` int(11) DEFAULT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `file_name` varchar(500) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `vip_status_id` int(11) DEFAULT NULL,
  `location` varchar(1500) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `declaration_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_details`
--

CREATE TABLE `post_details` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `icon_dir` varchar(1500) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `default` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_media`
--

CREATE TABLE `post_media` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dir` varchar(1500) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `extension_id` int(11) DEFAULT NULL,
  `compressed` int(11) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_media_types`
--

CREATE TABLE `post_media_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_status`
--

CREATE TABLE `post_status` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permissionLVL` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `permissionLVL` int(11) DEFAULT NULL,
  `members` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `permissionLVL`, `members`, `user_id`, `created`, `updated`, `actived`) VALUES
(1, 'admin', 999, 1, 1, '2021-09-24 18:17:43', '2021-09-25 01:48:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `translate`
--

CREATE TABLE `translate` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT 0,
  `lang_key` varchar(255) DEFAULT NULL,
  `lang_value` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `translate`
--

INSERT INTO `translate` (`id`, `lang_id`, `page_id`, `lang_key`, `lang_value`, `user_id`, `created`, `updated`, `actived`) VALUES
(2, 1, 0, 'HOME', 'მთავარი', 1, '2021-09-24 18:37:38', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vips`
--

CREATE TABLE `vips` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `posts` int(11) DEFAULT 0,
  `price` decimal(10,2) DEFAULT 0.00,
  `icon` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vips`
--

INSERT INTO `vips` (`id`, `title`, `posts`, `price`, `icon`, `user_id`, `period`, `created`, `updated`, `actived`) VALUES
(0, 'S-vip', 0, '0.00', NULL, NULL, NULL, '2021-09-24 18:30:49', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `declarations`
--
ALTER TABLE `declarations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estate_types`
--
ALTER TABLE `estate_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_extensions`
--
ALTER TABLE `media_extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_details`
--
ALTER TABLE `post_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_media`
--
ALTER TABLE `post_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_media_types`
--
ALTER TABLE `post_media_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_status`
--
ALTER TABLE `post_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `declarations`
--
ALTER TABLE `declarations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estate_types`
--
ALTER TABLE `estate_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help`
--
ALTER TABLE `help`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media_extensions`
--
ALTER TABLE `media_extensions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_details`
--
ALTER TABLE `post_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_media`
--
ALTER TABLE `post_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_media_types`
--
ALTER TABLE `post_media_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_status`
--
ALTER TABLE `post_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
