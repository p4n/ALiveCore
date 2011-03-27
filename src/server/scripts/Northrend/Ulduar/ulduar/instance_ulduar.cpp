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

#include "ScriptPCH.h"
#include "ulduar.h"


static const DoorData doorData[] =
{
    {GO_LEVIATHAN_DOOR, TYPE_LEVIATHAN, DOOR_TYPE_ROOM,     BOUNDARY_S},
    {0,                 0,              DOOR_TYPE_ROOM,     BOUNDARY_NONE}
};

class instance_ulduar : public InstanceMapScript
{
public:
    instance_ulduar() : InstanceMapScript("instance_ulduar", 603) { }

    InstanceScript* GetInstanceScript(InstanceMap* pMap) const
    {
        return new instance_ulduar_InstanceMapScript(pMap);
    }

    struct instance_ulduar_InstanceMapScript : public InstanceScript
    {
        instance_ulduar_InstanceMapScript(InstanceMap* map) : InstanceScript(map) { Initialize(); };

        uint32 uiEncounter[MAX_ENCOUNTER];
        std::string m_strInstData;

        uint64 uiLeviathanGUID;
        uint64 uiIgnisGUID;
        uint64 uiRazorscaleGUID;
        uint64 uiRazorscaleController;
        uint64 uiRazorHarpoonGUIDs[4];
        uint64 uiExpCommanderGUID;
        uint64 uiXT002GUID;
        uint64 uiAssemblyGUIDs[3];
        uint64 uiKologarnGUID;
        uint64 uiAuriayaGUID;
        uint64 uiMimironGUID;
        uint64 uiHodirGUID;
        uint64 uiThorimGUID;
        uint64 uiFreyaGUID;
        uint64 uiVezaxGUID;
        uint64 uiYoggSaronGUID;
        uint64 uiAlgalonGUID;
        uint64 uiLeviathanGateGUID;
        uint64 uiVezaxDoorGUID;

        uint64 uiKologarnChestGUID;
        uint64 uiThorimChestGUID;
        uint64 uiHodirChestGUID;
        uint64 uiFreyaChestGUID;
		uint64 uiLeftArmGUID;
        uint64 uiRightArmGUID;
		uint64 uiKologarnBridgeGUID;

		uint64 uiNorgannon;
		uint64 uiSteelbreaker;
		uint64 uiMolgeim;
		uint64 uiBrundir;
		uint64 uiKologarn;
		uint64 uiAuriaya;
		uint64 uiBrightleaf;
		uint64 uiIronbranch;
		uint64 uiStonebark;
		uint64 uiFreya;
		uint64 uiThorim;
		uint64 uiRunicColossus;
		uint64 uiRuneGiant;
		uint64 uiMimiron;
		uint64 uiLeviathanMKII;
		uint64 uiVX001;
		uint64 uiAerialUnit;
		uint64 uiMagneticCore;
		uint64 uiVezax;
		uint64 uiFreyaYS;
		uint64 uiThorimYS;
		uint64 uiMimironYS;
		uint64 uiHodirYS;
		uint64 uiYoggSaronBrain;
		uint64 uiYoggSaron;
		uint64 uiFreyaImage;
		uint64 uiThorimImage;
		uint64 uiMimironImage;
		uint64 uiHodirImage;
		uint64 uiSara;
		uint64 uiSaraTrans;

