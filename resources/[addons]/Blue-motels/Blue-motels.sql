CREATE TABLE `blue_motels` (
    `rentalid` BIGINT(255) NOT NULL AUTO_INCREMENT,
    `ident` VARCHAR(70) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
    `motelid` BIGINT(255) NULL DEFAULT '0',
    `room` VARCHAR(50) NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
    `days_left` BIGINT(255) NULL DEFAULT '0',
    PRIMARY KEY (`rentalid`) USING BTREE,
    INDEX `ident` (`ident`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=78
;