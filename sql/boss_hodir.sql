-- Hodir
-- WDB/Sniff
UPDATE `creature_template` SET `unit_flags`=0,`type_flags`=0 WHERE `entry`=32845;
UPDATE `creature_template` SET `modelid1`=11686,`modelid2`=0 WHERE `entry` IN (34188,33632,33802,34096,34098);
UPDATE `creature_template` SET `modelid1`=25865,`modelid2`=0,`flags_extra`=0 WHERE `entry`=32938;
UPDATE `creature_template` SET `modelid1`=28470,`modelid2`=0 WHERE `entry`=33169;
UPDATE `creature_template` SET `modelid1`=28470,`modelid2`=0 WHERE `entry`=33173;
UPDATE `creature_template` SET `modelid1`=15880,`modelid2`=0 WHERE `entry`=33174;
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=194173;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33817094 WHERE `entry`=33174;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=32941;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33686016,`flags_extra`=2 WHERE `entry`=30298;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|393220 WHERE `entry`=32938;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33948166 WHERE `entry`=33174;
UPDATE `creature_template` SET `faction_A`=1665,`faction_H`=1665,`unit_flags`=`unit_flags`|32768 WHERE `entry` IN (33325,32901,33328,32901,32893,33327,32897,33326,32941,33333,33332,32950,33331,32946,32948,33330);
UPDATE `creature_template` SET `modelid1`=15880,`modelid2`=0 WHERE `entry`=33342;

-- Other Updates
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|612581215 WHERE `entry`=32938;
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|650854235 WHERE `entry` IN (33113,33118,33186,33293,32867,32927,32930,33515,32906,32845,33350,32865,33271,33288,32871);
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|617299547 WHERE `entry`=32857;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=61990;
INSERT INTO `spell_linked_spell` VALUES 
(61990, -62457, 2, "Ice Shards Immunity (Hodir)"),
(61990, -65370, 2, "Ice Shards Immunity (Hodir)");
DELETE FROM `creature` WHERE `id` IN (32941,33333,33332,32950,33331,32946,32948,33330,32938);

UPDATE `script_texts` SET `content_default`="Welcome, champions! All of our attempts at grounding her have failed. We could use a hand in bring her down with these harpoon guns.", `type`=0  WHERE `entry`=-1603260;
UPDATE `script_texts` SET `content_default`="Move! Quickly! She won’t remain grounded for long.", `type`=1  WHERE `entry`=-1603261;
UPDATE `script_texts` SET `type`=2 WHERE `entry`=-1603053;
UPDATE `script_texts` SET `type`=2 WHERE `entry`=-1603214;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61990,-61990);
INSERT INTO `spell_linked_spell` VALUES 
(61990,7940,2, "Hodir Flash Freeze immunity");

-- Scriptnames
UPDATE `creature_template` SET `ScriptName`= 'boss_hodir' WHERE `entry`=32845;
UPDATE `creature_template` SET `ScriptName`= 'mob_flash_freeze' WHERE `entry`=32938;
UPDATE `creature_template` SET `ScriptName`= 'mob_icicle' WHERE `entry`=33169;
UPDATE `creature_template` SET `ScriptName`= 'mob_icicle_snowdrift' WHERE `entry`=33173;
UPDATE `creature_template` SET `ScriptName`= '' WHERE `entry`=32938;
UPDATE `creature_template` SET `ScriptName`= 'toasty_fire' WHERE `entry`=33342;
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_priest' WHERE `entry` IN (32897,33326,32948,33330);
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_shaman' WHERE `entry` IN (33328,32901,33332,32950);
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_druid' WHERE `entry` IN (33325,32900,32941,33333);
UPDATE `creature_template` SET `ScriptName`= 'mob_hodir_mage' WHERE `entry` IN (32893,33327,33331,32946);