        void Initialize()
        {
            SetBossNumber(MAX_ENCOUNTER);
            LoadDoorData(doorData);
            uiIgnisGUID             = 0;
            uiRazorscaleGUID        = 0;
            uiRazorscaleController  = 0;
            uiExpCommanderGUID      = 0;
            uiXT002GUID             = 0;
            uiKologarnGUID          = 0;
            uiLeftArmGUID           = 0;
            uiRightArmGUID          = 0;
            uiAuriayaGUID           = 0;
            uiMimironGUID           = 0;
            uiHodirGUID             = 0;
            uiThorimGUID            = 0;
            uiFreyaGUID             = 0;
            uiVezaxGUID             = 0;
            uiYoggSaronGUID         = 0;
            uiAlgalonGUID           = 0;
            uiKologarnChestGUID     = 0;
            uiKologarnBridgeGUID    = 0;
            uiKologarnChestGUID     = 0;
            uiThorimChestGUID       = 0;
            uiHodirChestGUID        = 0;
            uiFreyaChestGUID        = 0;
            uiLeviathanGateGUID     = 0;
            uiVezaxDoorGUID         = 0;

            memset(uiEncounter, 0, sizeof(uiEncounter));
            memset(uiAssemblyGUIDs, 0, sizeof(uiAssemblyGUIDs));
            memset(uiRazorHarpoonGUIDs, 0, sizeof(uiRazorHarpoonGUIDs));
        }

        bool IsEncounterInProgress() const
        {
            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
            {
                if (uiEncounter[i] == IN_PROGRESS)
                    return true;
            }

            return false;
        }

        void OnCreatureCreate(Creature* creature)
        {
			Map::PlayerList const &players = instance->GetPlayers();
            uint32 TeamInInstance = 0;

            if (!players.isEmpty())
                if (Player* pPlayer = players.begin()->getSource())
                    TeamInInstance = pPlayer->GetTeam();

            switch(creature->GetEntry())
            {
                case NPC_LEVIATHAN:
                    uiLeviathanGUID = creature->GetGUID();
                    break;
                case NPC_IGNIS:
                    uiIgnisGUID = creature->GetGUID();
                    break;
                case NPC_RAZORSCALE:
                    uiRazorscaleGUID = creature->GetGUID();
                    break;
                case NPC_RAZORSCALE_CONTROLLER:
                    uiRazorscaleController = creature->GetGUID();
                    break;
                case NPC_EXPEDITION_COMMANDER:
                    uiExpCommanderGUID = creature->GetGUID();
                    return;
                case NPC_XT002:
                    uiXT002GUID = creature->GetGUID();
                    break;

                case NPC_VEZAX:
                    uiVezaxGUID = creature->GetGUID();
                    break;
                case NPC_ALGALON:
                    uiAlgalonGUID = creature->GetGUID();
                    break;

                case 33686: uiNorgannon = creature->GetGUID(); return;
                case 32867: uiSteelbreaker = creature->GetGUID(); return;
                case 32927: uiMolgeim = creature->GetGUID(); return;
                case 32857: uiBrundir = creature->GetGUID(); return;
                case 32930: uiKologarn = creature->GetGUID(); return;
                case 33515: uiAuriaya = creature->GetGUID(); return;
                case 32915: uiBrightleaf = creature->GetGUID(); return;
                case 32913: uiIronbranch = creature->GetGUID(); return;
                case 32914: uiStonebark = creature->GetGUID(); return;
                case 32906: uiFreya = creature->GetGUID(); return;
                case 32865: uiThorim = creature->GetGUID(); return;
                case 32872: uiRunicColossus = creature->GetGUID(); return;
                case 32873: uiRuneGiant = creature->GetGUID(); return;
                case 33350: uiMimiron = creature->GetGUID(); return;
                case 33432: uiLeviathanMKII = creature->GetGUID(); return;
                case 33651: uiVX001 = creature->GetGUID(); return;
                case 33670: uiAerialUnit = creature->GetGUID(); return;
                case 34068: uiMagneticCore = creature->GetGUID(); return;
                case 33410: uiFreyaYS = creature->GetGUID(); return;
                case 33413: uiThorimYS = creature->GetGUID(); return;
                case 33412: uiMimironYS = creature->GetGUID(); return;
                case 33411: uiHodirYS = creature->GetGUID(); return;
                case 33890: uiYoggSaronBrain = creature->GetGUID(); return;
                case 33288: uiYoggSaron = creature->GetGUID(); return;

				case NPC_SARA_NORMAL: uiSara = creature->GetGUID(); return;
				case NPC_SARATRANS: uiSaraTrans = creature->GetGUID(); return;

				// Keeper's Images
                case 33241: uiFreyaImage = creature->GetGUID();
                {
                    InstanceScript* pInstance = creature->GetInstanceScript();
                    creature->SetVisible(false);
                    if (pInstance && pInstance->GetBossState(BOSS_VEZAX) == DONE)
                        creature->SetVisible(true);
                }
                return;
                case 33242: uiThorimImage = creature->GetGUID();
                {
                    InstanceScript* pInstance = creature->GetInstanceScript();
                    creature->SetVisible(false);
                    if (pInstance && pInstance->GetBossState(BOSS_VEZAX) == DONE)
                        creature->SetVisible(true);
                }
                return;
                case 33244: uiMimironImage = creature->GetGUID();
                {
                    InstanceScript* pInstance = creature->GetInstanceScript();
                    creature->SetVisible(false);
                    if (pInstance && pInstance->GetBossState(BOSS_VEZAX) == DONE)
                        creature->SetVisible(true);
                }            
                return;
                case 33213: uiHodirImage = creature->GetGUID();
                {
                    InstanceScript* pInstance = creature->GetInstanceScript();
                    creature->SetVisible(false);
                    if (pInstance && pInstance->GetBossState(BOSS_VEZAX) == DONE)
                        creature->SetVisible(true);
                }
                return;
            }

         }

