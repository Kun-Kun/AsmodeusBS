ALTER TABLE `builds` ADD COLUMN `block` VARCHAR(20) NOT NULL DEFAULT '';
ALTER TABLE `builds` DROP KEY `street_id`;
ALTER TABLE `builds` ADD UNIQUE KEY `street_id` (`street_id`, `number`, `block`);

ALTER TABLE `shedule` ADD COLUMN  `service_id` INT(11) UNSIGNED NOT NULL DEFAULT '0';

CREATE TABLE IF NOT EXISTS `admin_type_permits` (
  `type` varchar(60) NOT NULL DEFAULT '',
  `section` smallint(6) unsigned NOT NULL DEFAULT '0',
  `actions` smallint(6) unsigned NOT NULL DEFAULT '0',
  `module` varchar(12) NOT NULL DEFAULT ''
)
  COMMENT = 'Deferred tasks';

REPLACE INTO `admin_type_permits` (`type`, `section`, `actions`, `module`) VALUES
  ('$lang{ALL} $lang{PERMISSION}', 0,  0, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  1, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  2, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  3, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  4, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  5, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  6, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  7, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  8, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  9, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  10, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  11, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  14, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  16, ''),
  ('$lang{ALL} $lang{PERMISSION}', 0,  17, ''),
  ('$lang{ALL} $lang{PERMISSION}', 1,  0, ''),
  ('$lang{ALL} $lang{PERMISSION}', 1,  1, ''),
  ('$lang{ALL} $lang{PERMISSION}', 1,  2, ''),
  ('$lang{ALL} $lang{PERMISSION}', 1,  3, ''),
  ('$lang{ALL} $lang{PERMISSION}', 1,  4, ''),
  ('$lang{ALL} $lang{PERMISSION}', 2,  0, ''),
  ('$lang{ALL} $lang{PERMISSION}', 2,  1, ''),
  ('$lang{ALL} $lang{PERMISSION}', 2,  2, ''),
  ('$lang{ALL} $lang{PERMISSION}', 2,  3, ''),
  ('$lang{ALL} $lang{PERMISSION}', 3,  0, ''),
  ('$lang{ALL} $lang{PERMISSION}', 3,  1, ''),
  ('$lang{ALL} $lang{PERMISSION}', 3,  2, ''),
  ('$lang{ALL} $lang{PERMISSION}', 3,  3, ''),
  ('$lang{ALL} $lang{PERMISSION}', 4,  0, ''),
  ('$lang{ALL} $lang{PERMISSION}', 4,  1, ''),
  ('$lang{ALL} $lang{PERMISSION}', 4,  2, ''),
  ('$lang{ALL} $lang{PERMISSION}', 4,  3, ''),
  ('$lang{ALL} $lang{PERMISSION}', 4,  4, ''),
  ('$lang{ALL} $lang{PERMISSION}', 4,  5, ''),
  ('$lang{ALL} $lang{PERMISSION}', 4,  6, ''),
  ('$lang{ALL} $lang{PERMISSION}', 5,  0, ''),
  ('$lang{ALL} $lang{PERMISSION}', 5,  1, ''),
  ('$lang{ALL} $lang{PERMISSION}', 5,  2, ''),
  ('$lang{ALL} $lang{PERMISSION}', 6,  0, ''),
  ('$lang{ALL} $lang{PERMISSION}', 7,  0, ''),
  ('$lang{ALL} $lang{PERMISSION}', 8,  0, ''),

  ('$lang{MANAGER}', 0,  0, ''),
  ('$lang{MANAGER}', 0,  1, ''),
  ('$lang{MANAGER}', 0,  2, ''),
  ('$lang{MANAGER}', 0,  3, ''),
  ('$lang{MANAGER}', 0,  4, ''),
  ('$lang{MANAGER}', 0,  5, ''),
  ('$lang{MANAGER}', 0,  6, ''),
  ('$lang{MANAGER}', 0,  7, ''),
  ('$lang{MANAGER}', 0,  8, ''),
  ('$lang{MANAGER}', 0,  9, ''),
  ('$lang{MANAGER}', 0,  10, ''),
  ('$lang{MANAGER}', 0,  11, ''),
  ('$lang{MANAGER}', 1,  0, ''),
  ('$lang{MANAGER}', 1,  1, ''),
  ('$lang{MANAGER}', 2,  0, ''),
  ('$lang{MANAGER}', 2,  1, ''),
  ('$lang{MANAGER}', 5,  0, ''),
  ('$lang{MANAGER}', 5,  1, ''),
  ('$lang{MANAGER}', 6,  0, ''),
  ('$lang{MANAGER}', 7,  0, ''),
  ('$lang{MANAGER}', 8,  0, ''),

  ('$lang{SUPPORT}', 0,  0, 'Msgs'),
  ('$lang{SUPPORT}', 0,  2, 'Maps'),
  ('$lang{SUPPORT}', 5,  0, 'Snmputils'),
  ('$lang{SUPPORT}', 5,  1, 'Notepad'),
  ('$lang{SUPPORT}', 6,  0, ''),
  ('$lang{SUPPORT}', 7,  0, ''),
  ('$lang{SUPPORT}', 8,  0, ''),

  ('$lang{ACCOUNTANT}', 0,  0, 'Docs'),
  ('$lang{ACCOUNTANT}', 0,  2, 'Paysys'),
  ('$lang{ACCOUNTANT}', 1,  0, 'Cards'),
  ('$lang{ACCOUNTANT}', 1,  1, 'Extfin'),
  ('$lang{ACCOUNTANT}', 1,  2, 'Notepad'),
  ('$lang{ACCOUNTANT}', 1,  3, ''),
  ('$lang{ACCOUNTANT}', 1,  4, ''),
  ('$lang{ACCOUNTANT}', 2,  0, ''),
  ('$lang{ACCOUNTANT}', 2,  1, ''),
  ('$lang{ACCOUNTANT}', 2,  2, ''),
  ('$lang{ACCOUNTANT}', 2,  3, ''),
  ('$lang{ACCOUNTANT}', 3,  0, ''),
  ('$lang{ACCOUNTANT}', 3,  1, ''),
  ('$lang{ACCOUNTANT}', 6,  0, ''),
  ('$lang{ACCOUNTANT}', 7,  0, ''),
  ('$lang{ACCOUNTANT}', 8,  0, '');

