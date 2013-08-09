CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_alphas` AS 

select `DC_namesDevices`.`id` AS `deviceID`,`DC_namesDevices`.`categoryID` AS `categoryID`,
(case 
	when (`DC_namesDevices`.`id` = 22) then 0.2 
	when (`DC_namesDevices`.`id` = 47) then 0.1 
	when (`DC_namesDevices`.`categoryID` = 203) then 0 
	when (`DC_namesDevices`.`id` = 35) then 0.4 
	when (`DC_namesDevices`.`id` in (36,38)) then 0 
	when (`DC_namesDevices`.`id` in (8,12,13,42,41,43,40)) then 0 
	when (`DC_namesDevices`.`id` = 49) then 0 
	when (`DC_namesDevices`.`id` in (50,51)) then 0.3 
	when (`DC_namesDevices`.`categoryID` = 208) then 0 
	when (`DC_namesDevices`.`id` in (54,55)) then 0.4 
	when (`DC_namesDevices`.`id` = 56) then 0.2 
	when (`DC_namesDevices`.`id` in (69,24,70,25,26,71)) then 0 
	when (`DC_namesDevices`.`id` = 7) then 0 
	when (`DC_namesDevices`.`id` = 20) then 0.5 else 1 end) 
	AS `alpha` 
from `DC_namesDevices` order by `DC_namesDevices`.`categoryID`