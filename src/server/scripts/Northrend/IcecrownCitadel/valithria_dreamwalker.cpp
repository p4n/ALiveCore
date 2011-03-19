/*
 * Copyright (C) 2009 - 2011 WoW-ALive <http://www.wow-alive.de/>
 * Kudos to bolvor & soe for base scripts ;)
 */

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

enum ScriptTexts
{
    SAY_AGGRO       = 0,
    SAY_OPEN_PORTAL = 1,
    SAY_ABOVE_75    = 2,
    SAY_BELOW_25    = 3,
    SAY_DEATH       = 4,
    SAY_PDEATH      = 5,
    SAY_BERSERK     = 6,
    SAY_END         = 7,
};

enum Spells
{
    SPELL_CORRUPTION    = 70904, /* 25H 70602 */
    SPELL_DREAM_SLIP    = 71196,
    SPELL_RAGE          = 71189,
    SPELL_VOLLEY        = 70759, /* 25H 72016 */
    SPELL_COLUMN        = 70704, /*  */
    SPELL_COLUMN_AURA   = 70702,
    SPELL_COLUMN_VISUAL = 70715, 
    SPELL_MANA_VOID     = 71085, /* 25H 71743 */
    SPELL_CORRUPTING    = 70602,
    SPELL_WASTE         = 69325, /* 25H 72028  */
    SPELL_FIREBALL      = 70754, /* 25H 72024  */
    SPELL_SUPRESSION    = 70588,
    SPELL_CORROSION     = 70751, /* 25H 72022 */

    SPELL_BURST         = 70744,
/*
    SPELL_BURST_10H     = 72017,
    SPELL_BURST_25      = 71733,
    SPELL_BURST_25H     = 72018,
*/
    SPELL_SPRAY         = 70633,
/*
    SPELL_SPRAY_25      = 71283,
    SPELL_SPRAY_25H     = 72026,
*/ 
    SPELL_ROT           = 72963,
    SPELL_DREAM_STATE   = 70766,
    
    SPELL_PORTAL_VISUAL = 71304,
    SPELL_PORTAL_N_PRE  = 71301,
    SPELL_PORTAL_N_NPC  = 71305,
    SPELL_PORTAL_H_PRE  = 71977,
    SPELL_PORTAL_H_NPC  = 71987,


    SPELL_VIGOR         = 70873,
    SPELL_CLOUD_VISUAL  = 70876
};

enum Events
{
    EVENT_SUMMON_DREAMCLOUD     = 1,    // Timer: ValiAlternative spawnt Clouds
    EVENT_VALITHRIA_TRIGGER     = 2,    // Combat Trigger greift Vali an
    EVENT_CHANGE_PORTAL         = 3,    // Timer: Portale wachsen
    EVENT_SKELLMAGE_VOLLEY      = 4,
    EVENT_SKELLMAGE_COLUMN      = 5,
    EVENT_SKELLMAGE_VOID        = 6,
};

const Position Pos[] =
{
    {4239.579102f, 2566.753418f, 364.868439f, 0.0f}, 
    {4240.688477f, 2405.794678f, 364.868591f, 0.0f},
    {4165.112305f, 2405.872559f, 364.872925f, 0.0f},
    {4166.216797f, 2564.197266f, 364.873047f, 0.0f}
};


class boss_valithria : public CreatureScript
{
    private:
        
        
    public:
        boss_valithria() : CreatureScript("boss_valithria") { }

        struct boss_valithriaAI : public BossAI
        {
            boss_valithriaAI(Creature* pCreature) : BossAI(pCreature, DATA_VALITHRIA_DREAMWALKER), summons(me)
            {
            }

            Creature* combat_trigger;
            Unit* pValithria;
            Unit* pPlayer;
            Unit* pBuff;
            Unit* pTrigger;
            
            uint8 uiStage;
            uint8 uiCloudCount;
            //uint32 uiSummonPhase;
            uint32 uiPortalTimer;
            uint32 uiEndTimer;
            uint32 uiSummonTimer;
            uint32 uiCloudTimer;
            bool bIntro;
            bool bEnd;
            bool bAboveHP;
            bool bBelowHP;
            SummonList summons;
            
