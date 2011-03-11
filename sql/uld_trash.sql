-- ---------------------------
-- ulduar trash 
-- ---------------------------

-- ulduar_evenai
-- Runeforged Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `AIName` = 'EventAI' WHERE `entry` = 34234;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34234);
REPLACE INTO `creature_ai_scripts` VALUES 
(3423401, 34234, 0, 0, 100, 3, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Flaming Rune 10'),
(3423402, 34234, 0, 0, 100, 5, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Flaming Rune 25'),
(3423403, 34234, 0, 0, 100, 3, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Lava Burst 10'),
(3423404, 34234, 0, 0, 100, 5, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Lava Burst 25'),
(3423405, 34234, 0, 0, 100, 3, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Runed Flame Jets 10'),
(3423406, 34234, 0, 0, 100, 5, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Runed Flame Jets 25');

-- Steelforged Defender
UPDATE `creature_template` SET `spell1` = 62845, `spell2` = 57780, `spell3` = 50370, `AIName` = 'EventAI' WHERE `entry` = 33236;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (33236, 33838);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33236);
REPLACE INTO `creature_ai_scripts` VALUES 
(3323601, 33236, 0, 0, 100, 3, 4000, 6000, 15000, 20000, 11, 62845, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Hamstring 10'),
(3323602, 33236, 0, 0, 100, 5, 4000, 6000, 15000, 20000, 11, 62845, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Hamstring 25'),
(3323603, 33236, 0, 0, 100, 3, 0, 4000, 6000, 8000, 11, 57780, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Lightning Bolt 10'),
(3323604, 33236, 0, 0, 100, 5, 0, 4000, 6000, 8000, 11, 57780, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Lightning Bolt 25'),
(3323605, 33236, 0, 0, 100, 3, 5000, 6000, 4000, 6000, 11, 50370, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Sunder Armor 10'),
(3323606, 33236, 0, 0, 100, 5, 5000, 6000, 4000, 6000, 11, 50370, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Sunder Armor 25');

-- Mechagnome Battletank
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953, `mindmg` = 417, `maxdmg` = 582, `attackpower` = 968, `minrangedmg` = 341, `maxrangedmg` = 506, `AIName` = 'EventAI' WHERE `entry` = 34164;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34164);
REPLACE INTO `creature_ai_scripts` VALUES 
(3416401, 34164, 0, 0, 100, 3, 3000, 4000, 6000, 8000, 11, 64693, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Flame Cannon 10'),
(3416402, 34164, 0, 0, 100, 5, 3000, 4000, 6000, 8000, 11, 64693, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Flame Cannon 25'),
(3416403, 34164, 0, 0, 100, 3, 10000, 10000, 15000, 20000, 11, 64953, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Jump Attack 10'),
(3416404, 34164, 0, 0, 100, 5, 10000, 10000, 15000, 20000, 11, 64953, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Jump Attack 25');

-- Ulduar Colossus
UPDATE `creature_template` SET `spell1` = 62625, `attackpower` = 987, `AIName` = 'EventAI' WHERE `entry` = 33237;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33237);
REPLACE INTO `creature_ai_scripts` VALUES 
(3323701, 33237, 0, 0, 100, 3, 8000, 10000, 20000, 25000, 11, 62625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulduar Colossus - Cast Ground Slam 10'),
(3323702, 33237, 0, 0, 100, 5, 8000, 10000, 20000, 25000, 11, 62625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulduar Colossus - Cast Ground Slam 25');

-- invisible triggers
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33377, 33742, 34286, 33500);

-- Molten Colossus
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `attackpower` = 982, `dmg_multiplier` = 30, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34069;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34069);
REPLACE INTO `creature_ai_scripts` VALUES 
(3406901, 34069, 0, 0, 100, 3, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Earthquake 10'),
(3406902, 34069, 0, 0, 100, 5, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Earthquake 25'),
(3406903, 34069, 0, 0, 100, 3, 2000, 4000, 6000, 9000, 11, 64698, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Pyroblast 10'),
(3406904, 34069, 0, 0, 100, 5, 2000, 4000, 6000, 9000, 11, 64698, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Pyroblast 25');

-- Magma Rager
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34086;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34086);
REPLACE INTO `creature_ai_scripts` VALUES 
(3408601, 34086, 0, 0, 100, 3, 2000, 40000, 6000, 8000, 11, 64773, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Fire Blast 10'),
(3408602, 34086, 0, 0, 100, 5, 2000, 40000, 6000, 8000, 11, 64773, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Fire Blast 25'),
(3408603, 34086, 0, 0, 100, 3, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Superheated winds 10'),
(3408604, 34086, 0, 0, 100, 5, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Superheated winds 25');
UPDATE `creature_template` SET `unit_flags` = 33718790, modelid1 = 11686, modelid2 = 0, `spell1` = 64724, `AIName` = 'EventAI' WHERE `entry` = 34194;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34194);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419401, 34194, 0, 0, 100, 3, 0, 0, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Superheated Winds'),
(3419402, 34194, 0, 0, 100, 5, 0, 0, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Superheated Winds');

-- Forge Construct
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64720, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34085;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34085);
REPLACE INTO `creature_ai_scripts` VALUES 
(3408501, 34085, 0, 0, 100, 3, 8000, 12000, 10000, 15000, 11, 64719, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Charge 10'),
(3408502, 34085, 0, 0, 100, 5, 8000, 12000, 10000, 15000, 11, 64719, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Charge 25'),
(3408503, 34085, 0, 0, 100, 3, 2000, 6000, 6000, 9000, 11, 64720, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 10'),
(3408504, 34085, 0, 0, 100, 5, 2000, 6000, 6000, 9000, 11, 64721, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 25');

-- XB-488 Disposalbot
UPDATE `creature_template` SET `spell1` = 65080, `spell2` = 65084, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34273;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34273);
REPLACE INTO `creature_ai_scripts` VALUES
(3427301, 34273, 2, 0, 100, 30, 20, 0, 0, 0, 11, 65084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Self Destruct at 20% HP on 10 and 25 normal and heroic'),
(3427303, 34273, 0, 0, 100, 11, 2000, 6000, 10000, 15000, 11, 65080, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 10 normal and heroic'),
(3427304, 34273, 0, 0, 100, 21, 2000, 6000, 10000, 15000, 11, 65104, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 25 normal and heroic');

-- Parts Recovery Technician
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554432, `AIName` = 'EventAI' WHERE `entry` = 34267;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34267);
REPLACE INTO `creature_ai_scripts` VALUES 
(3426701, 34267, 0, 0, 100, 3, 8000, 12000, 10000, 15000, 11, 65071, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Mechano Kick 10'),
(3426702, 34267, 0, 0, 100, 5, 8000, 12000, 10000, 15000, 11, 65071, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Mechano Kick 25'),
(3426703, 34267, 0, 0, 100, 3, 6000, 8000, 25000, 30000, 11, 65070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Defense Matrix 10'),
(3426704, 34267, 0, 0, 100, 5, 6000, 8000, 25000, 30000, 11, 65070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Defense Matrix 25');

-- XD-175 Compactobot
UPDATE `creature_template` SET `spell1` = 65073, `spell2` = 65106, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34271;
UPDATE `creature_template` SET `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 34269;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34271);
REPLACE INTO `creature_ai_scripts` VALUES 
(3427101, 34271, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 65073, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 10'),
(3427102, 34271, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 65106, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 25');

-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `spell1` = 64889, `spell2` = 64975, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34199;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34199);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419901, 34199, 0, 0, 100, 3, 0, 0, 10000, 15000, 11, 64889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 10'),
(3419902, 34199, 0, 0, 100, 5, 0, 0, 10000, 15000, 11, 64975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 25');

-- Hardened Iron Golem
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64874, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34190;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34190);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419001, 34190, 0, 0, 100, 3, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Harden Fists 10'),
(3419002, 34190, 0, 0, 100, 5, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Harden Fists 25'),
(3419003, 34190, 0, 0, 100, 3, 5000, 7000, 20000, 30000, 11, 64874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 10'),
(3419004, 34190, 0, 0, 100, 5, 5000, 7000, 20000, 30000, 11, 64967, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 25');

-- Iron Mender
UPDATE `creature_template` SET `spell1` = 64918, `spell2` = 64903, `spell3` = 64897, `dmg_multiplier` = 25, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34198;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34198);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419801, 34198, 0, 0, 100, 3, 2000, 4000, 4000, 6000, 11, 64918, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 10'),
(3419802, 34198, 0, 0, 100, 5, 2000, 4000, 4000, 6000, 11, 64971, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 25'),
(3419803, 34198, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 64903, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 10'),
(3419804, 34198, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 64970, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 25'),
(3419805, 34198, 0, 0, 100, 3, 10000, 25000, 30000, 45000, 11, 64897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 10'),
(3419806, 34198, 0, 0, 100, 5, 10000, 25000, 30000, 45000, 11, 64968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 25');

-- Rune Etched Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34196;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34196);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419601, 34196, 0, 0, 100, 3, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Flaming Rune 10'),
(3419602, 34196, 0, 0, 100, 5, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Flaming Rune 25'),
(3419603, 34196, 0, 0, 100, 3, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Lava Burst 10'),
(3419604, 34196, 0, 0, 100, 5, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Lava Burst 25'),
(3419605, 34196, 0, 0, 100, 3, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Runed Flame Jets 10'),
(3419606, 34196, 0, 0, 100, 5, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Runed Flame Jets 25');

-- Chamber Overseer
UPDATE `creature_template` SET `spell1` = 64820, `spell2` = 64825, `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34197;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34197);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419701, 34197, 0, 0, 100, 3, 4000, 8000, 6000, 9000, 11, 64820, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 10'),
(3419702, 34197, 0, 0, 100, 5, 4000, 8000, 6000, 9000, 11, 64943, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 25'),
(3419703, 34197, 0, 0, 100, 3, 10000, 12000, 8000, 12000, 11, 64825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 10'),
(3419704, 34197, 0, 0, 100, 5, 10000, 12000, 8000, 12000, 11, 64944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `dmg_multiplier` = 45, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33722;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33722);
REPLACE INTO `creature_ai_scripts` VALUES 
(3372201, 33722, 0, 0, 100, 3, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 10'),
(3372202, 33722, 0, 0, 100, 5, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 25'),
(3372203, 33722, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 10'),
(3372204, 33722, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `dmg_multiplier` = 45, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33699;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33699);
REPLACE INTO `creature_ai_scripts` VALUES 
(3369901, 33699, 0, 0, 100, 3, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 10'),
(3369902, 33699, 0, 0, 100, 5, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge 25'),
(3369903, 33699, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 10'),
(3369904, 33699, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning 25');

-- Champion of Hodir
UPDATE `creature_template` SET `spell1` = 64639, `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34133;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34133);
REPLACE INTO `creature_ai_scripts` VALUES 
(3413301, 34133, 0, 0, 100, 3, 3000, 6000, 12000, 16000, 11, 64639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 10'),
(3413302, 34133, 0, 0, 100, 5, 3000, 6000, 12000, 16000, 11, 64652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 25');
DELETE FROM `creature` WHERE `guid` IN (136293, 136294, 136295, 136292, 136313, 136314, 136312, 136321, 136319, 136320, 136322, 136346, 136343, 136536, 136533, 137563);

-- Winter Jormungar
UPDATE `creature_template` SET `spell1` = 64638, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34137;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34137);
REPLACE INTO `creature_ai_scripts` VALUES 
(3413701, 34137, 0, 0, 100, 3, 3000, 6000, 6000, 9000, 11, 64638, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Jormungar - Cast Acidic Bite 10'),
(3413702, 34137, 0, 0, 100, 5, 3000, 6000, 6000, 9000, 11, 64638, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Jormungar - Cast Acidic Bite 25');
UPDATE `creature` SET `spawndist` = 2 WHERE `id` = 34137;

-- Winter Revenant
UPDATE `creature_template` SET `spell1` = 64642, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34134;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34134);
REPLACE INTO `creature_ai_scripts` VALUES 
(3413401, 34134, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 64642, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 10'),
(3413402, 34134, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 64653, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 25'),
(3413403, 34134, 0, 0, 100, 3, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Whirling Strike 10'),
(3413404, 34134, 0, 0, 100, 5, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Whirling Strike 25'),
(3413405, 34134, 0, 0, 100, 3, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Shield of the Winter Revenant 10'),
(3413406, 34134, 0, 0, 100, 5, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Shield of the Winter Revenant 25');

-- Winter Rumbler
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64647, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34135;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34135);
REPLACE INTO `creature_ai_scripts` VALUES 
(3413501, 34135, 0, 0, 100, 3, 6000, 12000, 10000, 16000, 11, 64645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Cone of Cold 10'),
(3413502, 34135, 0, 0, 100, 5, 6000, 12000, 10000, 16000, 11, 64655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Cone of Cold 25'),
(3413503, 34135, 0, 0, 100, 3, 3000, 6000, 8000, 12000, 11, 64647, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 10'),
(3413504, 34135, 0, 0, 100, 5, 3000, 6000, 8000, 12000, 11, 64654, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 25');

-- Guardian Lasher
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63047, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33430;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33430);
REPLACE INTO `creature_ai_scripts` VALUES
(3343001, 33430, 4, 0, 100, 30, 0, 0, 0, 0, 11, 63007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian Pheromones 10 and 25'),
(3343003, 33430, 0, 0, 100, 31, 3000, 6000, 10000, 14000, 11, 63047, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian''s Lash 10 and 25');

-- Forest Swarmer
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33431;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33431);
REPLACE INTO `creature_ai_scripts` VALUES 
(3343101, 33431, 0, 0, 100, 3, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Swarmer - Cast Pollinate 10'),
(3343102, 33431, 0, 0, 100, 5, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Swarmer - Cast Pollinate 25');
/*
DELETE FROM `spell_script_target` WHERE `entry`=63059;
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('63059','1','33430');
*/

-- Guardian of Life
UPDATE `creature_template` SET `spell1` = 63226, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 33528;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33528);
REPLACE INTO `creature_ai_scripts` VALUES 
(3352801, 33528, 0, 0, 100, 3, 3000, 9000, 15000, 20000, 11, 63226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 10'),
(3352802, 33528, 0, 0, 100, 5, 3000, 9000, 15000, 20000, 11, 63551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 25');

-- Nature's Blade
UPDATE `creature_template` SET `spell1` = 63247, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 25, `AIName` = 'EventAI' WHERE `entry` = 33527;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33527);

-- Ironroot Lasher
UPDATE `creature_template` SET `spell1` = 63240, `mingold` = 7100, `maxgold` = 7600, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 33526;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33526);
REPLACE INTO `creature_ai_scripts` VALUES 
(3352601, 33526, 0, 0, 100, 3, 3000, 8000, 12000, 16000, 11, 63240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 10'),
(3352602, 33526, 0, 0, 100, 5, 3000, 8000, 12000, 16000, 11, 63553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 25');

-- Mangrove Ent
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63242, `spell3` = 63241, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33525;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33525);
REPLACE INTO `creature_ai_scripts` VALUES 
(3352501, 33525, 0, 0, 100, 3, 8000, 12000, 25000, 30000, 11, 63272, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Hurricane 10'),
(3352502, 33525, 0, 0, 100, 5, 8000, 12000, 25000, 30000, 11, 63272, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Hurricane 25'),
(3352503, 33525, 0, 0, 100, 3, 12000, 16000, 12000, 16000, 11, 63242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 10'),
(3352504, 33525, 0, 0, 100, 5, 12000, 16000, 12000, 16000, 11, 63556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 25'),
(3352505, 33525, 0, 0, 100, 3, 25000, 30000, 25000, 30000, 11, 63241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 10'),
(3352506, 33525, 0, 0, 100, 5, 25000, 30000, 25000, 30000, 11, 63554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 25');

-- Misguided Nymph
UPDATE `creature_template` SET `spell1` = 63082, `spell2` = 63111, `spell3` = 63136, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33355;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33355);
REPLACE INTO `creature_ai_scripts` VALUES 
(3335501, 33355, 0, 0, 100, 3, 8000, 12000, 25000, 30000, 11, 63082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 10'),
(3335502, 33355, 0, 0, 100, 5, 8000, 12000, 25000, 30000, 11, 63559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 25'),
(3335503, 33355, 0, 0, 100, 3, 4000, 6000, 12000, 16000, 11, 63111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 10'),
(3335504, 33355, 0, 0, 100, 5, 4000, 6000, 12000, 16000, 11, 63562, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 25'),
(3335505, 33355, 0, 0, 100, 3, 15000, 20000, 15000, 20000, 11, 63136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 10'),
(3335506, 33355, 0, 0, 100, 5, 15000, 20000, 15000, 20000, 11, 63564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 25');

-- Corrupted Servitor
UPDATE `creature_template` SET `spell1` = 63169, `spell2` = 63149, `dmg_multiplier` = 25, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33354;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33354);
REPLACE INTO `creature_ai_scripts` VALUES 
(3335401, 33354, 0, 0, 100, 3, 2000, 4000, 20000, 25000, 11, 63169, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Petrify Joints 10'),
(3335402, 33354, 0, 0, 100, 5, 2000, 4000, 20000, 25000, 11, 63549, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Petrify Joints 25'),
(3335403, 33354, 0, 0, 100, 3, 6000, 8000, 12000, 16000, 11, 63149, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Violent Earth 10'),
(3335404, 33354, 0, 0, 100, 5, 6000, 8000, 12000, 16000, 11, 63149, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Violent Earth 25');

-- Dark Rune
UPDATE `creature_template` SET `dmg_multiplier` = 55, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` IN (33754, 33755);

-- Freya's Elders
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33406, 33575);
UPDATE `creature_template` SET `dmg_multiplier` = 45, `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32913, 32915, 32914);

-- Arachnopod Destroyer
UPDATE `creature_template` SET `spell1` = 64717, `spell2` = 64776, `dmg_multiplier` = 30, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34183;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34183);
REPLACE INTO `creature_ai_scripts` VALUES 
(3418301, 34183, 0, 0, 100, 3, 2000, 4000, 12000, 16000, 11, 64717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Flame Spray 10'),
(3418302, 34183, 0, 0, 100, 5, 2000, 4000, 12000, 16000, 11, 64717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Flame Spray 25'),
(3418303, 34183, 0, 0, 100, 3, 8000, 10000, 12000, 16000, 11, 64776, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Machine Gun 10'),
(3418304, 34183, 0, 0, 100, 5, 8000, 10000, 12000, 16000, 11, 64776, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Machine Gun 25');

-- Clockwork Mechanic
UPDATE `creature_template` SET `dmg_multiplier` = 20, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 34184;

-- Trash
UPDATE `creature_template` SET `dmg_multiplier` = 10 WHERE `entry` = 34191;

-- Boomer XP-500
UPDATE `creature_template` SET `spell1` = 55714, `dmg_multiplier` = 15, `AIName` = 'EventAI' WHERE `entry` = 34192;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34192);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419201, 34192, 9, 0, 100, 3, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boomer XP-500 - Explode 10'),
(3419202, 34192, 9, 0, 100, 5, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boomer XP-500 - Explode 25');

-- Clockwork Sapper
UPDATE `creature_template` SET `spell1` = 64740, `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `dmg_multiplier` = 20, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34193;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34193);
REPLACE INTO `creature_ai_scripts` VALUES 
(3419301, 34193, 0, 0, 100, 3, 2000, 6000, 12000, 16000, 11, 64740, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clockwork Sapper - Cast Energy Sap 10'),
(3419302, 34193, 0, 0, 100, 5, 2000, 6000, 12000, 16000, 11, 64740, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clockwork Sapper - Cast Energy Sap 25');

-- Twilight Adherent
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33818;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33818);
REPLACE INTO `creature_ai_scripts` VALUES 
(3381801, 33818, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Arcane Burst 10'),
(3381802, 33818, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Arcane Burst 25'),
(3381803, 33818, 0, 0, 100, 3, 18000, 24000, 20000, 24000, 11, 63760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Greater Heal 10'),
(3381804, 33818, 0, 0, 100, 5, 18000, 24000, 20000, 24000, 11, 63760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Greater Heal 25'),
(3381805, 33818, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 13704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Psychic Scream 10'),
(3381806, 33818, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 13704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Psychic Scream 25');

-- Twilight Guardian
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `dmg_multiplier` = 40, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33822;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33822);
REPLACE INTO `creature_ai_scripts` VALUES 
(3382201, 33822, 0, 0, 100, 3, 6000, 10000, 8000, 10000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Concussion Blow 10'),
(3382202, 33822, 0, 0, 100, 5, 6000, 10000, 8000, 10000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Concussion Blow 25'),
(3382203, 33822, 0, 0, 100, 3, 2000, 3000, 3000, 6000, 11, 62317, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Devastate 10'),
(3382204, 33822, 0, 0, 100, 5, 2000, 3000, 3000, 6000, 11, 62317, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Devastate 25'),
(3382205, 33822, 0, 0, 100, 3, 16000, 18000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Thunderclap 10'),
(3382206, 33822, 0, 0, 100, 5, 16000, 18000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Thunderclap 25');

-- Twilight Shadowblade
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513,  `equipment_id` = 1862, `dmg_multiplier` = 25, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33824;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33824);
REPLACE INTO `creature_ai_scripts` VALUES 
(3382401, 33824, 0, 0, 100, 3, 6000, 8000, 14000, 16000, 11, 63753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Shadowblade - Cast Fan of Knives 10'),
(3382402, 33824, 0, 0, 100, 5, 6000, 8000, 14000, 16000, 11, 63753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Shadowblade - Cast Fan of Knives 25');

-- Twilight Slayer
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `dmg_multiplier` = 50, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33823;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33823);
REPLACE INTO `creature_ai_scripts` VALUES 
(3382301, 33823, 0, 0, 100, 3, 3000, 5000, 16000, 20000, 11, 35054, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Mortal Strike 10'),
(3382302, 33823, 0, 0, 100, 5, 3000, 5000, 8000, 10000, 11, 35054, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Mortal Strike 25'),
(3382303, 33823, 0, 0, 100, 3, 9000, 12000, 28000, 34000, 11, 63784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Bladestorm 10'),
(3382304, 33823, 0, 0, 100, 5, 9000, 12000, 28000, 34000, 11, 63784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Bladestorm 25');

UPDATE `creature_template` SET `mindmg` = 464, `maxdmg` = 604, `attackpower` = 708, `minrangedmg` = 353, `maxrangedmg` = 512, `rangedattackpower` = 112 WHERE `entry` IN (33818, 33822, 33823, 33824, 33772, 33819, 33820, 33838);
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 32908;

-- Faceless Horror
UPDATE `creature_template` SET `spell1` = 64429, `spell2` = 63722, `spell3` = 63710, `spell4` = 63703, `mechanic_immune_mask` = 33554513, `dmg_multiplier` = 65, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33772;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33772);
REPLACE INTO `creature_ai_scripts` VALUES 
(3377201, 33772, 0, 0, 100, 31, 18000, 22000, 15000, 20000, 11, 64429, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Death Grip 10 and 25'),
(3377203, 33772, 0, 0, 100, 31, 2000, 4000, 10000, 12000, 11, 63722, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Shadow Crash 10 and 25'),
(3377205, 33772, 4, 0, 100, 30, 0, 0, 0, 0, 11, 63703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Void Wave 10 and 25');

-- Twilight Frost Mage
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33819;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33819);
REPLACE INTO `creature_ai_scripts` VALUES 
(3381901, 33819, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Arcane Burst 10'),
(3381902, 33819, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Arcane Burst 25'),
(3381903, 33819, 0, 0, 100, 3, 1000, 2000, 6000, 8000, 11, 63913, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frostbolt 10'),
(3381904, 33819, 0, 0, 100, 5, 1000, 2000, 6000, 8000, 11, 63913, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frostbolt 25'),
(3381905, 33819, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 63758, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Bolt Volley 10'),
(3381906, 33819, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 63758, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Bolt Volley 25'),
(3381907, 33819, 0, 0, 100, 3, 8000, 10000, 12000, 16000, 11, 63912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Nova 10'),
(3381908, 33819, 0, 0, 100, 5, 8000, 10000, 12000, 16000, 11, 63912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Nova 25');

-- Twilight Pyromancer
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63789, `spell3` = 63775, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `dmg_multiplier` = 20, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33820;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33820);
REPLACE INTO `creature_ai_scripts` VALUES 
(3382001, 33820, 0, 0, 100, 3, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Arcane Burst 10'),
(3382002, 33820, 0, 0, 100, 5, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Arcane Burst 25'),
(3382003, 33820, 0, 0, 100, 3, 1000, 2000, 6000, 8000, 11, 63789, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Fireball 10'),
(3382004, 33820, 0, 0, 100, 5, 1000, 2000, 6000, 8000, 11, 63789, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Fireball 25'),
(3382005, 33820, 0, 0, 100, 3, 2000, 4000, 10000, 16000, 11, 63775, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Flamestrike 10'),
(3382006, 33820, 0, 0, 100, 5, 2000, 4000, 10000, 16000, 11, 63775, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Flamestrike 25');

-- Enslaved Fire Elemental
UPDATE `creature_template` SET `spell1` = 38064, `spell2` = 63778, `mechanic_immune_mask` = 33554513, `dmg_multiplier` = 15, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33838;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33838);
REPLACE INTO `creature_ai_scripts` VALUES
(3383801, 33838, 0, 0, 100, 31, 4000, 8000, 12000, 14000, 11, 38064, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Blast Wave 10 and 25'),
(3383803, 33838, 4, 0, 100, 30, 0, 0, 0, 0, 11, 63778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Fire Shield 10 and 25 normal and heroic');