        void OnGameObjectCreate(GameObject* go)
        {
            switch(go->GetEntry())
            {
                case GO_KOLOGARN_CHEST_HERO:
                case GO_KOLOGARN_CHEST:
                    uiKologarnChestGUID = go->GetGUID();
                    break;
                case GO_THORIM_CHEST_HERO:
                case GO_THORIM_CHEST:
                    uiThorimChestGUID =go->GetGUID();
                    break;
                case GO_HODIR_CHEST_HERO:
                case GO_HODIR_CHEST:
                    uiHodirChestGUID = go->GetGUID();
                    break;
                case GO_FREYA_CHEST_HERO:
                case GO_FREYA_CHEST:
                    uiFreyaChestGUID = go->GetGUID();
                    break;
                case GO_LEVIATHAN_DOOR:
                    AddDoor(go, true);
                    break;
                case GO_LEVIATHAN_GATE:
                    uiLeviathanGateGUID = go->GetGUID();
                    if (GetBossState(TYPE_LEVIATHAN) == DONE)
                        go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                    break;
                case GO_VEZAX_DOOR:
                    uiVezaxDoorGUID = go->GetGUID();
                    HandleGameObject(NULL, false, go);
                    break;
                case GO_RAZOR_HARPOON_1:
                    uiRazorHarpoonGUIDs[0] = go->GetGUID();
                    break;
                case GO_RAZOR_HARPOON_2:
                    uiRazorHarpoonGUIDs[1] = go->GetGUID();
                    break;
                case GO_RAZOR_HARPOON_3:
                    uiRazorHarpoonGUIDs[2] = go->GetGUID();
                    break;
                case GO_RAZOR_HARPOON_4:
                    uiRazorHarpoonGUIDs[3] = go->GetGUID();
                    break;
            }
        }

        void OnGameObjectRemove(GameObject* go)
        {
            switch (go->GetEntry())
            {
                case GO_LEVIATHAN_DOOR:
                    AddDoor(go, false);
                    break;
                default:
                    break;
            }
        }

