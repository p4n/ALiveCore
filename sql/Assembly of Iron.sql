-- Assembly of Iron
-- Sniff/WDB Data:
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry` IN (33051,33691,33689);
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=33705;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`difficulty_entry_1`=33689 WHERE `entry`=32958;
UPDATE `creature_model_info` SET `bounding_radius`=0.45,`combat_reach`=25 WHERE `modelid`=28313;
UPDATE `creature_model_info` SET `bounding_radius`=0.45,`combat_reach`=6 WHERE `modelid`=28344;

-- Other Updates:
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|617299547 WHERE `entry`=32857;
UPDATE `creature_template` SET `dmg_multiplier`=60 WHERE `entry`=32867;
UPDATE `creature_template` SET `dmg_multiplier`=45 WHERE `entry`=32927;

-- Scriptnames
UPDATE `creature_template` SET `ScriptName`= 'boss_steelbreaker' WHERE `entry` = 32867;
UPDATE `creature_template` SET `ScriptName`= 'boss_runemaster_molgeim' WHERE `entry` = 32927;
UPDATE `creature_template` SET `ScriptName`= 'boss_stormcaller_brundir' WHERE `entry` = 32857;
UPDATE `creature_template` SET `ScriptName`= 'mob_lightning_elemental' WHERE entry = 33705;
UPDATE `creature_template` SET `ScriptName`= 'mob_rune_of_power' WHERE entry = 32958;