            void Reset()
            {
                // vali_trigger
                //me->SummonCreature(2000008, 4243.733398, 2484.454346, 364.870422, 0.016479, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3600000);

                uiStage = 1;
                //pValithriaGIUID = me->GetGUID();

                
                uiSummonTimer = 5000;
                uiPortalTimer = 30000;
                uiEndTimer = 1000;
                uiCloudTimer = 10000;
                uiCloudCount = 0;

                bIntro = false;
                bEnd = false;
                bAboveHP = false;
                bBelowHP = false;

                //uiSummonPhase = 0;
                if(summons.size() > 0)
                    summons.DespawnAll();
                
                if(instance)
                    instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, NOT_STARTED);

                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                DoCast(me, SPELL_CORRUPTION);
                me->SetHealth(uint32(me->GetMaxHealth() * 0.50));
            }

            void MoveInLineOfSight(Unit *who)
            {
                Player* player = (Player*) who;
                if(player->isGameMaster())
                    return;
                if (!bIntro && me->IsWithinDistInMap(who, 50.0f) ){
                    bIntro = true;
                }
                if (instance && instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == NOT_STARTED 
                    && me->IsWithinDistInMap(who, 50.0f))
                {
                    instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, IN_PROGRESS);
                    
                    if(!bIntro){
                        Talk(SAY_AGGRO);
                        bIntro = true;
                        me->SetHealth(uint32(me->GetMaxHealth() * 0.50));
                    }
                }

