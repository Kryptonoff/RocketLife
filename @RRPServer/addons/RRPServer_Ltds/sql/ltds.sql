ALTER TABLE `ltds`
DROP COLUMN `last_update`,
ADD COLUMN `last_update`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP AFTER `bank`;

