-- Auriya
-- Sniff/WDB
UPDATE `creature_template` SET `unit_flags`=0,`type_flags`=0 WHERE `entry`=33515;
UPDATE `creature_template` SET `equipment_id`=2500 WHERE `entry`=33515;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=34096;
UPDATE `creature_template` SET `speed_walk`=0.5 WHERE `entry`=33113;
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=137496;
UPDATE `creature_model_info` SET `bounding_radius`=0.775, `combat_reach`=5 WHERE `modelid`=28651;
UPDATE `creature_template` SET `dmg_multiplier`=60 WHERE `entry`=33515;

-- Other updates
DELETE FROM `creature` WHERE `id`=34014;

DELETE FROM `creature_equip_template` WHERE `entry`=2500;
INSERT INTO `creature_equip_template` VALUES (2500,45315,0,0);

DELETE FROM `creature_addon` WHERE `guid`=137496;
INSERT INTO `creature_addon` VALUES (137496,1033515,0,0,0,0,0);

DELETE FROM `waypoint_data` WHERE `id`=1033515;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
(1033515,1,1968.46,51.75,417.72,0,0,0,100,0),
(1033515,2,1956.75,49.22,411.35,0,0,0,100,0),
(1033515,3,1938.90,42.09,411.35,3000,0,0,100,0),
(1033515,4,1956.75,49.22,411.35,0,0,0,100,0),
(1033515,5,1968.46,51.75,417.72,0,0,0,100,0),
(1033515,6,2011.43,44.91,417.72,0,0,0,100,0),
(1033515,7,2022.65,37.74,411.36,0,0,0,100,0),
(1033515,8,2046.65,9.61,411.36,0,0,0,100,0),
(1033515,9,2053.4,-8.65,421.68,0,0,0,100,0),
(1033515,10,2053.14,-39.8,421.66,0,0,0,100,0),
(1033515,11,2046.26,-57.96,411.35,0,0,0,100,0),
(1033515,12,2022.42,-86.39,411.35,0,0,0,100,0),
(1033515,13,2011.26,-92.95,417.71,0,0,0,100,0),
(1033515,14,1969.43,-100.02,417.72,0,0,0,100,0),
(1033515,15,1956.66,-97.4,411.35,0,0,0,100,0),
(1033515,16,1939.18,-90.90,411.35,3000,0,0,100,0),
(1033515,17,1956.66,-97.4,411.35,0,0,0,100,0),
(1033515,18,1969.43,-100.02,417.72,0,0,0,100,0),
(1033515,19,2011.26,-92.95,417.71,0,0,0,100,0),
(1033515,20,2022.42,-86.39,411.35,0,0,0,100,0),
(1033515,21,2046.26,-57.96,411.35,0,0,0,100,0),
(1033515,22,2053.14,-39.8,421.66,0,0,0,100,0),
(1033515,23,2053.4,-8.65,421.68,0,0,0,100,0),
(1033515,24,2046.65,9.61,411.36,0,0,0,100,0),
(1033515,25,2022.65,37.74,411.36,0,0,0,100,0),
(1033515,26,2011.43,44.91,417.72,0,0,0,100,0);
DELETE FROM `gameobject` WHERE `id`=194905;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(35528,194905,603,1,1,401.308,-13.8236,409.524,3.14159,0,0,0,1,180,255,0);

-- Scriptnames
UPDATE `creature_template` SET `ScriptName`= 'mob_feral_defender' WHERE `entry`=34035;
UPDATE `creature_template` SET `ScriptName`= 'mob_sanctum_sentry' WHERE `entry`=34014;
UPDATE `creature_template` SET `ScriptName`= 'seeping_trigger' WHERE `entry`=34098;
UPDATE `creature_template` SET `ScriptName`= 'feral_defender_trigger' WHERE `entry`=34096;
