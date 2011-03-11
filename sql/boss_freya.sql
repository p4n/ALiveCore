-- Freya
-- WDB/Sniff
UPDATE `creature_template` SET `modelid1`=11686,`modelid2`= 0,`unit_flags`=`unit_flags`|33686022 WHERE `entry`=33050;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|393220 WHERE `entry`=33228;
UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0, `unit_flags`=`unit_flags`|33685508 WHERE `entry`=34129;
UPDATE `creature_template` SET `unit_class`=2 WHERE `entry`=32918;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33686022 WHERE `entry`=33215;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33685510,`modelid1`=11686,`modelid2`=0 WHERE `entry`=33170;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`unit_flags`=`unit_flags`|393220 WHERE `entry`=33168;
UPDATE `creature_template` SET `baseattacktime`=1500 WHERE `entry`=32906;

-- Other Updates
DELETE FROM `spell_linked_spell` WHERE `spell_effect`=-62532;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(64321,-62532,1, 'Potent Pheromones ward off the Conservator''s Grip'),
(62619,-62532,1, 'Pheromones ward off the Conservator''s Grip');
DELETE FROM `spell_linked_spell` WHERE `spell_effect`=-62243;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(62217,-62243,1, 'cancels the effects of Unstable Sun Beam'),
(62922,-62243,1, 'cancels the effects of Unstable Sun Beam');

-- Whats this?? (bio asking)
-- DELETE FROM `creature` WHERE `map`=136607;

-- Scriptnames
UPDATE `creature_template` SET `ScriptName`= 'creature_unstable_sun_beam' WHERE `entry`=33050;
UPDATE `creature_template` SET `ScriptName`= 'boss_freya' WHERE `entry`=32906;
UPDATE `creature_template` SET `ScriptName`= 'creature_eonars_gift' WHERE `entry`=33228;
UPDATE `creature_template` SET `ScriptName`= 'creature_nature_bomb' WHERE `entry`=34129;
UPDATE `creature_template` SET `ScriptName`= 'creature_detonating_lasher' WHERE `entry`=32918;
UPDATE `creature_template` SET `ScriptName`= 'creature_ancient_conservator' WHERE `entry`=33203;
UPDATE `creature_template` SET `ScriptName`= 'creature_healthy_spore' WHERE `entry`=33215;
UPDATE `creature_template` SET `ScriptName`= 'creature_storm_lasher' WHERE `entry`=32919;
UPDATE `creature_template` SET `ScriptName`= 'creature_snaplasher' WHERE `entry`=32916;
UPDATE `creature_template` SET `ScriptName`= 'creature_ancient_water_spirit' WHERE `entry`=33202;
UPDATE `creature_template` SET `ScriptName`= 'boss_elder_brightleaf' WHERE `entry`=32915;
UPDATE `creature_template` SET `ScriptName`= 'boss_elder_ironbranch' WHERE `entry`=32913;
UPDATE `creature_template` SET `ScriptName`= 'boss_elder_stonebark' WHERE `entry`=32914;
UPDATE `creature_template` SET `ScriptName`= 'creature_sun_beam' WHERE `entry`=33170;
UPDATE `creature_template` SET `ScriptName`= 'creature_iron_roots' WHERE `entry`=33168;