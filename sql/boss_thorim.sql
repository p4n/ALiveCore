-- Thorim
-- WDB/Sniff
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,WHERE `entry` IN (32882,32908,32885,33110);
UPDATE `creature_template` SET `unit_flags`=0,`faction_A`=14,`faction_H`=14 WHERE `entry` IN (32876,32904,32878,32877,32874,32875);
UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry` IN (32892,32879,32780,33140,33141);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33686020 WHERE `entry`=33378;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=32872;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=32873;
UPDATE `creature_template` SET `modelid1`=16925,`modelid2`=0 WHERE `entry` IN (33725,33282);
UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry`=32892;
UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry`=32892;
UPDATE `creature_template` SET `dmgschool`=4,`dmg_multiplier`=7.5,`unit_flags`=33587202 WHERE `entry`=33196;
UPDATE `creature_template` SET `vehicleId`=336 WHERE `entry`=33432; -- Leviathan Mk II
UPDATE `creature_template` SET `unit_flags`=0,`type_flags`=8 WHERE `entry`=32865;
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14 WHERE `entry` IN (32882,32908,32885,33110);
UPDATE `creature_template` SET `unit_flags`=0,`faction_A`=14,`faction_H`=14 WHERE `entry` IN (32876,32904,32878,32877,32874,32875);

-- Other Updates
UPDATE `creature` SET `spawndist`=0 WHERE `guid`=136384;
UPDATE `creature` SET `position_x`=2135.078,`position_y`=-298.758,`orientation`=1.61 WHERE `guid`=136384;
DELETE FROM `creature` WHERE `id` IN (33378,32892);
DELETE FROM `creature` WHERE `guid` IN (136718,136694,136757,136700,136754,136666,136718,136653);

DELETE FROM `creature` WHERE `id` IN (32882,32908,32885,32879,33140,33141,33378,32892);
DELETE FROM `creature` WHERE `guid` IN (136490,136695,137584,136434,137585,136433,137583,137586,136435,136274,136436,136816,136725);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136409,33378,603,1,1,16925,0,2104.99,-233.484,433.573,5.49779,604800,0,0,12600,0,0,1),
(136410,33378,603,1,1,16925,0,2092.64,-262.594,433.576,6.26573,604800,0,0,12600,0,0,1),
(136411,33378,603,1,1,16925,0,2104.76,-292.719,433.181,0.785398,604800,0,0,12600,0,0,1),
(136416,33378,603,1,1,16925,0,2164.97,-293.375,433.526,2.35619,604800,0,0,12600,0,0,1),
(136417,33378,603,1,1,16925,0,2164.58,-233.333,433.892,3.90954,604800,0,0,12600,0,0,1),
(136418,33378,603,1,1,16925,0,2145.8,-222.196,433.293,4.45059,604800,0,0,12600,0,0,1),
(136419,33378,603,1,1,16925,0,2123.91,-222.443,433.375,4.97419,604800,0,0,12600,0,0,1);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(62042,62470,1, 'Thorim: Deafening Thunder');
-- Thorim Apparel / Orb!
DELETE FROM `conditions` WHERE `SourceEntry`=62016;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`) VALUES (13,0,62016,0,18,1,33378,0,0);

UPDATE `creature_template` SET `modelid1`=16925,`modelid2`=0 WHERE `entry`IN (33378,32892);
DELETE FROM `gameobject_template` WHERE `entry`=194265;
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`faction`,`flags`,`size`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`data0`,`data1`,`data2`,`data3`,`data4`,`data5`,`data6`,`data7`,`data8`,`data9`,`data10`,`data11`,`data12`,`data13`,`data14`,`data15`,`data16`,`data17`,`data18`,`data19`,`data20`,`data21`,`data22`,`data23`,`ScriptName`,`WDBVerified`) VALUES
(194265,1,295, 'Lever', '', '', '',0,16,3,0,0,0,0,0,0,0,0,6000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, '',11403);
UPDATE `gameobject` SET `id`=194265,`rotation2`=1,`rotation3`=0,`spawntimesecs`=7200,`animprogress`=100 WHERE `guid`=55194;
DELETE FROM `creature` WHERE `guid`=136816;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136816,33725,603,1,1,16925,0,2134.93,-339.696,437.311,0,604800,0,0,12600,0,0,0);
DELETE FROM `creature_addon` WHERE `guid`IN (136059,136816);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(136059,0,0,0,1,0, '40775 0'),
(136816,0,0,0,1,0, '40775 0');

DELETE FROM creature WHERE id=34071;
DELETE FROM vehicle_accessory WHERE entry=33432;
INSERT INTO vehicle_accessory VALUE (33432,34071,7,1, 'Leviathan Mk II turret');
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`,`bounding_radius`,`combat_reach`,`gender`,`modelid_other_gender`) VALUES
(28831,0.5,7,2,0);

-- Scriptnames
UPDATE `creature_template` SET `ScriptName`= 'mob_pre_phase' WHERE `entry` IN (32882,32908,32885,33110);
UPDATE `creature_template` SET `ScriptName`= 'mob_arena_phase' WHERE `entry` IN (32876,32904,32878,32877,32874,32875);
UPDATE `creature_template` SET `ScriptName`= 'boss_thorim' WHERE `entry`=32865;
UPDATE `creature_template` SET `ScriptName`= 'mob_runic_colossus' WHERE `entry`=32872;
UPDATE `creature_template` SET `ScriptName`= 'mob_rune_giant' WHERE `entry`=32873;
UPDATE `creature_template` SET `ScriptName`= 'thorim_trap_bunny' WHERE `entry` IN (33725,33282);
UPDATE `creature_template` SET `ScriptName`= 'thorim_energy_source' WHERE `entry`=32892;
UPDATE `creature_template` SET `ScriptName`= '' WHERE `entry`=33725;
UPDATE `creature_template` SET `ScriptName`= 'thorim_phase_trigger' WHERE `entry`=32892;
UPDATE `creature_template` SET `ScriptName`='npc_sif' WHERE `entry`=33196;
UPDATE creature_template SET ScriptName='boss_mimiron' WHERE entry=33350;
UPDATE creature_template SET ScriptName='boss_leviathan_mk' WHERE entry=33432;
UPDATE creature_template SET ScriptName='boss_leviathan_mk_turret' WHERE entry=34071;
UPDATE creature_template SET ScriptName='mob_proximity_mine' WHERE entry=34362;