                if (instance && instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == IN_PROGRESS 
                    && !me->IsWithinDistInMap(who, 120.0f, true))
                {
                    instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, FAIL);
                    me->CombatStop();
                }

            }

            void EnterCombat(Unit* /*pWho*/) 
            {
                DoZoneInCombat();
                if (instance)
                    instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, IN_PROGRESS);
                if(!bIntro){
                    Talk(SAY_AGGRO);
                    bIntro = true;
                    me->SetHealth(uint32(me->GetMaxHealth() * 0.50));
                }
            }

            void JustSummoned(Creature* pSummoned)
            {
                if (pSummoned && !pSummoned->HasAura(SPELL_PORTAL_VISUAL))
                    pSummoned->AI()->AttackStart(me);
                summons.Summon(pSummoned);
            }

            void ResetEvent()
            {
                /*
                Map::PlayerList const &PlList = me->GetMap()->GetPlayers();

                if (PlList.isEmpty())
                    return;

                for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
                {
                    if (Player* pPlayer = i->getSource())
                    {
                        if (pPlayer && pPlayer->isDead() && me->isAlive())
                        {
                            //if (instance)
                                //instance->SetBossState(DATA_VALITHRIA_DREAMWALKER_EVENT, FAIL);
                        }
                    }
                }*/ 
            }

            void HeroicSummon(uint8 coords)
            {
            }

            void JustDied(Unit* /*pKiller*/)
            {
                Talk(SAY_DEATH); 
                // DoScriptText(SAY_DEATH, me);

                summons.DespawnAll();
                
                if (instance)
                    instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, FAIL);
            }

            void UpdateAI(const uint32 diff)
            {

                DoStartNoMovement(me->getVictim());

                if (!instance || instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE)
                    return;
                    
                if (uiSummonTimer <= diff)
                {
                    for (uint8 coords = 0; coords <= RAID_MODE(1,3,1,3); ++coords)
                    {
                        /*
                            1    Z
                            2    ZS
                            3    ZS
                            4    MZ
                            5    MS
                            6    ZA
                            7    A
                            8    U
                            9    UM
                        */
                        uint32 rand = urand(0,10);
                        sLog->outError("Rand: %d",rand);
                        if(rand <= 4 || rand == 6) 
                            DoSummon(CREATURE_ZOMBIE, Pos[coords], 36000000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);
                        if(rand == 2 || rand == 3 || rand == 5) 
                            DoSummon(CREATURE_SKELETON, Pos[coords], 36000000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);
                        if(rand == 6 || rand == 7) 
                            DoSummon(CREATURE_ABOMINATION, Pos[coords], 36000000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);
                        if(rand == 4 || rand == 5 || rand >= 9) 
                            DoSummon(CREATURE_ARCHMAGE, Pos[coords], 36000000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);
                        if(rand >= 8) 
                            DoSummon(CREATURE_SUPPRESSER, Pos[coords], 36000000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);
                    }
                    uiSummonTimer = 20000;
                } else uiSummonTimer -= diff;
                    
                if (uiPortalTimer <= diff)
                {
                    Talk(SAY_OPEN_PORTAL);
                    for(uint8 p = 0; p < RAID_MODE(3,8,3,8); ++p)
                    {
                        DoCast(RAID_MODE(SPELL_PORTAL_N_PRE,SPELL_PORTAL_N_PRE,SPELL_PORTAL_H_PRE,SPELL_PORTAL_H_PRE));
                    }
                    
                    //me->SummonCreature(CREATURE_PORTAL, me->GetPositionX()+15, me->GetPositionY()+15, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
                    //me->SummonCreature(CREATURE_PORTAL, me->GetPositionX()+10, me->GetPositionY()+25, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
                    //me->SummonCreature(CREATURE_PORTAL, me->GetPositionX()+15, me->GetPositionY()-25, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
                    uiPortalTimer = 30000;
                } else uiPortalTimer -= diff;
                
                if (uiCloudTimer <= diff)
                {
                    if(uiCloudCount < 15){
                        float x, y, z;
                        me->GetPosition(x,y,z);
                    
                        for(uint8 i = 0; i <= RAID_MODE(2,6,2,6); ++i) 
                            me->SummonCreature(CREATURE_CLOUD, x + (urand(2, 6) * 10), y + (urand(1, 4) * 10), z + urand(2,8), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
                    }
                    uiCloudTimer = 10000;
                } else uiCloudTimer -= diff;

                if (!bAboveHP && (HealthAbovePct(74)))
                {
                    Talk(SAY_ABOVE_75); 
                    // DoScriptText(SAY_ABOVE_75, me);
                    bAboveHP = true;
                }

                if (!bBelowHP && (HealthBelowPct(26)))
                {
                    Talk(SAY_BELOW_25); 
                    // DoScriptText(SAY_BELOW_25, me);
                    bBelowHP = true;
                }

                if ((HealthAbovePct(99)) && !bEnd)
                {
                    Talk(SAY_END); 
                    // DoScriptText(SAY_END, me);
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                    me->SetReactState(REACT_PASSIVE);
                    me->RemoveAurasDueToSpell(SPELL_CORRUPTION);

                    bEnd = true;
                    uiStage = 1;
                    sLog->outError("Vali: health > 99, end = true");
                }

                if(bEnd && uiStage < 4)
                {
                    if (uiEndTimer <= diff)
                    {
                        switch(uiStage)
                        {
                            case 1:
                                // DoScriptText(SAY_BERSERK , me);
                                Talk(SAY_BERSERK);
                                DoCast(me, SPELL_RAGE);
                                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                                uiStage = 2;
                                uiEndTimer = 6000;
                                sLog->outError("Vali, end stage 1 done");
                                break;
                            case 2:
                                //combat_trigger->ForcedDespawn();
                                DoCast(me, SPELL_DREAM_SLIP, true);
                                uiStage = 3;
                                uiEndTimer = 1000;
                                sLog->outError("Vali, end stage 2 done");
                                break;
                            case 3:
                                if (instance)
                                    instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, DONE);
                                //me->ForcedDespawn();
                                uiEndTimer = 1000;
                                uiStage = 4;
                                sLog->outError("Vali, end stage 3 done");
                                break;
                        }
                    } else uiEndTimer -= diff;
                }
            }
        };

        
        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new boss_valithriaAI(pCreature);
        }
};

class npc_valithria_alternative : public CreatureScript
{
    public:
        npc_valithria_alternative() : CreatureScript("npc_valithria_alternative") { }

        struct npc_valithria_alternativeAI : public ScriptedAI
        {
            npc_valithria_alternativeAI(Creature* creature) : ScriptedAI(creature), summons(me)
            {
                instance = creature->GetInstanceScript();
            }
            

            void Reset()
            {
                me->SetPhaseMask(16, true);
                me->AddUnitMovementFlag(MOVEMENTFLAG_CAN_FLY);
                me->SendMovementFlagUpdate();
                me->SetFlying(true);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

                summons.DespawnAll();
                if(instance)
                    instance->SetData(DATA_VALITHRIA_CLOUDS, 0);

                events.Reset();
                events.ScheduleEvent(EVENT_SUMMON_DREAMCLOUD, 5000);
            }
            
            void JustSummoned(Creature* summoned)
            {
                summons.Summon(summoned);
                if(instance)
                    instance->SetData(DATA_VALITHRIA_CLOUDS, +1);
            }

