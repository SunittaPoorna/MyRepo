ALTER TABLE `schools` ADD `workingDays` VARCHAR(10) NULL AFTER `allocationMemory`, ADD `startTime` TIME NOT NULL AFTER `workingDays`, ADD `endTime` TIME NOT NULL AFTER `startTime`;

ALTER TABLE `schools` CHANGE `workingDays` `startWorkingDay` VARCHAR(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL, CHANGE `startTime` `startTime` VARBINARY(10) NOT NULL, CHANGE `endTime` `endTime` VARBINARY(10) NOT NULL;
ALTER TABLE `schools` ADD `endWorkingDay` VARCHAR(10) NOT NULL AFTER `startWorkingDay`; 
ALTER TABLE `schools` CHANGE `startTime` `startTime` VARCHAR(10) NOT NULL, CHANGE `endTime` `endTime` VARCHAR(10) NOT NULL;

