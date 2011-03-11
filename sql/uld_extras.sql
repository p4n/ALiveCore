-- 8436_dalaran_teleporter
UPDATE `gameobject_template` SET `type` = 22, `data0` = 53141, `data2` = 1, `data3` = 1 WHERE `entry` = 194481;

-- achievements
-- achievement_antechamber
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10578, 10579, 10580, 10581);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(10578, 12, 0, 0),
(10580, 12, 0, 0),
(10579, 12, 1, 0),
(10581, 12, 1, 0);

-- achievement_keepers
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10559, 10444, 10563, 10455, 10558, 10438, 10561, 10454, 10408, 10560, 10453, 10562);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Freya
(10559, 12, 0, 0),
(10444, 12, 0, 0),
(10563, 12, 1, 0),
(10455, 12, 1, 0),
-- Thorim
(10558, 12, 0, 0),
(10438, 12, 0, 0),
(10561, 12, 1, 0),
(10454, 12, 1, 0),
-- Hodir
(10408, 12, 0, 0),
(10560, 12, 0, 0),
(10453, 12, 1, 0),
(10562, 12, 1, 0);


-- vehicle_regen
-- Ulduar vehicle regen and Freya's Healthy Spores
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 33215;
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` IN (33060, 33062, 33109);


-- Keepers images(Yogg Saron Encounter)
DELETE FROM `creature` WHERE `id` IN (33410, 33411, 33412, 33413);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33410, 603, 1, 1, 0, 0, 2036.739, 25.464, 338.296, 3.814, 604800, 0, 0, 14433075, 0, 0, 0),
(33411, 603, 1, 1, 0, 0, 1939.094, -90.699, 338.296, 1.026, 604800, 0, 0, 14433075, 0, 0, 0),
(33412, 603, 1, 1, 0, 0, 1939.094, 42.534, 338.296, 5.321, 604800, 0, 0, 14433075, 0, 0, 0),
(33413, 603, 1, 1, 0, 0, 2036.739, -73.705, 338.296, 2.435, 604800, 0, 0, 14433075, 0, 0, 0);

/*-- .tele Uld (teleporta davanti Ulduar)
DELETE FROM `game_tele` WHERE `name` = "Uld";
INSERT INTO `game_tele` VALUES
(NULL, 9347.78, -1114.88, 1245.09, 6.278, 571, 'Uld');*/

-- Salvaged Chopper has no heroic entry
UPDATE `creature_template` SET `difficulty_entry_1` = 0 WHERE `entry` = 33062;




-- ---------------------------------------------------------------------------
-- ------------
-- Steelbreaker
-- ------------
-- http://www.wowhead.com/npc=32867#drops:mode=normal10
-- Normal (10P)
-- Fix drops and rates adding some miss drops
DELETE FROM `creature_loot_template` WHERE (`entry`=32867);
REPLACE INTO `creature_loot_template` VALUES 
(32867, 45506, 100, 1, 0, 1, 1),
(32867, 47241, 100, 1, 0, 1, 1),
(32867, 45330, 20, 1, 1, 1, 1),
(32867, 45418, 20, 1, 1, 1, 1),
(32867, 45324, 20, 1, 1, 1, 1),
(32867, 45423, 20, 1, 1, 1, 1),
(32867, 45332, 20, 1, 1, 1, 1),
(32867, 45333, 20, 1, 2, 1, 1),
(32867, 45378, 20, 1, 2, 1, 1),
(32867, 45329, 20, 1, 2, 1, 1),
(32867, 45322, 20, 1, 2, 1, 1),
(32867, 45331, 20, 1, 2, 1, 1),
(32867, 45455, 20, 1, 3, 1, 1),
(32867, 45456, 20, 1, 3, 1, 1),
(32867, 45448, 20, 1, 3, 1, 1),
(32867, 45449, 20, 1, 3, 1, 1),
(32867, 45447, 20, 1, 3, 1, 1);

-- Steelbreaker
-- http://www.wowhead.com/npc=32867#drops:mode=normal25:0+1-15
-- Normal (25P) 
-- Fix drops and rates including formulas on drop
DELETE FROM `creature_loot_template` WHERE (`entry`=33693);
REPLACE INTO `creature_loot_template` VALUES 
(33693, 45089, 1.3, 1, 0, -45089, 1),
(33693, 45857, 100, 1, 0, 1, 1),
(33693, 47241, 100, 1, 0, 1, 1),
(33693, 45038, 10, 1, 0, 1, 1),
(33693, 45087, 33, 1, 0, 1, 3),
(33693, 45193, 20, 1, 1, 1, 1),
(33693, 45227, 20, 1, 1, 1, 1),
(33693, 45240, 20, 1, 1, 1, 1),
(33693, 45232, 20, 1, 1, 1, 1),
(33693, 45225, 20, 1, 1, 1, 1),
(33693, 45226, 20, 1, 2, 1, 1),
(33693, 45238, 20, 1, 2, 1, 1),
(33693, 45237, 20, 1, 2, 1, 1),
(33693, 45235, 20, 1, 2, 1, 1),
(33693, 45239, 20, 1, 2, 1, 1),
(33693, 45224, 20, 1, 3, 1, 1),
(33693, 45228, 20, 1, 3, 1, 1),
(33693, 45234, 20, 1, 3, 1, 1),
(33693, 45233, 20, 1, 3, 1, 1),
(33693, 45236, 20, 1, 3, 1, 1),
(33693, 45241, 16.666, 1, 4, 1, 1),
(33693, 45242, 16.666, 1, 4, 1, 1),
(33693, 45607, 16.666, 1, 4, 1, 1),
(33693, 45244, 16.666, 1, 4, 1, 1),
(33693, 45243, 16.666, 1, 4, 1, 1),
(33693, 45245, 16.666, 1, 4, 1, 1),
(33693, 46027, 1.3, 1, 5, 1, 1),
(33693, 46348, 1.3, 1, 5, 1, 1);

-- ---------------------------------------------------------------------------------
-- --------
-- Auriaya
-- --------
-- http://www.wowhead.com/npc=33515#drops:mode=normal10:0+1-15
-- Normal (10P)
-- Fix drops and rates deleting some drops form 25P including on 10P
DELETE FROM `creature_loot_template` WHERE (`entry`=33515);
REPLACE INTO `creature_loot_template` VALUES 
(33515, 47241, 100, 1, 0, 1, 1),
(33515, 45708, 20, 1, 1, 1, 1),
(33515, 45712, 20, 1, 1, 1, 1),
(33515, 45713, 20, 1, 1, 1, 1),
(33515, 45864, 20, 1, 1, 1, 1),
(33515, 45865, 20, 1, 1, 1, 1),
(33515, 45707, 20, 1, 2, 1, 1),
(33515, 45709, 20, 1, 2, 1, 1),
(33515, 45711, 20, 1, 2, 1, 1),
(33515, 45832, 20, 1, 2, 1, 1),
(33515, 45866, 20, 1, 2, 1, 1);

-- Auriaya
-- http://www.wowhead.com/npc=33515#drops:mode=normal25:0+1-15
-- Normal (25P)
-- Fix drops and rates miss some items includind on SQL
DELETE FROM `creature_loot_template` WHERE (`entry`=34175);
REPLACE INTO `creature_loot_template` VALUES 
(34175, 47241, 100, 1, 0, 1, 1),
(34175, 45038, 10, 1, 0, 1, 1),
(34175, 45089, 1.3, 1, 0, -45089, 1),
(34175, 45087, 33, 1, 0, 1, 1),
(34175, 45440, 20, 1, 1, 1, 1),
(34175, 45434, 20, 1, 1, 1, 1),
(34175, 45436, 20, 1, 1, 1, 1),
(34175, 45320, 20, 1, 1, 1, 1),
(34175, 45439, 20, 1, 1, 1, 1),
(34175, 45319, 20, 1, 2, 1, 1),
(34175, 45325, 20, 1, 2, 1, 1),
(34175, 45326, 20, 1, 2, 1, 1),
(34175, 45438, 20, 1, 2, 1, 1),
(34175, 45441, 20, 1, 2, 1, 1),
(34175, 45435, 20, 1, 3, 1, 1),
(34175, 45437, 20, 1, 3, 1, 1),
(34175, 45327, 20, 1, 3, 1, 1),
(34175, 45315, 20, 1, 3, 1, 1),
(34175, 45334, 20, 1, 3, 1, 1);

-- ---------------------------------------------------------------------------------
-- --------
-- General Vezax
-- --------
-- http://www.wowhead.com/npc=33271#drops:mode=normal10:0+1-16
-- Normal (10P)
-- Fix drops and rates deleting some drops form 25P including on 10P
DELETE FROM `creature_loot_template` WHERE (`entry`=33271);
REPLACE INTO `creature_loot_template` VALUES 
(33271, 47241, 100, 1, 0, 1, 1),
(33271, 46035, 12.5, 1, 1, 1, 1),
(33271, 46009, 12.5, 1, 1, 1, 1),
(33271, 46008, 12.5, 1, 1, 1, 1),
(33271, 46010, 12.5, 1, 1, 1, 1),
(33271, 46032, 12.5, 1, 1, 1, 1),
(33271, 45997, 12.5, 1, 1, 1, 1),
(33271, 45996, 12.5, 1, 1, 1, 1),
(33271, 46034, 12.5, 1, 1, 1, 1),
(33271, 46015, 14.285, 1, 2, 1, 1),
(33271, 46014, 14.285, 1, 2, 1, 1),
(33271, 46011, 14.285, 1, 2, 1, 1),
(33271, 46033, 14.285, 1, 2, 1, 1),
(33271, 46013, 14.285, 1, 2, 1, 1),
(33271, 46012, 14.285, 1, 2, 1, 1),
(33271, 46036, 14.285, 1, 2, 1, 1);

-- General Vezax
-- http://www.wowhead.com/npc=33271#drops:mode=normal25:0+1-16
-- Normal (25P)
-- Fix drops and rates miss some items includind on SQL
DELETE FROM `creature_loot_template` WHERE (`entry`=33449);
REPLACE INTO `creature_loot_template` VALUES 
(33449, 47241, 100, 1, 0, 1, 1), -- Emblem of Triumph
(33449, 45038, 10, 1, 0, 1, 1), -- Fragment of Val'anyr
(33449, 45087, 33, 1, 0, 1, 1), -- Runed Orb
(33449, 45505, 16.666, 1, 1, 1, 1),
(33449, 45513, 16.666, 1, 1, 1, 1),
(33449, 45501, 16.666, 1, 1, 1, 1),
(33449, 45504, 16.666, 1, 1, 1, 1),
(33449, 45518, 16.666, 1, 1, 1, 1),
(33449, 45512, 16.666, 1, 1, 1, 1),
(33449, 45520, 16.666, 1, 2, 1, 1),
(33449, 45502, 16.666, 1, 2, 1, 1),
(33449, 45509, 16.666, 1, 2, 1, 1),
(33449, 45145, 16.666, 1, 2, 1, 1),
(33449, 45498, 16.666, 1, 2, 1, 1),
(33449, 45514, 16.666, 1, 2, 1, 1),
(33449, 45503, 14.285, 1, 3, 1, 1),
(33449, 45517, 14.285, 1, 3, 1, 1),
(33449, 45515, 14.285, 1, 3, 1, 1),
(33449, 45511, 14.285, 1, 3, 1, 1),
(33449, 45507, 14.285, 1, 3, 1, 1),
(33449, 45519, 14.285, 1, 3, 1, 1),
(33449, 45516, 14.285, 1, 3, 1, 1),
(33449, 45089, 1.3, 1, 0, -45089, 1);

-- ---------------------------------------------------------------------------------
-- ----------
-- Yogg-Saron
-- ----------

-- http://www.wowhead.com/npc=33288#drops:mode=normal10
-- Normal (10P)
-- Miss lots of drops (like 17 itms no on list)
DELETE FROM `creature_loot_template` WHERE (`entry`=33288);
REPLACE INTO `creature_loot_template` VALUES 
(33288, 45087, 25, 1, 0, 1, 3), -- Runed Orb
(33288, 47241, 100, 1, 0, 1, 2), -- Emblem of Triumph
(33288, 46018, 12.5, 1, 1, 1, 1),
(33288, 46028, 12.5, 1, 1, 1, 1),
(33288, 46021, 12.5, 1, 1, 1, 1),
(33288, 46031, 12.5, 1, 1, 1, 1),
(33288, 46016, 12.5, 1, 1, 1, 1),
(33288, 46025, 12.5, 1, 1, 1, 1),
(33288, 46030, 12.5, 1, 1, 1, 1),
(33288, 46024, 12.5, 1, 1, 1, 1),
(33288, 46019, 12.5, 1, 2, 1, 1),
(33288, 46022, 12.5, 1, 2, 1, 1),
(33288, 46097, 12.5, 1, 2, 1, 1),
(33288, 46096, 12.5, 1, 2, 1, 1),
(33288, 46068, 12.5, 1, 2, 1, 1),
(33288, 46067, 12.5, 1, 2, 1, 1),
(33288, 46312, 12.5, 1, 2, 1, 1),
(33288, 46095, 12.5, 1, 2, 1, 1),
(33288, 45104, 53.2, 1, 0, -45481, 1), -- Armor TIER
(33288, 45102, 1.4, 1, 0, -45089, 1); -- Recipies

-- Yogg-Saron
-- http://www.wowhead.com/npc=33288#drops:mode=normal25
-- Normal (25P)
-- Miss lots of drops (like 17 itms no on list)
DELETE FROM `creature_loot_template` WHERE (`entry`=33955);
REPLACE INTO `creature_loot_template` VALUES 
(33955, 45087, 25, 1, 0, 1, 3), -- Runed Orb
(33955, 47241, 100, 1, 0, 2, 2), -- Emblem of Triumph
(33955, 45897, 1.8, 1, 0, 1, 1), -- Reforged Hammer of Ancient Kings
(33955, 45532, 12.5, 1, 1, 1, 1),
(33955, 45529, 12.5, 1, 1, 1, 1),
(33955, 45522, 12.5, 1, 1, 1, 1),
(33955, 45523, 12.5, 1, 1, 1, 1),
(33955, 45531, 12.5, 1, 1, 1, 1),
(33955, 45521, 12.5, 1, 1, 1, 1),
(33955, 45525, 12.5, 1, 1, 1, 1),
(33955, 45530, 12.5, 1, 1, 1, 1),
(33955, 45524, 12.5, 1, 2, 1, 1),
(33955, 45527, 12.5, 1, 2, 1, 1),
(33955, 45693, 12.5, 1, 2, 1, 1),
(33955, 45534, 12.5, 1, 2, 1, 1),
(33955, 45537, 12.5, 1, 2, 1, 1),
(33955, 45533, 12.5, 1, 2, 1, 1),
(33955, 45536, 12.5, 1, 2, 1, 1),
(33955, 45535, 12.5, 1, 2, 1, 1),
(33955, 45104, 53.2, 1, 0, -33955, 1), -- Armor TIER
(33955, 45102, 1.4, 1, 0, -45089, 1); -- Recipies

-- ----------------------------------------------------------------------------------
-- References for the need drops
-- All bosses from Ulduar got the same reference items only a few hace to references
-- ----------------------------------------------------------------------------------

-- Redone ref 
DELETE FROM `reference_loot_template` WHERE `entry`='45089';
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('45089','45100','0','1','1','1','1'),
('45089','45094','0','1','1','1','1'),
('45089','45096','0','1','1','1','1'),
('45089','45095','0','1','1','1','1'),
('45089','45101','0','1','1','1','1'),
('45089','45104','0','1','1','1','1'),
('45089','45098','0','1','1','1','1'),
('45089','45099','0','1','1','1','1'),
('45089','45097','0','1','1','1','1'),
('45089','45102','0','1','1','1','1'),
('45089','45105','0','1','1','1','1'),
('45089','45103','0','1','1','1','1'),
('45089','45089','0','1','1','1','1'),
('45089','45088','0','1','1','1','1'),
('45089','45092','0','1','1','1','1'),
('45089','45090','0','1','1','1','1'),
('45089','45093','0','1','1','1','1'),
('45089','45091','0','1','1','1','1');

-- Redone ref for TIER
DELETE FROM `reference_loot_template` WHERE `entry`='45481';
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('45481','45644','0','1','1','1','1'),
('45481','45645','0','1','1','1','1'),
('45481','45646','0','1','1','1','1');

-- Redone ref for TIER
DELETE FROM `reference_loot_template` WHERE `entry`='33955';
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('33955','45658','0','1','1','1','1'),
('33955','45657','0','1','1','1','1'),
('33955','45656','0','1','1','1','1');


-- -----------------------------------------------------
-- Some corrections from Mismouse used it if you like
-- -----------------------------------------------------
-- To help the correct kill of this bosses I give to they a new locs
-- New locs for Steelbreaker
DELETE FROM `creature` WHERE `guid`='94382';
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('94382','32867','603','3','65535','0','0','1552.15','120.145','427.277','6.20744','604800','0','0','2998175','0','0','0');

DELETE FROM `creature` WHERE `guid`='94387';
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('94387','32927','603','3','65535','0','0','1596.43','105.539','427.273','0.759136','604800','0','0','2998175','4258','0','0');

DELETE FROM `creature` WHERE `guid`='94390';
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('94390','32857','603','3','65535','0','0','1596.37','134.229','427.271','5.65217','604800','0','0','2998175','212900','0','0');

-- 8642_ulduar_hodir
UPDATE `creature_template` SET `difficulty_entry_1` = 33909, `unit_flags` = 0 WHERE `entry` = 32930;
UPDATE `creature_template` SET `ScriptName` = 'mob_snowpacked_icicle' WHERE `entry` = 33174;
-- toasty fire immunities
DELETE FROM spell_linked_spell WHERE spell_trigger=65280;
REPLACE INTO spell_linked_spell VALUES
(65280,-62469,2,'Toasty fire - Freeze imunity'),
(65280,-62039,2,'Toasty fire - Biting cold imunity');

-- 8650_mimiron_hardmode
-- Mimiron Flames
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `modelid1` = 11686, `ScriptName` = 'mob_mimiron_flame_spread' WHERE `entry` = 34121;

-- 8655_ulduar_25_stats
-- Magma Rager
UPDATE `creature_template` SET `mechanic_immune_mask` = 131072 WHERE `entry` IN (34086, 34201);
-- Robots
UPDATE `creature_template` SET `mechanic_immune_mask` = 8405008 WHERE `entry` IN (34085, 34186, 34274, 34268, 34272, 34270);
-- Lightning charged dwarf
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 30, `mingold` = 14200, `maxgold` = 16200, `equipment_id` = 870, `mechanic_immune_mask` = 5 WHERE `entry` = 34237;
UPDATE `creature_template` SET `equipment_id` = 870, `mechanic_immune_mask` = 5 WHERE `entry` = 34199;
-- Hardened Iron Golem
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 35, `mingold` = 14200, `maxgold` = 16200, `mechanic_immune_mask` = 64 WHERE `entry` = 34229;
UPDATE `creature_template` SET `mechanic_immune_mask` = 64 WHERE `entry` = 34190;
-- Iron Mender
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 35, `mingold` = 14200, `maxgold` = 16200, `mechanic_immune_mask` = 1 WHERE `entry` = 34236;
UPDATE `creature_template` SET `mechanic_immune_mask` = 1 WHERE `entry` = 34198;
-- Runed Etched
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 30, `mingold` = 14200, `maxgold` = 16200, `mechanic_immune_mask` = 64 WHERE `entry` = 34245;
UPDATE `creature_template` SET `mechanic_immune_mask` = 64 WHERE `entry` = 34196;
-- Chamber Overseer
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 60, `mingold` = 14600, `maxgold` = 18200, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34226;
UPDATE `creature_template` SET `dmg_multiplier` = 45 WHERE `entry` = 34197;
-- Steelbreaker
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 90, `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33693;
-- Runemaster Molgeim
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 60, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33692;
-- Brundir
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 50, `mechanic_immune_mask` = 617299547, `flags_extra` = 1 WHERE `entry` = 33694;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33689, 33691);
-- Kologarn
UPDATE `creature_template` SET `difficulty_entry_1` = 33909, `unit_flags` = 0 WHERE `entry` = 32930;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 90, `baseattacktime` = 1800, `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `minlevel` = 83, `maxlevel` = 83, `unit_flags` = 0, `unit_class` = 1 WHERE `entry` = 33909;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32933, 32934);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 45, `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33910, 33911);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 12 WHERE `entry` = 33908;
-- Storm Tempered Keeper
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 3.2, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 65, `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 545260304 WHERE `entry` IN (33700, 33723);
-- Auriaya
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299807 WHERE `entry` = 33515;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.66667, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 90, `mingold` = 3460000, `maxgold` = 3520000, `equipment_id` = 2500, `mechanic_immune_mask` = 617299807, `flags_extra` = 1 WHERE `entry` = 34175;
-- Sanctum Sentry
UPDATE `creature_template` SET `speed_walk` = 1.66667 WHERE `entry` = 34014;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 65, `baseattacktime` = 1500, `speed_walk` = 1.66667, `flags_extra` = 1 WHERE `entry` = 34166;
-- Feral Defender
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 2, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 5, `baseattacktime` = 1500 WHERE `entry` = 34171;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33554432, modelid1 = 11686, modelid2 = 0 WHERE `entry` = 34174;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 1.5, `baseattacktime` = 1500 WHERE `entry` = 34169;
-- Champion of Hodir
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 75, `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 545267736 WHERE `entry` = 34139;
-- Winter jorm
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 2.4, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 15, `mingold` = 10500, `maxgold` = 12600 WHERE `entry` = 34140;
-- Winter revenant
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 425, `maxdmg` = 602, `attackpower` = 670, `dmg_multiplier` = 40, `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 2128 WHERE `entry` = 34141;
-- Winter Rumbler
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 425, `maxdmg` = 602, `attackpower` = 670, `dmg_multiplier` = 25, `mingold` = 10300, `maxgold` = 12000, `mechanic_immune_mask` = 33554432 WHERE `entry` = 34142;
-- Hodir
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239 WHERE `entry` = 32845;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 90, `equipment_id` = 1843, `mechanic_immune_mask` = 650854239, `flags_extra` = 1 WHERE `entry` = 32846;
-- Arachnopod
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 45, `unit_flags` = 64, `mingold` = 105000, `maxgold` = 125000, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34214;
-- Clockwork
UPDATE `creature_template` SET `unit_flags` = 64, `mingold` = 17200, `maxgold` = 17600, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34184;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 32, `mingold` = 172000, `maxgold` = 176000, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34219;
-- Boomer XP-500
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 25, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34216;
-- Trash
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `baseattacktime` = 1500, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34191;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 15, `baseattacktime` = 1500, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34217;
-- Clockwork sapper
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 30, `mingold` = 17000, `maxgold` = 18200, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34220;
-- Mimiron
-- NOTE NECESSARY INFO ALSO THIS INFO IS DELETING THE MODELID AND LOOTID, THIS IS ALREADY IN CTDB
UPDATE `creature_template` SET `ScriptName` = 'mob_mimiron_flame_spread' WHERE `entry` = 34121;
UPDATE `creature_template` SET `difficulty_entry_1` = 34114 WHERE `entry` = 33855;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10 WHERE `entry` = 34114;
UPDATE `creature_template` SET `difficulty_entry_1` = 34115 WHERE `entry` = 34057;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20 WHERE `entry` = 34115;
UPDATE `creature_template` SET `difficulty_entry_1` = 34218 WHERE `entry` = 33836;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 15 WHERE `entry` = 34218;
UPDATE `creature_template` SET `difficulty_entry_1` = 34148 WHERE `entry` = 34147;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 34148;
-- Elders
UPDATE `creature_template` SET `mingold` = 625000, `maxgold` = 665000 WHERE `entry` IN (32914, 32913);
UPDATE `creature_template` SET `difficulty_entry_1` = 33391, `mingold` = 625000, `maxgold` = 665000 WHERE `entry` = 32915;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.66666, `mindmg` = 509, `maxdmg` = 683, `attackpower` = 805, `dmg_multiplier` = 60, `mingold` = 1805000, `maxgold` = 1855000, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33393, 33392, 33391);
-- Freya trash
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 35, `mingold` = 625000, `maxgold` = 655000 WHERE `entry` = 33732;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10, `mingold` = 75000, `maxgold` = 95000 WHERE `entry` = 33731;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20, `mingold` = 125000, `maxgold` = 155000 WHERE `entry` IN (33733, 33734);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 425, `maxdmg` = 602, `attackpower` = 670, `dmg_multiplier` = 35, `mingold` = 125000, `maxgold` = 155000 WHERE `entry` IN (33741, 33729);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 425, `maxdmg` = 602, `attackpower` = 670, `dmg_multiplier` = 20, `mingold` = 125000, `maxgold` = 155000 WHERE `entry` IN (33735, 33737);
-- Freya
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.6, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 65, `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33360;
UPDATE `creature_template` SET `difficulty_entry_1` = 33402 WHERE `entry` = 33170;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33685510 WHERE `entry` = 33402;
UPDATE `creature_template` SET `difficulty_entry_1` = 33399, `flags_extra` = 256 WHERE `entry` = 32918;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `flags_extra` = 256, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10 WHERE `entry` = 33399;
UPDATE `creature_template` SET `difficulty_entry_1` = 33376, `minlevel` = 81, `maxlevel` = 81 WHERE `entry` = 33203;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 55, `mechanic_immune_mask` = 650853979 WHERE `entry` = 33376;
UPDATE `creature_template` SET `difficulty_entry_1` = 33398 WHERE `entry` = 33202;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 35 WHERE `entry` = 33398;
UPDATE `creature_template` SET `difficulty_entry_1` = 33401 WHERE `entry` = 32919;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 15 WHERE `entry` = 33401;
UPDATE `creature_template` SET `difficulty_entry_1` = 33400 WHERE `entry` = 32916;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 60 WHERE `entry` = 33400;
UPDATE `creature_template` SET `difficulty_entry_1` = 34153 WHERE `entry` = 34129;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33685508, `modelid1` = 23258, `modelid2` = 0 WHERE `entry` = 34153;
UPDATE `creature_template` SET `difficulty_entry_1` = 33385 WHERE `entry` = 33228;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 393220 WHERE `entry` = 33385;
UPDATE `creature_template` SET `difficulty_entry_1` = 33395 WHERE `entry` = 33050;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33686022, `modelid1` = 23258, `modelid2` = 0 WHERE `entry` = 33395;
-- Dark Rune Thunderer, Ravager
UPDATE `creature_template` SET `baseattacktime` = 1500, `mechanic_immune_mask` = 545259541 WHERE `entry` IN (33754, 33755);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 75, `baseattacktime` = 1500, `mingold` = 71000, `maxgold` = 76000, `equipment_id` = 870, `mechanic_immune_mask` = 545259541 WHERE `entry` = 33757;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 75, `baseattacktime` = 1500, `mingold` = 71000, `maxgold` = 76000, `equipment_id` = 1862, `mechanic_immune_mask` = 545259541 WHERE `entry` = 33758;
-- Pre Aggro adds (Thorim)
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 45 WHERE `entry` = 33154;
UPDATE `creature_template` SET `difficulty_entry_1` = 33153 WHERE `entry` = 32885;
UPDATE `creature_template` SET `difficulty_entry_1` = 33152 WHERE `entry` = 32883;
UPDATE `creature_template` SET `difficulty_entry_1` = 33150 WHERE `entry` = 32908;
UPDATE `creature_template` SET `difficulty_entry_1` = 33151 WHERE `entry` = 32907;
UPDATE `creature_template` SET `difficulty_entry_1` = 33161 WHERE `entry` = 33110;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 608, `dmg_multiplier` = 10, `equipment_id` = 1847 WHERE `entry` = 33152;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 608, `dmg_multiplier` = 10, `equipment_id` = 1849 WHERE `entry` = 33153;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 608, `dmg_multiplier` = 10, `equipment_id` = 1852 WHERE `entry` = 33151;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 608, `dmg_multiplier` = 10, `equipment_id` = 1850 WHERE `entry` = 33150;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 20 WHERE `entry` = 33161;
-- Phase 1 adds
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 20, `equipment_id` = 849 WHERE `entry` = 33158;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 10 WHERE `entry` = 33157;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 15, `equipment_id` = 1003 WHERE `entry` = 33156;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 463, `maxdmg` = 640, `attackpower` = 726, `dmg_multiplier` = 20, `baseattacktime` = 1667, `equipment_id` = 1846 WHERE `entry` = 33155;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `equipment_id` = 627 WHERE `entry` = 33162;
UPDATE `creature_template` SET `difficulty_entry_1` = 33163 WHERE `entry` = 32875;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 10, `equipment_id` = 1845 WHERE `entry` = 33163;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32872, 32873);
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 45, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33149;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `speed_walk` = 0.888888, `mindmg` = 488, `maxdmg` = 642, `attackpower` = 782, `dmg_multiplier` = 45, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33148;
-- Thorim
UPDATE `creature_template` SET `speed_walk` = 1.66667 WHERE `entry` = 32865;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 16, `speed_walk` = 1.66667, `mindmg` = 496, `maxdmg` = 674, `attackpower` = 783, `dmg_multiplier` = 80, `baseattacktime` = 1500, `minrangedmg` = 365, `maxrangedmg` = 529, `rangedattackpower` = 98, `equipment_id` = 1844, `mechanic_immune_mask` = 650854239, `flags_extra` = 1 WHERE `entry` = 33147;
-- Twilight mobs
UPDATE `creature_template` SET `mechanic_immune_mask` = 570425425, `speed_walk` = 1.33334 WHERE `entry` IN (33818, 33822, 33824, 33823);
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.33334, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1848, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33827;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.33334, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 55, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1852, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33828;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.33334, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 30, `baseattacktime` = 1000, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1862, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33831;
UPDATE `creature_template` SET `name` = 'Twilight Slayer (1)', `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `speed_walk` = 1.33334, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 65, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1847, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33832;
UPDATE `creature_template` SET `difficulty_entry_1` = 33773 WHERE `entry` = 33772;
UPDATE `creature_template` SET `name` = 'Faceless Horror (1)', `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 85, `mingold` = 76000, `maxgold` = 79000, `mechanic_immune_mask` = 33554512 WHERE `entry` = 33773;
UPDATE `creature_template` SET `name` = 'Twilight Pyromancer (1)', `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1848, `mechanic_immune_mask` = 8388625 WHERE `entry` = 33830;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 25, `mingold` = 72000, `maxgold` = 76000, `equipment_id` = 1849, `mechanic_immune_mask` = 8388625 WHERE `entry` = 33829;
UPDATE `creature_template` SET `difficulty_entry_1` = 33839 WHERE `entry` = 33838;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20, `mingold` = 41000, `maxgold` = 46000, `mechanic_immune_mask` = 8519697 WHERE `entry` = 33839;
-- General Vezax
UPDATE `creature_template` SET `mindmg` = 502, `maxdmg` = 674, `attackpower` = 853, `Health_mod` = 450 WHERE `entry` = 33271;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mindmg` = 502, `maxdmg` = 674, `attackpower` = 853, `dmg_multiplier` = 60, `baseattacktime` = 1800, `mingold` = 3450000, `maxgold` = 3750000, `Health_mod` = 1650, `mechanic_immune_mask` = 617299803, `flags_extra` = 257 WHERE `entry` = 33449;
UPDATE `creature_template` SET `difficulty_entry_1` = 33789 WHERE `entry` = 33488;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33789;
UPDATE `creature_template` SET `difficulty_entry_1` = 34152, `minlevel` = 83, `maxlevel` = 83, `faction_A` = 16, `faction_H` = 16, `Health_mod` = 113, `flags_extra` = 256 WHERE `entry` = 33524;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `faction_A` = 16, `faction_H` = 16, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 35, `Health_mod` = 675, `mechanic_immune_mask` = 650854235, `flags_extra` = 256 WHERE `entry` = 34152;