        void ProcessEvent(GameObject* /*go*/, uint32 eventId)
        {
            // Flame Leviathan's Tower Event triggers
           Creature* pFlameLeviathan = instance->GetCreature(uiLeviathanGUID);

            if (pFlameLeviathan && pFlameLeviathan->isAlive()) //No leviathan, no event triggering ;)
                switch(eventId)
                {
                    case EVENT_TOWER_OF_STORM_DESTROYED:
                        pFlameLeviathan->AI()->DoAction(1);
                        break;
                    case EVENT_TOWER_OF_FROST_DESTROYED:
                        pFlameLeviathan->AI()->DoAction(2);
                        break;
                    case EVENT_TOWER_OF_FLAMES_DESTROYED:
                        pFlameLeviathan->AI()->DoAction(3);
                        break;
                    case EVENT_TOWER_OF_LIFE_DESTROYED:
                        pFlameLeviathan->AI()->DoAction(4);
                        break;
                }
        }

        void ProcessEvent(Unit* /*unit*/, uint32 /*eventId*/)
        {
        }

        bool SetBossState(uint32 type, EncounterState state)
        {
            if (!InstanceScript::SetBossState(type, state))
                return false;

            switch (type)
            {
                case TYPE_LEVIATHAN:
                case TYPE_IGNIS:
                case TYPE_RAZORSCALE:
                case TYPE_XT002:
                case TYPE_ASSEMBLY:
                case TYPE_AURIAYA:
                case TYPE_MIMIRON:
                case TYPE_VEZAX:
                    if (state == DONE)
                        HandleGameObject(uiVezaxDoorGUID, true);
                    break;
                case TYPE_YOGGSARON:
                    break;
                case TYPE_KOLOGARN:
                    if (state == DONE)
                        if (GameObject* go = instance->GetGameObject(uiKologarnChestGUID))
                            go->SetRespawnTime(go->GetRespawnDelay());
                    break;
                case TYPE_HODIR:
                    if (state == DONE)
                        if (GameObject* go = instance->GetGameObject(uiHodirChestGUID))
                            go->SetRespawnTime(go->GetRespawnDelay());
                    break;
                case TYPE_THORIM:
                    if (state == DONE)
                        if (GameObject* go = instance->GetGameObject(uiThorimChestGUID))
                            go->SetRespawnTime(go->GetRespawnDelay());
                    break;
                case TYPE_FREYA:
                    if (state == DONE)
                        if (GameObject* go = instance->GetGameObject(uiFreyaChestGUID))
                            go->SetRespawnTime(go->GetRespawnDelay());
                    break;
             }

             return true;
        }

        void SetData(uint32 type, uint32 data)
        {
            switch(type)
            {
                case TYPE_COLOSSUS:
                    uiEncounter[TYPE_COLOSSUS] = data;
                    if (data == 2)
                    {
                        if (Creature* pBoss = instance->GetCreature(uiLeviathanGUID))
                            pBoss->AI()->DoAction(10);
                        if (GameObject* pGate = instance->GetGameObject(uiLeviathanGateGUID))
                            pGate->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                        SaveToDB();
                    }
                    break;
                default:
                    break;
            }
        }

