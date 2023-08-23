
DELIMITER $$
CREATE TRIGGER `before_users_update` BEFORE UPDATE ON `users` FOR EACH ROW 
BEGIN
INSERT into users_logs (
    `id`,
    `name`,
    `create_by`,
    `updated_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `trigger_at`
    ) VALUES (old.id, old.name, old.create_by, old.updated_by, old.created_at, old.updated_at, old.deleted_at, NOW());
END$$
DELIMITER ;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `create_by` int NOT NULL DEFAULT '0',
  `updated_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TRIGGER IF EXISTS `after_users_insert`;
DELIMITER $$
CREATE TRIGGER `after_users_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
INSERT into users_logs (
    `id`,
    `name`,
    `create_by`,
    `updated_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `trigger_at`
    ) VALUES (new.id, new.name, new.create_by, new.updated_by, new.created_at, new.updated_at, new.deleted_at, NOW());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `before_users_update`;
DELIMITER $$
CREATE TRIGGER `before_users_update` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
INSERT into users_logs (
    `id`,
    `name`,
    `create_by`,
    `updated_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `trigger_at`
    ) VALUES (old.id, old.name, old.create_by, old.updated_by, old.created_at, old.updated_at, old.deleted_at, NOW());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `before_users_delete`;
DELIMITER $$
CREATE TRIGGER `before_users_delete` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
INSERT into users_logs (
    `id`,
    `name`,
    `create_by`,
    `updated_by`,
    `created_at`,
    `updated_at`,
    `deleted_at`,
    `trigger_at`
    ) VALUES (old.id, old.name, old.create_by, old.updated_by, old.created_at, old.updated_at, old.deleted_at, NOW());
END
$$
DELIMITER ;


DROP TABLE IF EXISTS `users_logs`;
CREATE TABLE IF NOT EXISTS `users_logs` (
  `trigger_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `create_by` int NOT NULL DEFAULT '0',
  `updated_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `trigger_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`trigger_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
