-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2021 at 06:09 PM
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
  `token` varchar(700) DEFAULT NULL,
  `email_confirmed` int(11) DEFAULT 0,
  `phone_confirmed` int(11) DEFAULT 0,
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

INSERT INTO `accounts` (`id`, `fullname`, `firstname`, `lastname`, `email`, `phone`, `age`, `gender`, `birthdate`, `profile_pic`, `role_id`, `country_id`, `city_id`, `zip_code`, `username`, `passcode`, `token`, `email_confirmed`, `phone_confirmed`, `last_log`, `last_ip_address`, `status_id`, `created`, `updated`, `blocked`, `actived`) VALUES
(1, 'Administrator', 'admin', 'admin', 'ucha1bokeria@gmail.com', '+995571197490', 20, 1, '2001-03-31 18:13:57', 'https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg', 1, NULL, NULL, '0190', 'admin', '', '123', 1, 1, NULL, NULL, 0, '2021-09-24 18:15:15', NULL, 0, 1);

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

--
-- Dumping data for table `estate_types`
--

INSERT INTO `estate_types` (`id`, `title`, `parent`, `posts`, `icon_dir`, `created`, `updated`, `actived`) VALUES
(1, 'category 1', 0, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(2, ' category  2', 0, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(3, ' category  3', 0, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(4, ' category  4', 0, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(5, 'sub-cat 1', 1, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(6, 'sub-cat 2', 1, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(7, 'sub-cat 3', 1, 0, NULL, '2021-10-10 15:30:35', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
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

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `thumbnail_id`, `user_id`, `status_id`, `price`, `type_id`, `vip_status_id`, `location`, `country_id`, `city_id`, `declaration_id`, `created`, `updated`, `actived`) VALUES
(1, 'Apartment in wkneti', 'Lorem ipsum dolor sit amet,', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(2, 'Apartment In isani', 'consectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, '', NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(3, 'Apartment in varketili', 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(4, 'apartment in gori', 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(5, 'Apartment in vake', 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(6, 'apartment in saburtalo', 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_details`
--

CREATE TABLE `post_details` (
  `id` int(11) NOT NULL,
  `value` varchar(1000) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_setting_id` int(11) DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_details`
--

INSERT INTO `post_details` (`id`, `value`, `post_id`, `post_setting_id`, `actived`) VALUES
(1, '121', 1, 1, 1),
(2, '13', 1, 2, 1),
(3, '141', 1, 3, 1),
(4, '123', 1, 4, 1),
(5, '156', 1, 12, 1),
(6, '513', 2, 1, 1),
(7, '514', 2, 2, 1),
(8, '515', 2, 3123, 1),
(9, '516', 2, 4, 1),
(10, '517', 2, 5, 1),
(11, NULL, NULL, 0, 1),
(12, '6.394365133153615', 3, 1, 1),
(13, '8.347665921177404', 3, 2, 1),
(14, '3.5552344830289804', 3, 3, 1),
(15, '9.733174928215496', 3, 4, 1),
(16, '1.0001714685933398', 3, 5, 1),
(17, '1.8013328349230187', 4, 1, 1),
(18, '5.006150045437878', 4, 2, 1),
(19, '9.62675199902314', 4, 3, 1),
(20, '5.115310135404868', 4, 4, 1),
(21, '4.696294956557727', 4, 5, 1),
(22, '7.135544653176837', 5, 1, 1),
(23, '2.588838672813809', 5, 2, 1),
(24, '8.537559681141339', 5, 3, 1),
(25, '6.921282663868071', 5, 4, 1),
(26, '7.9937345525191486', 5, 5, 1),
(27, '9.204825047594332', 6, 1, 1),
(28, '3.04292185701702', 6, 2, 1),
(29, '4.600134418904906', 6, 3, 1),
(30, '3.8719068000762786', 6, 4, 1),
(31, '4.559131020269479', 6, 5, 1);

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

--
-- Dumping data for table `post_media`
--

INSERT INTO `post_media` (`id`, `title`, `dir`, `type_id`, `extension_id`, `compressed`, `size`, `user_id`, `post_id`, `created`, `updated`, `actived`) VALUES
(1, 'home', 'home.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

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
-- Table structure for table `post_settings`
--

CREATE TABLE `post_settings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon_dir` varchar(1500) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `default` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_settings`
--

INSERT INTO `post_settings` (`id`, `title`, `icon_dir`, `priority`, `default`, `user_id`, `created`, `updated`, `actived`) VALUES
(1, 'price', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(2, 'space', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(3, 'floor', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(4, 'bedrooms', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(5, 'rooms', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(6, NULL, NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1);

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

--
-- Dumping data for table `post_status`
--

INSERT INTO `post_status` (`id`, `title`, `user_id`, `permissionLVL`, `created`, `updated`, `actived`) VALUES
(1, 'Approved', 1, 1, '2021-10-09 18:44:49', NULL, 1),
(2, 'Not Approved', 1, 1, '2021-10-09 18:44:49', NULL, 1),
(3, 'Pendding', 1, 1, '2021-10-09 18:44:49', NULL, 1);

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
(1, 'admin', 999, 2, 1, '2021-09-24 18:17:43', '2021-09-25 01:48:21', 1),
(2, 'clientUser', 1, 1, 1, '2021-09-24 18:17:43', '0000-00-00 00:00:00', 1);

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
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
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
-- Indexes for table `post_settings`
--
ALTER TABLE `post_settings`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_details`
--
ALTER TABLE `post_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `post_media`
--
ALTER TABLE `post_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_media_types`
--
ALTER TABLE `post_media_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_settings`
--
ALTER TABLE `post_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_status`
--
ALTER TABLE `post_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