            void UpdateAI(const uint32 diff)
            {
                events.Update(diff);

                if (!instance || instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != IN_PROGRESS)
                    return;
                
                while (uint32 eventId = events.ExecuteEvent())
                {
                    float x, y, z;
                    me->GetPosition(x,y,z);
                    switch (eventId)
                    {
                        case EVENT_SUMMON_DREAMCLOUD:
                            if(instance->GetData(DATA_VALITHRIA_CLOUDS) < RAID_MODE(10,16,10,16))
                                me->SummonCreature(CREATURE_CLOUD, x + (urand(2, 6) * 10), y + (urand(1, 4) * 10), z + urand(2,8), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
                            events.ScheduleEvent(EVENT_SUMMON_DREAMCLOUD, 5000);
                            break;
                    }
                }
            }

        private:
            InstanceScript* instance;
            EventMap events;
            SummonList summons;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_valithria_alternativeAI(creature);
        }
};

class npc_dreamportal_icc : public CreatureScript
{
    public:
        npc_dreamportal_icc() : CreatureScript("npc_dreamportal_icc") { }

        struct npc_dreamportal_iccAI : public ScriptedAI
        {
            npc_dreamportal_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                instance = pCreature->GetInstanceScript();
            }
            
            Unit* pPlayer;

            void InitializeAI()
            {
                DoCast(SPELL_PORTAL_VISUAL);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);

                ScriptedAI::InitializeAI();
            }

            void Reset()
            {
                uiChangeTimer = 10000;
            }


            void MoveInLineOfSight(Unit *who)
            {
                if (who->IsControlledByPlayer())
                {
                    if (me->IsWithinDistInMap(who,4.0f) && (
                        me->GetEntry() == CREATURE_PORTAL_NORMAL_MODE_NPC ||
                        me->GetEntry() == CREATURE_PORTAL_HEROIC_MODE_NPC) )
                    {
                        pPlayer = who;
                        pPlayer->CastSpell(pPlayer, SPELL_DREAM_STATE, false, 0, 0, 0);
                        pPlayer->AddUnitMovementFlag(MOVEMENTFLAG_CAN_FLY);
                        pPlayer->SendMovementFlagUpdate();
                        uiStateTimer = 15000;
                        //me->ForcedDespawn();
                    }
                }
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;
                if(me->GetEntry() == CREATURE_PORTAL_NORMAL_MODE_PRE)
                {
                    if (uiChangeTimer <= diff)
                        me->UpdateEntry(CREATURE_PORTAL_NORMAL_MODE_NPC);
                    else uiChangeTimer -= diff;
                }

                if(me->GetEntry() == CREATURE_PORTAL_HEROIC_MODE_PRE)
                {
                    if (uiChangeTimer <= diff)
                        me->UpdateEntry(CREATURE_PORTAL_HEROIC_MODE_NPC);
                    else uiChangeTimer -= diff;
                }
                
                /*
                TODO: nochmal überdenken..
                */
                if (uiStateTimer <= diff)
                {
                    pPlayer->RemoveAurasDueToSpell(SPELL_DREAM_STATE);
                    pPlayer->RemoveUnitMovementFlag(MOVEMENTFLAG_CAN_FLY);
                    pPlayer->SendMovementFlagUpdate();
                } else uiStateTimer -= diff;
            }
        private:
            InstanceScript* instance;

            uint32 uiStateTimer;
            uint32 uiChangeTimer;


        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_dreamportal_iccAI(pCreature);
        }
};

class npc_skellmage_icc : public CreatureScript
{
    public:
        npc_skellmage_icc() : CreatureScript("npc_skellmage_icc") { }

