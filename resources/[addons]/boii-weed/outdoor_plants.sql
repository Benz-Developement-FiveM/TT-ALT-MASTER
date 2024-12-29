CREATE TABLE `outdoor_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `strain` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `hunger` double NOT NULL,
  `thirst` double NOT NULL,
  `quality` double NOT NULL,
  `growth` double NOT NULL,
  `growthrate` int(11) NOT NULL,
  `degrade` int(11) NOT NULL,
  `coords` text DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
