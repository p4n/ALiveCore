UPDATE creature_template SET ScriptName = "boss_valithria" where entry = 36789;
UPDATE creature_template SET ScriptName = "npc_valithria_alternative" WHERE entry = 37950;

UPDATE creature_template SET ScriptName = "npc_icc_valithria_trigger" where entry = 38752;

UPDATE creature_template SET ScriptName = "npc_suppressor_icc" where entry = 37863;
UPDATE creature_template SET ScriptName = "npc_skellmage_icc" where entry = 37868;
UPDATE creature_template SET ScriptName = "npc_fireskell_icc" where entry = 36791;
UPDATE creature_template SET ScriptName = "npc_glutabomination_icc" where entry = 37886;
UPDATE creature_template SET ScriptName = "npc_blistzombie_icc" where entry = 37934;

UPDATE creature_template SET ScriptName = "npc_dreamportal_icc" where entry = 37945;
UPDATE creature_template SET ScriptName = "npc_dreamcloud_icc" where entry = 37985;
UPDATE creature_template SET ScriptName = "npc_manavoid_icc" where entry = 38068;
/*UPDATE creature_template SET ScriptName = "npc_icc_column_stalker" where entry = ;*/

/* Spawn alternative valithria */
DELETE FROM `creature` WHERE `id` IN(37950);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(37950,631,15,16,0,0,4203.65,2483.89,390.961,5.51524,604800,0,0,6000003,0,0,0,0,33540,8);

/* Check ScriptName for Spawns */
select entry,name,ScriptName from creature_template where entry IN(37868,37863,37985,37886,36791,37934);

/* Texte */
INSERT INTO creature_text (entry,groupid,id,text,type,language,probability,emote,sound,comment) VALUES
(36789, 0, 0, 
	'Heroes, lend me your aid! I... I cannot hold them off much longer! You must heal my wounds!', 1, 0, 0, 0, 17064,
	'Valithria Dreamwalker - SAY_AGGRO'),
(36789, 1, 0, 
	'I have opened a portal into the Emerald Dream. Your salvation lies within, heroes.', 0, 0, 0, 0, 17068,
	'Valithria Dreamwalker - SAY_OPEN_PORTAL'),
(36789, 2, 0, 
	'My strength is returning! Press on, heroes!', 0, 0, 0, 0, 17070,
	'Valithria Dreamwalker - SAY_ABOVE_75'),
(36789, 3, 0, 
	'I will not last much longer!', 0, 0, 0, 0, 17069,
	'Valithria Dreamwalker - SAY_BELOW_25'),
(36789, 4, 0, 
	'Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!', 1, 0, 0, 0, 17072,
	'Valithria Dreamwalker - SAY_DEATH'),
(36789, 5, 0, 
	'A tragic loss...', 1, 0, 0, 0, 17066,
	'Valithria Dreamwalker - SAY_PDEATH'),
(36789, 6, 0, 
	'FAILURES!', 1, 0, 0, 0, 17067,
	'Valithria Dreamwalker - SAY_BERSERK'),
(36789, 7, 0, 
	'I am renewed! Ysera grants me the favor to lay these foul creatures to rest!', 1, 0, 0, 0, 17071,
	'Valithria Dreamwalker - SAY_END');
