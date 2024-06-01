
CREATE TABLE IF NOT EXISTS `lux_core_user_settings` (
  `identifier` varchar(50) DEFAULT NULL,
  `progressbar` varchar(50) DEFAULT NULL,
  `notify` varchar(50) DEFAULT NULL,
  `input` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