-- Sif
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `unit_flags` = 33554434 WHERE `entry` IN (33196, 33234);

-- this needs correctly updated

-- Ulduar chain
-- DELETE FROM reference_loot_template WHERE entry = 34111 AND item = 45538;

-- DELETE FROM gameobject WHERE id = 194555;
-- REPLACE INTO gameobject VALUES (NULL, 194555, 603, 3, 1, 1435.56, 118.954, 423.641, 0, 0, 0, 0, 1, 300, 0, 1);
-- DELETE FROM creature WHERE id = 33956;
-- REPLACE INTO creature VALUES (NULL, 33956, 603, 3, 1, 0, 0, 1443.61, 119.143, 423.641, 3.1675, 300, 0, 0, 75600, 0, 0, 0);
-- 
-- DELETE FROM `gameobject_loot_template` WHERE entry IN (27074, 27086) AND item IN (45784, 45787);
-- REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
-- ('27074','45784','-100','1','0','1','1','9','13610','0'),
-- ('27086','45787','-100','1','0','1','1','9','13611','0');

-- UPDATE `quest_template` SET `PrevQuestId` = 13607, `NextQuestId` = 13614, `ExclusiveGroup` = -13606, `NextQuestInChain` = 0, `QuestFlags` = 192 WHERE `entry` IN (13606, 13609, 13611, 13610);
-- UPDATE `quest_template` SET `PrevQuestId` = 13604, `SpecialFlags` = 2 WHERE `entry` = 13607;
-- DELETE FROM `areatrigger_involvedrelation` WHERE `quest` = 13607;
-- REPLACE INTO `areatrigger_involvedrelation` (`id`, `quest`) VALUES (5400, 13607);

-- DELETE FROM `item_loot_template` WHERE entry = 45875;
-- REPLACE INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- ('45875','45087','100','1','0','1','1'),
-- ('45875','45624','100','1','0','5','5');

-- Archivum Data Disc drop
-- DELETE FROM `creature_loot_template` WHERE entry IN (33692, 33693) AND item = 45857;
-- REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- ('33692','45857','100','1','0','1','1'),
-- ('33693','45857','100','1','0','1','1');*