        uint64 GetData64(uint32 data)
        {
            switch(data)
            {
                case TYPE_LEVIATHAN:            return uiLeviathanGUID;
                case TYPE_IGNIS:                return uiIgnisGUID;
                case TYPE_RAZORSCALE:           return uiRazorscaleGUID;
                case DATA_RAZORSCALE_CONTROL:   return uiRazorscaleController;
                case TYPE_XT002:                return uiXT002GUID;

                // razorscale expedition commander
                case DATA_EXP_COMMANDER:        return uiExpCommanderGUID;


				//case DATA_NORGANNON:			return uiNorgannon;
                //case DATA_STEELBREAKER:			return uiSteelbreaker;
                //case DATA_MOLGEIM:				return uiMolgeim;
                //case DATA_BRUNDIR:				return uiBrundir;
                case DATA_KOLOGARN:				return uiKologarn;
                case DATA_AURIAYA:				return uiAuriaya;
                case DATA_BRIGHTLEAF:			return uiBrightleaf;
                case DATA_IRONBRANCH:			return uiIronbranch;
                case DATA_STONEBARK:			return uiStonebark;
                case DATA_FREYA:				return uiFreya;
                case DATA_THORIM:				return uiThorim;
                case DATA_RUNIC_COLOSSUS:		return uiRunicColossus;
                case DATA_RUNE_GIANT:			return uiRuneGiant;
                case DATA_MIMIRON:				return uiMimiron;
                case DATA_LEVIATHAN_MK_II:		return uiLeviathanMKII;
                case DATA_VX_001:				return uiVX001;
                case DATA_AERIAL_UNIT:			return uiAerialUnit;
                case DATA_MAGNETIC_CORE:		return uiMagneticCore;
                case DATA_YS_FREYA:				return uiFreyaYS;
                case DATA_YS_THORIM:			return uiThorimYS;
                case DATA_YS_MIMIRON:			return uiMimironYS;
                case DATA_YS_HODIR:				return uiHodirYS;
                case DATA_YOGGSARON_BRAIN:		return uiYoggSaronBrain;
                case DATA_YOGGSARON:			return uiYoggSaron;
				case DATA_SARA:                 return uiSara;
				case DATA_SARATRANS:            return uiSaraTrans;

                case GO_RAZOR_HARPOON_1:        return uiRazorHarpoonGUIDs[0];
                case GO_RAZOR_HARPOON_2:        return uiRazorHarpoonGUIDs[1];
                case GO_RAZOR_HARPOON_3:        return uiRazorHarpoonGUIDs[2];
                case GO_RAZOR_HARPOON_4:        return uiRazorHarpoonGUIDs[3];
                // Assembly of Iron
                case DATA_STEELBREAKER:         return uiAssemblyGUIDs[0];
                case DATA_MOLGEIM:              return uiAssemblyGUIDs[1];
                case DATA_BRUNDIR:              return uiAssemblyGUIDs[2];

            }

            return 0;
        }

        uint32 GetData(uint32 type)
        {
            switch(type)
            {
                case TYPE_COLOSSUS:
                    return uiEncounter[type];
            }

            return 0;
        }

        std::string GetSaveData()
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            saveStream << "U U " << GetBossSaveData() << GetData(TYPE_COLOSSUS);

            OUT_SAVE_INST_DATA_COMPLETE;
            return saveStream.str();
        }

        void Load(const char* strIn)
        {
            if (!strIn)
            {
                OUT_LOAD_INST_DATA_FAIL;
                return;
            }

            OUT_LOAD_INST_DATA(strIn);

            char dataHead1, dataHead2;

            std::istringstream loadStream(strIn);
            loadStream >> dataHead1 >> dataHead2;

            if (dataHead1 == 'U' && dataHead2 == 'U')
            {
                for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                {
                    uint32 tmpState;
                    loadStream >> tmpState;
                    if (tmpState == IN_PROGRESS || tmpState > SPECIAL)
                        tmpState = NOT_STARTED;

                    if (i == TYPE_COLOSSUS)
                        SetData(i, tmpState);
                    else
                        SetBossState(i, EncounterState(tmpState));
                }
            }

            OUT_LOAD_INST_DATA_COMPLETE;
        }
    };

};

class go_call_tram : public GameObjectScript
{
public:
    go_call_tram() : GameObjectScript("go_call_tram") { }

    bool OnGossipHello(Player* /*pPlayer*/, GameObject* pGo)
    {
        InstanceScript* pInstance = pGo->GetInstanceScript();

        if (!pInstance)
            return false;

        switch(pGo->GetEntry())
        {
            case 194914:
            case 194438:
                pInstance->SetData(DATA_CALL_TRAM, 0);
                break;
            case 194912:
            case 194437:
                pInstance->SetData(DATA_CALL_TRAM, 1);
                break;
        }
        return true;
    }
};


void AddSC_instance_ulduar()
{
    new instance_ulduar();
	new go_call_tram();
}