        struct npc_skellmage_iccAI : public ScriptedAI
        {
            npc_skellmage_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                instance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_SKELLMAGE_VOLLEY,    10000);
                events.ScheduleEvent(EVENT_SKELLMAGE_COLUMN,    20000);
                events.ScheduleEvent(EVENT_SKELLMAGE_VOID,      30000);
            }

            void UpdateAI(const uint32 diff)
            {
                if(!instance || instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != IN_PROGRESS)
                    me->DespawnOrUnsummon();
                
                if (!UpdateVictim())
                    return;
                
                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_SKELLMAGE_VOLLEY:
                            if(Unit* pTarget = SelectTarget(SELECT_TARGET_TOPAGGRO, 0))
                                DoCast(pTarget, SPELL_VOLLEY);
                            events.ScheduleEvent(EVENT_SKELLMAGE_VOLLEY, urand(10000, 16000));
                            break;
                        case EVENT_SKELLMAGE_COLUMN:
                            if(Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 1))
                                DoCast(pTarget, SPELL_COLUMN);
                            events.ScheduleEvent(EVENT_SKELLMAGE_COLUMN, urand(10000, 20000));
                            break;
                        case EVENT_SKELLMAGE_VOID:
                            if(Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 1))
                                DoCast(pTarget, SPELL_COLUMN);
                            events.ScheduleEvent(EVENT_SKELLMAGE_VOID, urand(16000, 25000));
                            break;
                    }
                }
                DoMeleeAttackIfReady();
            }
        private:
            InstanceScript* instance;
            EventMap events;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_skellmage_iccAI(pCreature);
        }
};

class npc_fireskell_icc : public CreatureScript
{
    public:
        npc_fireskell_icc() : CreatureScript("npc_fireskell_icc") { }

        struct npc_fireskell_iccAI : public ScriptedAI
        {
            npc_fireskell_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                instance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                m_uiWasteTimer = 20000;
                m_uiFireballTimer = 5000;
            }

            void EnterCombat(Unit* /*who*/) { }

            void KilledUnit(Unit* /*pVictim*/)
            {
                // DoScriptText(SAY_PDEATH, pValithria);
            }

            void UpdateAI(const uint32 diff)
            {
                if(instance && instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE)
                    me->DespawnOrUnsummon();
                if (!UpdateVictim())
                    return;

                if (m_uiWasteTimer <= diff)
                {
                    DoCast(SPELL_WASTE);
                    m_uiWasteTimer = 20000;
                } else m_uiWasteTimer -= diff;

                if (m_uiFireballTimer <= diff)
                {
                    if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1))
                        DoCast(pTarget, SPELL_FIREBALL);
                    m_uiFireballTimer = 5000;
                } else m_uiFireballTimer -= diff;

                DoMeleeAttackIfReady();
            }
        private:
            InstanceScript* instance;

            uint32 m_uiWasteTimer;
            uint32 m_uiFireballTimer;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_fireskell_iccAI(pCreature);
        }
};

class npc_suppressor_icc : public CreatureScript
{
    public:
        npc_suppressor_icc() : CreatureScript("npc_suppressor_icc") { }

        struct npc_suppressor_iccAI : public ScriptedAI
        {
            npc_suppressor_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                instance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                if(instance && instance->GetData64(DATA_VALITHRIA_DREAMWALKER))
                    me->CastSpell(instance->GetData64(DATA_VALITHRIA_DREAMWALKER), SPELL_SUPRESSION, true, 0, 0, 0);
            }

            void EnterCombat(Unit* /*who*/)
            {
                me->SetReactState(REACT_AGGRESSIVE);
                m_uiCheckTimer = 2500;
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;
                if(instance)
                {
                    if(instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE)
                        me->DespawnOrUnsummon();
                    if(instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == IN_PROGRESS){
                        Unit* valithria = Unit::GetUnit((*me), instance->GetData64(DATA_VALITHRIA_DREAMWALKER));
                        me->CastSpell(valithria, SPELL_SUPRESSION, true, 0, 0, 0);
                    }
                }
            }
        private:
            InstanceScript* instance;

            uint32 m_uiCheckTimer;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_suppressor_iccAI(pCreature);
        }
};

class npc_manavoid_icc : public CreatureScript
{
    public:
        npc_manavoid_icc() : CreatureScript("npc_manavoid_icc") { }

        struct npc_manavoid_iccAI : public ScriptedAI
        {
            npc_manavoid_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                instance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                DoCast(SPELL_MANA_VOID);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                DoStartNoMovement(me->getVictim());
            }
            
            void UpdateAI(const uint32 diff)
            {
                if(instance && instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE)
                    me->DespawnOrUnsummon();
                if (uiLiveTimer <= diff)
                {
                    me->Kill(me);
                } else uiLiveTimer -= diff;
            }
        private:
            InstanceScript* instance;

            uint32 uiLiveTimer;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_manavoid_iccAI(pCreature);
        }
};

