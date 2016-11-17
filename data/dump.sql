SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `acl_t_users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `surname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'REGULAR',
  `options` text,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bjy_t_linkers` (
  `user_id` int(11) NOT NULL,
  `role_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bjy_t_permissions` (
  `id` int(11) NOT NULL,
  `resource_id` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bjy_t_resources` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `code` varchar(45) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bjy_t_roles` (
  `id` int(11) NOT NULL,
  `pid` varchar(45) DEFAULT NULL,
  `code` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bjy_t_rules` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `access` tinyint(1) DEFAULT '1',
  `roles` text NOT NULL,
  `resource_id` varchar(45) NOT NULL,
  `permissions` text NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_addresses` (
  `id` int(11) NOT NULL,
  `reftype` enum('ADVOCATE','LEGAL') NOT NULL,
  `refid` int(11) NOT NULL,
  `refversion` int(11) NOT NULL DEFAULT '1',
  `status` enum('DRAFT','ADDED','READY','MODIFIED','REMOVAL','DELETED') NOT NULL DEFAULT 'DRAFT',
  `type` enum('PRIMARY','ADDITIONAL') NOT NULL DEFAULT 'PRIMARY',
  `regionid` int(11) DEFAULT NULL,
  `districtid` int(11) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `areaid` int(11) DEFAULT NULL,
  `zipcode` varchar(5) DEFAULT NULL,
  `strtype` enum('NA','SQUARE','STREET','LANE','AVENUE','MICRODISTR','QUAY','PUBLICSQUA','QUARTAL','HIGHWAY','BOULEVARD','PASSAGE') NOT NULL DEFAULT 'NA',
  `strname` varchar(255) DEFAULT NULL,
  `housenum` varchar(10) DEFAULT NULL,
  `exttype` enum('NA','LETTER','HOUSING','BUILDING') NOT NULL DEFAULT 'NA',
  `extnum` varchar(100) DEFAULT NULL,
  `apttype` enum('NA','OFFICE','FLAT','CABINET','ROOM','HOUSING','BUILDING') NOT NULL DEFAULT 'NA',
  `aptnum` varchar(100) DEFAULT NULL,
  `contacts` text,
  `email` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  `raw` text,
  `version` int(11) NOT NULL DEFAULT '1',
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELIMITER $$
CREATE TRIGGER `ADDRESSES_AFTER_INSERT` AFTER INSERT ON `era_t_addresses`
 FOR EACH ROW BEGIN
	CALL prd_p_update_address(NEW.`status`, NEW.`id`);
END
$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS `era_t_advocates` (
  `id` int(11) NOT NULL,
  `legacyid` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `status` enum('DRAFT','ADDED','READY','MODIFIED','REMOVAL','DELETED') NOT NULL DEFAULT 'DRAFT',
  `approved` tinyint(1) DEFAULT '0',
  `surname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `birthday` datetime DEFAULT '0000-00-00 00:00:00',
  `raid` int(11) DEFAULT NULL,
  `regnum` varchar(20) DEFAULT NULL,
  `regat` datetime DEFAULT '0000-00-00 00:00:00',
  `certnum` varchar(20) DEFAULT NULL,
  `certbytype` enum('RA','KDKA','IOA') DEFAULT NULL,
  `certbyid` int(11) DEFAULT NULL,
  `certat` datetime DEFAULT '0000-00-00 00:00:00',
  `contacts` text,
  `email` varchar(255) DEFAULT NULL,
  `suspended` text,
  `canceled` text,
  `otherinfo` text,
  `aboutinfo` text,
  `options` text,
  `state` enum('INACTIVE','ACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `version` int(11) NOT NULL DEFAULT '1',
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELIMITER $$
CREATE TRIGGER `ADVOCATES_AFTER_INSERT` AFTER INSERT ON `era_t_advocates`
 FOR EACH ROW BEGIN
	CALL prd_p_update_advocate(NEW.`status`, NEW.`id`);
END
$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS `era_t_advocate_legals` (
  `id` int(11) NOT NULL,
  `advocateid` int(11) NOT NULL,
  `advocateversion` int(11) NOT NULL DEFAULT '1',
  `type` enum('NA','ORGANIZATION','INDIVIDUAL','BUREAU') DEFAULT NULL,
  `status` enum('DRAFT','ADDED','READY','MODIFIED','REMOVAL','DELETED') NOT NULL DEFAULT 'DRAFT',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contacts` text,
  `raw` text,
  `version` int(11) NOT NULL DEFAULT '1',
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELIMITER $$
CREATE TRIGGER `ADVOCATE_LEGALS_AFTER_INSERT` AFTER INSERT ON `era_t_advocate_legals`
 FOR EACH ROW BEGIN
	CALL prd_p_update_advocate_legal(NEW.`status`, NEW.`id`);
END
$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS `era_t_advocate_occupations` (
  `id` int(11) NOT NULL,
  `status` enum('DRAFT','ADDED','READY','MODIFIED','REMOVAL','DELETED') NOT NULL DEFAULT 'DRAFT',
  `advocateid` int(11) NOT NULL,
  `advocateversion` int(11) NOT NULL DEFAULT '1',
  `type` enum('NA','TYPE1','TYPE2','TYPE3','TYPE4','TYPE5','TYPE6','TYPE7','TYPE8','TYPE9','TYPE10','TYPE11','TYPE12','TYPE13','TYPE14','TYPE15') DEFAULT 'NA',
  `decision` varchar(45) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `description` text,
  `raw` text,
  `version` varchar(45) NOT NULL DEFAULT '1',
  `createdby` int(45) DEFAULT NULL,
  `createdat` datetime NOT NULL,
  `modifiedby` int(45) DEFAULT NULL,
  `modifiedat` datetime NOT NULL,
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELIMITER $$
CREATE TRIGGER `ADVOCATE_OCCUPATIONS_AFTER_INSERT` AFTER INSERT ON `era_t_advocate_occupations`
 FOR EACH ROW BEGIN
	CALL prd_p_update_advocate_occupation(NEW.`status`, NEW.`id`);
END
$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS `era_t_advocate_transfers` (
  `id` int(11) NOT NULL,
  `advocateid` int(11) DEFAULT NULL,
  `status` enum('DRAFT','PENDING','CONFIRMED','REJECTED','CANCELLED','TRANSFER','APPEARED','COMPLETED') NOT NULL DEFAULT 'DRAFT',
  `raid` int(11) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELIMITER $$
CREATE TRIGGER `ADVOCATE_TRANSFERS_AFTER_INSERT` AFTER INSERT ON `era_t_advocate_transfers`
 FOR EACH ROW BEGIN
	CALL prd_p_update_advocate_transfer(NEW.`status`, NEW.`id`, NEW.`advocateid`);
END
$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS `era_t_assistants` (
  `id` int(11) NOT NULL,
  `legacyid` int(11) DEFAULT NULL,
  `advocateid` int(11) DEFAULT NULL,
  `status` enum('DRAFT','ADDED','READY','MODIFIED','REMOVAL','DELETED') NOT NULL DEFAULT 'DRAFT',
  `surname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `certnum` varchar(20) DEFAULT NULL,
  `certbytype` varchar(10) DEFAULT NULL,
  `certbyid` int(11) DEFAULT NULL,
  `certsdate` datetime DEFAULT '0000-00-00 00:00:00',
  `certedate` datetime DEFAULT '0000-00-00 00:00:00',
  `state` enum('INACTIVE','ACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `options` text,
  `version` int(11) NOT NULL DEFAULT '1',
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELIMITER $$
CREATE TRIGGER `ASSISTANTS_AFTER_INSERT` AFTER INSERT ON `era_t_assistants`
 FOR EACH ROW BEGIN
	CALL prd_p_update_assistant(NEW.`status`, NEW.`id`);
END
$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS `era_t_attachments` (
  `id` int(11) NOT NULL,
  `legacyid` int(11) DEFAULT '0',
  `reftype` enum('ADVOCATE','TRANSFER','ASSISTANT') NOT NULL,
  `refid` int(11) NOT NULL,
  `refversion` int(11) NOT NULL DEFAULT '1',
  `status` enum('DRAFT','ADDED','READY','MODIFIED','REMOVAL','DELETED') NOT NULL DEFAULT 'DRAFT',
  `name` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `tmp_name` varchar(500) NOT NULL,
  `error` int(1) NOT NULL,
  `size` int(11) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELIMITER $$
CREATE TRIGGER `ATTACHMENTS_AFTER_INSERT` AFTER INSERT ON `era_t_attachments`
 FOR EACH ROW BEGIN
	CALL prd_p_update_attachment(NEW.`status`, NEW.`id`);
END
$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS `era_t_audit` (
  `id` int(11) NOT NULL,
  `reftype` varchar(255) NOT NULL,
  `refid` int(11) NOT NULL,
  `refversion` int(11) NOT NULL,
  `action` varchar(30) NOT NULL,
  `message` varchar(255) NOT NULL,
  `payload` text,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rowstatus` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_confirmations` (
  `id` int(11) NOT NULL,
  `legacyid` int(11) NOT NULL,
  `advocateid` int(11) DEFAULT NULL,
  `raid` int(11) NOT NULL,
  `approved` bit(1) NOT NULL DEFAULT b'0',
  `confirmed` bit(1) NOT NULL DEFAULT b'0',
  `surname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `regnum` varchar(20) DEFAULT NULL,
  `regat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `certnum` varchar(20) NOT NULL,
  `certby` int(11) NOT NULL,
  `certat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `regionid` int(11) NOT NULL,
  `districtid` int(11) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contacts` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `suspended` text,
  `otherinfo` text,
  `orginfo` text,
  `orgregionid` int(11) NOT NULL,
  `orgdistrictid` int(11) DEFAULT NULL,
  `orgcity` varchar(255) DEFAULT NULL,
  `orgzipcode` varchar(10) NOT NULL,
  `orgaddress` text,
  `orgcontacts` text NOT NULL,
  `orgemail` varchar(255) DEFAULT NULL,
  `notes` text,
  `version` int(11) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rowstatus` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_filters` (
  `id` int(11) NOT NULL,
  `code` varchar(200) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `value` text NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `era_t_geo_areas` (
  `id` int(11) NOT NULL,
  `regionid` int(11) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL,
  `rowstatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `era_t_geo_cities` (
  `id` int(10) unsigned NOT NULL,
  `districtid` int(11) DEFAULT NULL,
  `regionid` int(11) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `modifiedat` int(11) NOT NULL,
  `modifiedby` datetime NOT NULL,
  `rowstatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_geo_districts` (
  `id` int(11) NOT NULL,
  `regionid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_geo_regions` (
  `id` int(11) NOT NULL,
  `raid` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_geo_settlements` (
  `id` int(11) NOT NULL,
  `regionid` int(11) NOT NULL,
  `districtid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `phonecode` varchar(10) DEFAULT NULL,
  `zipcodes` text,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_ioas` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `head` varchar(255) DEFAULT NULL,
  `headtitle` varchar(255) DEFAULT NULL,
  `address` text,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_kdkas` (
  `id` int(11) NOT NULL,
  `raid` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `head` varchar(255) DEFAULT NULL,
  `headtitle` varchar(255) DEFAULT NULL,
  `address` text,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_payments` (
  `id` int(11) NOT NULL,
  `legacyid` int(11) NOT NULL,
  `advocateid` int(11) DEFAULT NULL,
  `raid` int(11) NOT NULL,
  `reasonid` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `version` int(11) NOT NULL DEFAULT '1',
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELIMITER $$
CREATE TRIGGER `PAYMENTS_AFTER_INSERT` AFTER INSERT ON `era_t_payments`
 FOR EACH ROW BEGIN
	CALL prd_p_update_payment(NEW.`id`);
    CALL prd_p_update_reconcilation(NEW.`advocateid`);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PAYMENTS_AFTER_UPDATE` AFTER UPDATE ON `era_t_payments`
 FOR EACH ROW BEGIN
	CALL prd_p_update_payment(NEW.`id`);
    CALL prd_p_update_reconcilation(NEW.`advocateid`);
END
$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS `era_t_payment_reasons` (
  `id` int(11) NOT NULL,
  `state` enum('INACTIVE','ACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `name` varchar(255) NOT NULL,
  `code` varchar(100) NOT NULL,
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `sortkey` int(11) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_ras` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `head` int(11) DEFAULT NULL,
  `headfio` varchar(255) NOT NULL,
  `headtitle` varchar(255) DEFAULT NULL,
  `address` text,
  `account_bank` varchar(100) DEFAULT NULL,
  `account_num` varchar(100) DEFAULT NULL,
  `account_mfo` varchar(10) DEFAULT NULL,
  `account_edrpou` varchar(20) DEFAULT NULL,
  `createdby` int(11) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `modifiedby` int(11) NOT NULL,
  `modifiedat` datetime NOT NULL DEFAULT '2016-01-01 00:00:00',
  `rowstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_sequences` (
  `name` varchar(255) NOT NULL,
  `lastid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `era_t_storages` (
  `id` int(11) NOT NULL,
  `code` varchar(200) NOT NULL,
  `value` text NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `acl_t_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`);

ALTER TABLE `bjy_t_linkers`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

ALTER TABLE `bjy_t_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `code` (`code`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`);

ALTER TABLE `bjy_t_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `pid` (`pid`),
  ADD KEY `modifiedby` (`modifiedby`);

ALTER TABLE `bjy_t_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `code` (`code`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `rowstatus` (`rowstatus`);

ALTER TABLE `bjy_t_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `access` (`access`);

ALTER TABLE `era_t_addresses`
  ADD PRIMARY KEY (`id`,`version`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `regionid` (`regionid`),
  ADD KEY `districtid` (`districtid`);

ALTER TABLE `era_t_advocates`
  ADD PRIMARY KEY (`id`,`version`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `raid` (`raid`),
  ADD KEY `regby` (`certbyid`),
  ADD KEY `approved` (`approved`),
  ADD KEY `state` (`state`);

ALTER TABLE `era_t_advocate_legals`
  ADD PRIMARY KEY (`id`,`version`),
  ADD KEY `advocateid` (`advocateid`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `rowstatus` (`rowstatus`);

ALTER TABLE `era_t_advocate_occupations`
  ADD PRIMARY KEY (`id`,`version`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `advocateid` (`advocateid`);

ALTER TABLE `era_t_advocate_transfers`
  ADD PRIMARY KEY (`id`,`version`),
  ADD KEY `raid` (`raid`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `createdby` (`createdby`);

ALTER TABLE `era_t_assistants`
  ADD PRIMARY KEY (`id`,`version`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `advocateid` (`advocateid`);

ALTER TABLE `era_t_attachments`
  ADD PRIMARY KEY (`id`,`version`),
  ADD KEY `refid` (`refid`),
  ADD KEY `refversion` (`refversion`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `rowstatus` (`rowstatus`);

ALTER TABLE `era_t_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `createdby` (`createdby`);

ALTER TABLE `era_t_confirmations`
  ADD PRIMARY KEY (`id`,`version`),
  ADD KEY `raid` (`raid`),
  ADD KEY `advocateid` (`advocateid`),
  ADD KEY `certby` (`certby`),
  ADD KEY `regionid` (`regionid`),
  ADD KEY `districtid` (`districtid`),
  ADD KEY `orgregionid` (`orgregionid`),
  ADD KEY `orgdistrictid` (`orgdistrictid`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `createdby` (`createdby`);

ALTER TABLE `era_t_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

ALTER TABLE `era_t_geo_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `cityid` (`cityid`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`);

ALTER TABLE `era_t_geo_cities`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `era_t_geo_districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regionid` (`regionid`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `rowstatus` (`rowstatus`);

ALTER TABLE `era_t_geo_regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raid` (`raid`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `rowstatus` (`rowstatus`);

ALTER TABLE `era_t_geo_settlements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regionid` (`regionid`),
  ADD KEY `districtid` (`districtid`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `createdby` (`createdby`);

ALTER TABLE `era_t_ioas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`);

ALTER TABLE `era_t_kdkas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `raid` (`raid`);

ALTER TABLE `era_t_payments`
  ADD PRIMARY KEY (`id`,`version`),
  ADD KEY `rowstatus` (`rowstatus`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `advocateid` (`advocateid`),
  ADD KEY `raid` (`raid`),
  ADD KEY `reasonid` (`reasonid`);

ALTER TABLE `era_t_payment_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `createdby` (`createdby`);

ALTER TABLE `era_t_ras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `modifiedby` (`modifiedby`),
  ADD KEY `rowstatus` (`rowstatus`);

ALTER TABLE `era_t_sequences`
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `era_t_storages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);


ALTER TABLE `acl_t_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `bjy_t_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `bjy_t_resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `bjy_t_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `bjy_t_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_advocates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_advocate_legals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_advocate_occupations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_advocate_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_assistants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_confirmations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_geo_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_geo_cities`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_geo_districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_geo_regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_geo_settlements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_ioas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_kdkas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_payment_reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_ras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `era_t_storages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;