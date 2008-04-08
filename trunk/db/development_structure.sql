CREATE TABLE `appearances` (
  `id` int(11) NOT NULL auto_increment,
  `band_id` int(11) default NULL,
  `show_id` int(11) default NULL,
  `headliner` tinyint(1) default NULL,
  `notes` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `show_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bands` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `permalink` varchar(255) default NULL,
  `biography` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `permalink` varchar(255) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `performances` (
  `id` int(11) NOT NULL auto_increment,
  `appearance_id` int(11) default NULL,
  `song_id` int(11) default NULL,
  `position` int(11) default NULL,
  `notes` text,
  `segue` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_info` (
  `version` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `setlists` (
  `id` int(11) NOT NULL auto_increment,
  `appearance_id` int(11) default NULL,
  `band_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `performances_cache` int(11) default NULL,
  `approved` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `shows` (
  `id` int(11) NOT NULL auto_increment,
  `venue_id` int(11) default NULL,
  `date` datetime default NULL,
  `announced_at` datetime default NULL,
  `doors` time default NULL,
  `notes` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `songs` (
  `id` int(11) NOT NULL auto_increment,
  `band_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `lyrics` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `remember_token` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `password_reset_code` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `activation_code` varchar(40) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `activated_at` datetime default NULL,
  `deleted_at` datetime default NULL,
  `state` varchar(255) default 'passive',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `venues` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `permalink` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `schema_info` (version) VALUES (20080402090312)