class npc_glutabomination_icc : public CreatureScript
{
    public:
        npc_glutabomination_icc() : CreatureScript("npc_glutabomination_icc") { }

        struct npc_glutabomination_iccAI : public ScriptedAI
        {
            npc_glutabomination_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                instance = pCreature->GetInstanceScript();
            }

            void EnterCombat(Unit* /*who*/) { }

            void Reset()
            {
                m_uiSprayTimer = 10000;
            }

            void KilledUnit(Unit* /*pVictim*/)
            {
                // DoScriptText(SAY_PDEATH, pValithria);
            }

            void JustDied(Unit* /*killer*/)
            {
                for (uint8 i = 1; i < 5; i++)
                {
                    me->SummonCreature(CREATURE_WORM, me->GetPositionX()+urand(3,6), me->GetPositionY()+urand(3,6), me->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 10000);
                }
            }

            void UpdateAI(const uint32 diff)
            {
                if(instance && instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE)
                    me->DespawnOrUnsummon();
                if (!UpdateVictim())
                    return;

                if (m_uiSprayTimer <= diff)
                {
                    DoCast(me, SPELL_SPRAY);
                    m_uiSprayTimer = 20000;
                } else m_uiSprayTimer -= diff;

                DoMeleeAttackIfReady();
            }
        private:
            InstanceScript* instance;

            uint32 m_uiSprayTimer;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_glutabomination_iccAI(pCreature);
        }
};

class npc_blistzombie_icc : public CreatureScript
{
    public:
        npc_blistzombie_icc() : CreatureScript("npc_blistzombie_icc") { }

        struct npc_blistzombie_iccAI : public ScriptedAI
        {
            npc_blistzombie_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                instance = pCreature->GetInstanceScript();
            }

            void EnterCombat(Unit* /*who*/) { }

            void Reset()
            {
                m_uiBurstTimer = 20000;
                m_uiDelayTimer = 99999;
            }

            void KilledUnit(Unit* /*victim*/)
            {
                // DoScriptText(SAY_PDEATH, pValithria);
            }

            void UpdateAI(const uint32 diff)
            {
                if(instance && instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE)
                    me->DespawnOrUnsummon();
                if (!UpdateVictim())
                    return;

                if (m_uiBurstTimer <= diff)
                {
                    DoCast(SPELL_BURST);
                    m_uiBurstTimer = 20000;
                    m_uiDelayTimer = 1000;
                } else m_uiBurstTimer -= diff;

                if (m_uiDelayTimer <= diff)
                {
                    me->ForcedDespawn();
                    m_uiDelayTimer = 100000;
                } else m_uiDelayTimer -= diff;

                DoMeleeAttackIfReady();
            }
        private:
            InstanceScript* instance;

            uint32 m_uiBurstTimer;
            uint32 m_uiDelayTimer;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_blistzombie_iccAI(pCreature);
        }
};

class npc_dreamcloud_icc : public CreatureScript
{
    public:
        npc_dreamcloud_icc() : CreatureScript("npc_dreamcloud_icc") { }

        struct npc_dreamcloud_iccAI : public ScriptedAI
        {
            npc_dreamcloud_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                instance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                DoCast(SPELL_CLOUD_VISUAL);
                me->AddUnitMovementFlag(MOVEMENTFLAG_CAN_FLY);
                me->SendMovementFlagUpdate();
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->SetPhaseMask((16),true);
            }

            void MoveInLineOfSight(Unit *who)
            {
                if (me->IsWithinDistInMap(who, 3.0f))
                {
                    DoCast(SPELL_VIGOR);
                    if(who->HasAura(SPELL_VIGOR))
                        me->SetAuraStack(SPELL_VIGOR, who, who->GetAuraCount(SPELL_VIGOR)+1);
                    else
                        me->AddAura(SPELL_VIGOR, who);
                    instance->SetData(DATA_VALITHRIA_CLOUDS, -1);   
                    me->SetVisible(false);
                    me->Kill(me);
                }
            }
            
