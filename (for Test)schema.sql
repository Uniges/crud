USE test;
DROP TABLE IF EXISTS book;
CREATE TABLE `book` (
  `id` INT(4) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(30) NOT NULL,
  `description` VARCHAR(40) NOT NULL,
  `author` VARCHAR(25) NOT NULL,
  `isbn` VARCHAR(15) NOT NULL,
  `printyear` INT(4) NOT NULL,
  `readalready` BIT(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
)
  COLLATE='utf8_general_ci'
  ENGINE=InnoDB
  AUTO_INCREMENT=1
  DEFAULT CHARACTER SET = utf8
;