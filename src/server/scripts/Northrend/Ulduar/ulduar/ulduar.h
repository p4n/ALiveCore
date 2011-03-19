/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef DEF_ULDUAR_H
#define DEF_ULDUAR_H

enum eTypes
{
    MAX_ENCOUNTER               = 15,

    TYPE_LEVIATHAN              = 0,
    TYPE_IGNIS                  = 1,
    TYPE_RAZORSCALE             = 2,
    TYPE_XT002                  = 3,
    TYPE_ASSEMBLY               = 4,
    TYPE_KOLOGARN               = 5,
    TYPE_AURIAYA                = 6,
    TYPE_MIMIRON                = 7,
    TYPE_HODIR                  = 8,
    TYPE_THORIM                 = 9,
    TYPE_FREYA                  = 10,
    TYPE_VEZAX                  = 11,
    TYPE_YOGGSARON              = 12,
    TYPE_ALGALON                = 13,
    TYPE_COLOSSUS               = 14,

    DATA_STEELBREAKER,
    DATA_MOLGEIM,
    DATA_BRUNDIR,

    DATA_EXP_COMMANDER,
    DATA_RIGHT_ARM,
    DATA_LEFT_ARM,
};

enum Encounter
{
    BOSS_LEVIATHAN,
    BOSS_IGNIS,
    BOSS_RAZORSCALE,
    BOSS_XT002,
    BOSS_ASSEMBLY,
    BOSS_KOLOGARN,
    BOSS_AURIAYA,
    BOSS_MIMIRON,
    BOSS_HODIR,
    BOSS_THORIM,
    BOSS_FREYA,
    BOSS_VEZAX,
    BOSS_YOGGSARON,
    BOSS_ALGALON,
    MAX_BOSS_NUMBER
};

enum eBossNPCs
{
    NPC_LEVIATHAN               = 33113,
    NPC_IGNIS                   = 33118,
    NPC_RAZORSCALE              = 33186,
    NPC_EXPEDITION_COMMANDER    = 33210,
    NPC_XT002                   = 33293,
    NPC_STEELBREAKER            = 32867,
    NPC_MOLGEIM                 = 32927,
    NPC_BRUNDIR                 = 32857,
    NPC_KOLOGARN                = 32930,
    NPC_AURIAYA                 = 33515,
    NPC_MIMIRON                 = 33350,
    //NPC_HODIR                   = 32845,
    NPC_THORIM                  = 32865,
    NPC_FREYA                   = 32906,
    NPC_VEZAX                   = 33271,
    NPC_YOGGSARON               = 33288,
    NPC_ALGALON                 = 32871,
	NPC_GUARDIN                 = 33136,
	NPC_SARA_NORMAL             = 33134,
	NPC_CLOUD                   = 33292,
	NPC_SARATRANS               = 34313,
	NPC_UNVER_WACHE             = 33988,



	NPC_LEFT_ARM = 32933,
    NPC_RIGHT_ARM = 32934,
    NPC_RUBBLE                  = 33768,
    NPC_FOCUSED_EYEBEAM = 33632,
    NPC_FOCUSED_EYEBEAM_RIGHT = 33802,

};

enum eGameObjects
{
    GO_KOLOGARN_CHEST_HERO  = 195047,
    GO_KOLOGARN_CHEST       = 195046,
    GO_KOLOGARN_BRIDGE      = 194232,
    GO_KOLOGARN_DOOR        = 194553,
    GO_THORIM_CHEST_HERO    = 194315,
    GO_THORIM_CHEST         = 194314,
    GO_HODIR_CHEST_HERO     = 194308,
    GO_HODIR_CHEST          = 194307,
    GO_FREYA_CHEST_HERO     = 194325,
    GO_FREYA_CHEST          = 194324,
    GO_LEVIATHAN_DOOR       = 194905,
    GO_LEVIATHAN_GATE       = 194630,
    GO_VEZAX_DOOR           = 194750,
};

enum eTowerEvents
{
    EVENT_TOWER_OF_STORM_DESTROYED     = 21031,
    EVENT_TOWER_OF_FROST_DESTROYED     = 21032,
    EVENT_TOWER_OF_FLAMES_DESTROYED    = 21033,
    EVENT_TOWER_OF_LIFE_DESTROYED      = 21030
};

enum eAchievementCriteria
{
    ACHIEVEMENT_CRITERIA_HOT_POCKET_10                   = 10430, //ignis
    ACHIEVEMENT_CRITERIA_HOT_POCKET_25                   = 10431,
};

enum Data64
{
    DATA_LEVIATHAN,
    DATA_NORGANNON,
    DATA_IGNIS,
    DATA_RAZORSCALE,
    DATA_XT002,
    DATA_KOLOGARN,
    DATA_AURIAYA,
    DATA_BRIGHTLEAF,
    DATA_IRONBRANCH,
    DATA_FREYA,
    DATA_THORIM,
    DATA_RUNIC_COLOSSUS,
    DATA_RUNE_GIANT,
    DATA_MIMIRON,
    DATA_LEVIATHAN_MK_II,
	DATA_xtest,
	DATA_ctest,
	DATA_txtest,
	DATA_ztest,
    DATA_VX_001,
    DATA_AERIAL_UNIT,
    DATA_MAGNETIC_CORE,
    DATA_VEZAX,
    DATA_YS_FREYA,
    DATA_YS_THORIM,
    DATA_YS_MIMIRON,
    DATA_YS_HODIR,
    DATA_YOGGSARON_BRAIN,
    DATA_YOGGSARON,
	DATA_STONEBARK,
	DATA_SARA,
	DATA_GUARDIANS,
	DATA_CLOUD,
	DATA_TRIGGER,
	DATA_UNV_WACHE,
	DATA_SARATRANS
};


enum Data
{
    DATA_LEVIATHAN_DOOR,
    DATA_RUNIC_DOOR,
    DATA_STONE_DOOR,
    DATA_CALL_TRAM,
    DATA_MIMIRON_ELEVATOR,
    DATA_HODIR_RARE_CHEST
};

#endif
