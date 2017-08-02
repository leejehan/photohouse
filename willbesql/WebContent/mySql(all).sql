/* mySQL */

Create table willbe_member(
id varchar(20) primary key,
pass varchar(20),
name varchar(20),
sex varchar(5),
phone varchar(20),
email varchar(40)
);


CREATE TABLE `willbe_schedule` (
   `id` VARCHAR(50) NULL,
   `year` VARCHAR(50) NULL,
   `month` VARCHAR(50) NULL,
   `day` VARCHAR(50) NULL,
   `time` VARCHAR(50) NULL,
   `title` VARCHAR(50) NULL,
   `content` TEXT NULL DEFAULT NULL,
   CONSTRAINT `FK__willbe_schedule` FOREIGN KEY (`id`) REFERENCES `willbe_member` (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `willbe_diary` (
   `id` VARCHAR(30) NULL,
   `year` VARCHAR(30) NULL,
   `month` VARCHAR(30) NULL,
   `day` VARCHAR(30) NULL,
   `time` VARCHAR(30) NULL,
   `title` VARCHAR(50) NULL,
   `content` TEXT NULL DEFAULT NULL,
   CONSTRAINT `FK__willbe_diary` FOREIGN KEY (`id`) REFERENCES `willbe_member` (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `willbe_wallet` (
   `id` VARCHAR(30) NULL,
   `no` INT(20) NULL AUTO_INCREMENT,
   `inouttype` VARCHAR(20) NULL DEFAULT '0',
   `year` VARCHAR(50) NULL DEFAULT '0',
   `month` VARCHAR(50) NULL DEFAULT '0',
   `day` VARCHAR(50) NULL DEFAULT '0',
   `moneyinout` VARCHAR(50) NULL DEFAULT '0',
   `content` TEXT NULL DEFAULT NULL,
   `moneysum` VARCHAR(50) NULL DEFAULT '0',
   UNIQUE INDEX `no` (`no`),
   CONSTRAINT `FK__willbe_member` FOREIGN KEY (`id`) REFERENCES `willbe_member` (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `willbe_memo` (
   `memo_num` INT(30) NOT NULL AUTO_INCREMENT,
   `member_id` VARCHAR(50) NULL,
   `memo_contents` TEXT NULL DEFAULT NULL,
   PRIMARY KEY (`memo_num`),
   CONSTRAINT `FK__willbe_memo` FOREIGN KEY (`member_id`) REFERENCES `willbe_member` (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


/*    board       */
CREATE TABLE `togetherBoard` (
	`board_num` INT NOT NULL AUTO_INCREMENT,
	`member_id` VARCHAR(50) NULL,
	`board_title` VARCHAR(50) NULL,
	`board_contents` TEXT NULL,
	`board_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`board_readcount` INT NULL DEFAULT '0',
	`board_like` INT NULL DEFAULT '0',
	`board_file` VARCHAR(50) NULL,
	PRIMARY KEY (`board_num`),
	CONSTRAINT `FK__togetherBoard` FOREIGN KEY (`member_id`) REFERENCES `willbe_member` (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `togetherReply` (
	`reply_num` INT NOT NULL,
	`board_num` INT NULL,
	`member_id` VARCHAR(50) NULL,
	`reply_contents` TEXT NULL,
	`reply_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`reply_like` INT NULL DEFAULT '0',
	PRIMARY KEY (`reply_num`),
	CONSTRAINT `FK__togetherReply_num` FOREIGN KEY (`board_num`) REFERENCES `togetherboard` (`board_num`),
	CONSTRAINT `FK__togetherReply_id` FOREIGN KEY (`member_id`) REFERENCES `willbe_member` (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;



CREATE TABLE `togetherBoard_like` (
	`like_id` VARCHAR(50) NULL,
	`board_num` INT NULL,
	CONSTRAINT `FK__togetherBoard_like` FOREIGN KEY (`board_num`) REFERENCES `togetherboard` (`board_num`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;



CREATE TABLE `questionBoard` (
	`board_num` INT NOT NULL AUTO_INCREMENT,
	`member_id` VARCHAR(50) NULL,
	`board_title` VARCHAR(50) NULL,
	`board_contents` TEXT NULL,
	`board_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`board_readcount` INT NULL DEFAULT '0',
	`board_file` VARCHAR(50) NULL,
	PRIMARY KEY (`board_num`),
	CONSTRAINT `FK__questionBoard` FOREIGN KEY (`member_id`) REFERENCES `willbe_member` (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `questionReply` (
	`reply_num` INT NOT NULL AUTO_INCREMENT,
	`board_num` INT NULL,
	`member_id` VARCHAR(50) NULL,
	`reply_contents` TEXT NULL,
	`reply_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`reply_num`),
	CONSTRAINT `FK__questionReply_num` FOREIGN KEY (`board_num`) REFERENCES `questionboard` (`board_num`),
	CONSTRAINT `FK__questionReply_id` FOREIGN KEY (`member_id`) REFERENCES `willbe_member` (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

