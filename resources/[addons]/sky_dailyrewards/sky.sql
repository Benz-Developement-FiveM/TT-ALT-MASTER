CREATE TABLE IF NOT EXISTS `sky_systems` (
  identifier VARCHAR(60) NOT NULL,
  PRIMARY KEY (`identifier`)
);

ALTER TABLE `sky_systems` ADD COLUMN `dailyrewards` longtext DEFAULT '[{\"day\": 1,\"claimedTimestamp\":0,\"skipped\":false}]';