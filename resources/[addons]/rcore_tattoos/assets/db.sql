CREATE TABLE IF NOT EXISTS `rcore_tattoos`
(
    identifier varchar(100) not null,
    tattoos    LONGTEXT null,
    constraint rcore_tattoos_pk
        primary key (identifier)
);

CREATE UNIQUE INDEX IF NOT EXISTS rcore_tattoos_identifier_uindex
    on rcore_tattoos (identifier);

-- Business table
CREATE TABLE IF NOT EXISTS `rcore_tattoos_business` (
  `name` varchar(60) NOT NULL,
  `margin` int(11) DEFAULT 20,
  `money` int(11) DEFAULT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
