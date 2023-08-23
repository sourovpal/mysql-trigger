
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
