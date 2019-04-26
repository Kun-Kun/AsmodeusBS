CREATE TABLE IF NOT EXISTS `price_services_list` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `price` FLOAT(12, 2) UNSIGNED NOT NULL DEFAULT 0,
  `id_group` INT(10) UNSIGNED NOT NULL,
  `comments` TEXT NOT NULL,
  PRIMARY KEY `services_list_id` (`id`)
) DEFAULT CHARSET=utf8 COMMENT = 'Price service list';

CREATE TABLE IF NOT EXISTS `price_groups` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `comments` TEXT NOT NULL,
  PRIMARY KEY `group_id` (`id`)
) DEFAULT CHARSET=utf8 COMMENT = 'Price groups';

CREATE TABLE IF NOT EXISTS `price_form` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` INT(10) UNSIGNED NOT NULL,
  `key_` VARCHAR(255) NOT NULL DEFAULT '',
  `value` VARCHAR(255) NOT NULL DEFAULT '',
  `checked` VARCHAR(10) NOT NULL DEFAULT '',
  PRIMARY KEY `form_id` (`id`)
) DEFAULT CHARSET=utf8 COMMENT = 'Price form';