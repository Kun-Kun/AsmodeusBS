ALTER TABLE `ippools` ADD COLUMN `comments` TEXT;

ALTER TABLE `crm_leads` ADD COLUMN `country` VARCHAR(80) NOT NULL DEFAULT '';

ALTER TABLE `equipment_infos` ADD COLUMN `last_activity` DATETIME NOT NULL;

CREATE TABLE IF NOT EXISTS  `equipment_ping_log` (
  `id` INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `nas_id` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `status` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0',
  `duration` DOUBLE(12, 4) NOT NULL DEFAULT '0.0000'
)
  COMMENT = 'Equipment ping';

ALTER TABLE `ipn_traf_detail` CHANGE COLUMN s_time s_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `ipn_traf_detail` CHANGE COLUMN f_time f_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `s_detail` CHANGE COLUMN start start TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `errors_log` CHANGE COLUMN date date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `internet_log` CHANGE COLUMN start start TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `dv_log` CHANGE COLUMN start start TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
