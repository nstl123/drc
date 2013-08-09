CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_scenarioNamesDead` AS 

select `DC_scenarioNames`.`id` AS `id`,`DC_scenarioNames`.`timestamp` AS `timestamp`, `DC_scenarioNames`.`namen` AS `namen` 

from `DC_scenarioNames` 
	where (`DC_scenarioNames`.`id` <> 10001) 
	
order by `DC_scenarioNames`.`timestamp` desc limit 5,250