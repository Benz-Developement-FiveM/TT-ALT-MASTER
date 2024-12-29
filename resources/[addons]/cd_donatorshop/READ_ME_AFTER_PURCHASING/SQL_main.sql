CREATE TABLE IF NOT EXISTS `cd_donatorshop` (
	`identifier` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`balance` INT(100) NULL DEFAULT '0'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `cd_donatorshop_logs` (
	`identifier` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`transaction_id` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`redeemed` TINYINT(1) NULL DEFAULT '0',
	`package` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`buyer_name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`buyer_email` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_bin'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