            /*void IsSummonedBy(Unit* owner)
            {
                if (owner->GetTypeId() != TYPEID_UNIT)
                    return;

                Creature* creOwner = owner->ToCreature();
                Position pos;
                
                Position const* ownerPos = marrowgarAI->GetLastColdflamePosition();
                float ang = me->GetAngle(ownerPos) - static_cast<float>(M_PI);
                MapManager::NormalizeOrientation(ang);
                me->SetOrientation(ang);
                owner->GetNearPosition(pos, urand(10,50) * 1.0f, 0.0f);
            

                me->NearTeleportTo(pos.GetPositionX(), pos.GetPositionY(), me->GetPositionZ(), me->GetOrientation());
                events.ScheduleEvent(EVENT_COLDFLAME_TRIGGER, 200);
            }*/
            void UpdateAI(const uint32 diff) { }

            void SetOwnerGUID(const uint32 guid){
                ownerGUID = guid;
            }

        private:
            InstanceScript* instance;
            uint32 ownerGUID;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_dreamcloud_iccAI(pCreature);
        }
};

class npc_icc_column_stalker : public CreatureScript
{
    public:
        npc_icc_column_stalker() : CreatureScript("npc_icc_column_stalker") { }

        struct npc_icc_column_stalkerAI : public ScriptedAI
        {
            npc_icc_column_stalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                instance = pCreature->GetInstanceScript();
            }
            
            void Reset()
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
                me->SetInCombatWithZone();
                DoStartNoMovement(me->getVictim());
                DoCast(me, SPELL_COLUMN_VISUAL, true);
                m_uiTimer = 5000;
            }

            void UpdateAI(const uint32 diff) { 
                if (m_uiTimer <= diff)
                {
                    DoCast(SPELL_COLUMN_AURA);
                    me->Kill(me);
                } else m_uiTimer -= diff;

            }


        private:
            InstanceScript* instance;
            uint32 m_uiTimer;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_icc_column_stalkerAI(pCreature);
        }
};


class npc_icc_valithria_trigger : public CreatureScript
{
    public:
        npc_icc_valithria_trigger() : CreatureScript("npc_icc_valithria_trigger") { }

        struct npc_icc_valithria_triggerAI : public ScriptedAI
        {
            npc_icc_valithria_triggerAI(Creature* creature) : ScriptedAI(creature)
            {
                instance = creature->GetInstanceScript();
            }

            void Reset()
            {
                me->SetVisible(false);
                me->SetInCombatWithZone();
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE); 
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE); 
                
                events.ScheduleEvent(EVENT_VALITHRIA_TRIGGER, 10000);
                
                if(instance && instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != DONE)
                   instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, NOT_STARTED);
            }
            
            void MoveInLineOfSight(Unit *who)
            {
                Player* player = (Player*) who;
                if(player->isGameMaster())
                    return;
                if (instance && instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != IN_PROGRESS
                    && instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != DONE){
                    if(me->IsWithinDistInMap(who, 30) && who->isAlive()){
                        instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, IN_PROGRESS);
                        sLog->outError("Trigger, set vali in progress");
                    }
                }
                
            }

            void UpdateAI(const uint32 diff)
            {
                events.Update(diff);

                if (!instance || instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != IN_PROGRESS)
                {
                    //sLog->outError("Trigger: Vali not in progress");                
                    return;
                }
                if (events.ExecuteEvent() == EVENT_VALITHRIA_TRIGGER)
                {
                    //if(instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != DONE)
                    //    instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, IN_PROGRESS);
                    
                    if (instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == IN_PROGRESS)
                    {
                        Unit* valithria = Unit::GetUnit((*me), instance->GetData64(DATA_VALITHRIA_DREAMWALKER));
                        valithria->AddThreat(me, 10000000.0f);
                        me->AddThreat(valithria, 10000000.0f);
                        valithria->GetAI()->AttackStart(me);
                        AttackStart(valithria);
                        events.ScheduleEvent(EVENT_VALITHRIA_TRIGGER, 10000);
                    }
                }
            }

        private:
            InstanceScript* instance;
            EventMap events;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_icc_valithria_triggerAI(pCreature);
        }
};

void AddSC_boss_valithria()
{
    new boss_valithria;
    new npc_valithria_alternative;
    new npc_icc_valithria_trigger;
    
    new npc_suppressor_icc;
    new npc_skellmage_icc; 
    new npc_fireskell_icc; 
    new npc_glutabomination_icc;
    new npc_blistzombie_icc;

    new npc_dreamportal_icc;
    new npc_dreamcloud_icc;
    new npc_manavoid_icc;
    new npc_icc_column_stalker;
}