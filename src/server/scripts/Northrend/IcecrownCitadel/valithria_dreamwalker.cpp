/*
 * Copyright (C) 2009 - 2010 WoW-ALive <http://www.wow-alive.de/>
 */

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

enum Yells
{
    SAY_AGGRO       = -1666063,
    SAY_BELOW_25    = -1666066,
    SAY_ABOVE_75    = -1666065,
    SAY_DEATH       = -1666067,
    SAY_PDEATH      = -1666068,
    SAY_END         = -1666070,
    SAY_BERSERK     = -1666069,
    SAY_OPEN_PORTAL = -1666064
};

enum Spells
{
    SPELL_CORRUPTION    = 70904,
    SPELL_DREAM_SLIP    = 71196,
    SPELL_RAGE          = 71189,
    SPELL_VOLLEY        = 70759,
    SPELL_COLUMN        = 70704,
    SPELL_COLUMN_AURA   = 70702,
    SPELL_MANA_VOID     = 71085,
    SPELL_CORRUPTING    = 70602,
    SPELL_WASTE         = 69325,
    SPELL_FIREBALL      = 70754,
    SPELL_SUPRESSION    = 70588,
    SPELL_CORROSION     = 70751,
    SPELL_BURST         = 70744,
    SPELL_SPRAY         = 71283,
    SPELL_ROT           = 72963,
    SPELL_DREAM_STATE   = 70766,
    SPELL_PORTAL_VISUAL = 71304,
    SPELL_VIGOR         = 70873,
    SPELL_CLOUD_VISUAL  = 70876
};

const Position Pos[] =
{
    {4239.579102f, 2566.753418f, 364.868439f, 0.0f}, 
    {4240.688477f, 2405.794678f, 364.868591f, 0.0f},
    {4165.112305f, 2405.872559f, 364.872925f, 0.0f},
    {4166.216797f, 2564.197266f, 364.873047f, 0.0f}
};

Unit* pValithria;
Unit* pPlayer;
Unit* pBuff;
Unit* pTrigger;

uint8 Valitria_aggro_trigger;
uint64 pValithriaGIUID;

Creature* combat_trigger= NULL;

class boss_valithria : public CreatureScript
{
    public:
        boss_valithria() : CreatureScript("boss_valithria") { }

        struct boss_valithriaAI : public BossAI
        {
            boss_valithriaAI(Creature* pCreature) : BossAI(pCreature, DATA_VALITHRIA_DREAMWALKER), summons(me)
            {
                pInstance = me->GetInstanceScript();
            }

            InstanceScript* pInstance;

            uint8 m_uiStage;
            uint32 summonphase;
            uint32 m_uiPortalTimer;
            uint32 m_uiEndTimer;
            uint32 m_uiSummonTimer;
            bool bIntro;
            bool bEnd;
            bool bAboveHP;
            bool bBelowHP;
            SummonList summons;

            void Reset()
            {
                me->SummonCreature(2000008, 4243.733398, 2484.454346, 364.870422, 0.016479, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3600000);

                m_uiStage = 1;

                pValithriaGIUID = me->GetGUID();

                DoCast(me, SPELL_CORRUPTION);
                me->SetHealth(uint32(me->GetMaxHealth() * 0.50));

                m_uiSummonTimer = 15000;
                m_uiPortalTimer = 30000;
                m_uiEndTimer = 1000;

                bIntro = false;
                bEnd = false;
                bAboveHP = false;
                bBelowHP = false;

                summonphase = 0;

                 Valitria_aggro_trigger = 0;

                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);

                //if (pInstance && me->isAlive())
                    //pInstance->SetData(DATA_VALITHRIA_DREAMWALKER_EVENT, IN_PROGRESS);
            }

            void MoveInLineOfSight(Unit *who)
            {
            }

            void EnterCombat(Unit* /*pWho*/) 
            {
                //if (pInstance)
                    //pInstance->SetData(DATA_VALITHRIA_DREAMWALKER, IN_PROGRESS);
            }

            void JustSummoned(Creature* pSummoned)
            {
                if (pSummoned && !pSummoned->HasAura(SPELL_PORTAL_VISUAL))
                    pSummoned->AI()->AttackStart(me);

                summons.Summon(pSummoned);
            }

            void ResetEvent()
            {
                Map::PlayerList const &PlList = me->GetMap()->GetPlayers();

                if (PlList.isEmpty())
                    return;

                for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
                {
                    if (Player* pPlayer = i->getSource())
                    {
                        if (pPlayer && pPlayer->isDead() && me->isAlive())
                        {
                            //if (pInstance)
                                //pInstance->SetData(DATA_VALITHRIA_DREAMWALKER_EVENT, FAIL);
                        }
                    }
                }
            }

            void HeroicSummon(uint8 coords)
            {
            }

            void JustDied(Unit* /*pKiller*/)
            {
                // DoScriptText(SAY_DEATH, me);

                summons.DespawnAll();

                //if (pInstance)
                    //pInstance->SetData(DATA_VALITHRIA_DREAMWALKER_EVENT, FAIL);
            }

            void UpdateAI(const uint32 diff)
            {

                    DoStartNoMovement(me->getVictim());

                  if (Valitria_aggro_trigger == 1)
                  {
                     if (summonphase == 0)
                     {
                        if (m_uiSummonTimer <= diff)
                        {
                           urand(0,1); me->SummonCreature(CREATURE_ZOMBIE, 4241.539551, 2546.322021, 364.867554, 4.717079, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           urand(0,1); me->SummonCreature(CREATURE_ZOMBIE, 4241.539551, 2546.322021, 364.867554, 4.717079, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           summonphase == 1;
                           m_uiSummonTimer = 40000;
                        } else m_uiSummonTimer -= diff;
                     }
                  }
  
                  if (Valitria_aggro_trigger == 1)
                  {
                     if (summonphase == 1)
                     {
                        if (m_uiSummonTimer <= diff)
                        {
                           urand(0,1); me->SummonCreature(CREATURE_SKELETON, 4241.379395, 2423.439941, 364.868439, 1.579425, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           urand(0,1); me->SummonCreature(CREATURE_SKELETON, 4241.379395, 2423.439941, 364.868439, 1.579425, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           summonphase == 2;
                           m_uiSummonTimer = 40000;
                        } else m_uiSummonTimer -= diff;
                     }
                  }

                  if (Valitria_aggro_trigger == 1)
                  {
                     if (summonphase == 2)
                     {
                        if (m_uiSummonTimer <= diff)
                        {
                           urand(0,1); me->SummonCreature(CREATURE_ABOMINATION, 4241.539551, 2546.322021, 364.867554, 4.717079, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           summonphase == 3;
                           m_uiSummonTimer = 40000;
                        } else m_uiSummonTimer -= diff;
                     }
                  }

                  if (Valitria_aggro_trigger == 1)
                  {
                     if (summonphase == 3)
                     {
                        if (m_uiSummonTimer <= diff)
                        {
                           urand(0,1); me->SummonCreature(CREATURE_ARCHMAGE, 4241.379395, 2423.439941, 364.868439, 1.579425, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           urand(0,1); me->SummonCreature(CREATURE_ARCHMAGE, 4241.379395, 2423.439941, 364.868439, 1.579425, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           urand(0,1); me->SummonCreature(CREATURE_ARCHMAGE, 4241.379395, 2423.439941, 364.868439, 1.579425, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           summonphase == 4;
                           m_uiSummonTimer = 40000;
                        } else m_uiSummonTimer -= diff;
                     }
                  }

                  if (Valitria_aggro_trigger == 1)
                  {
                     if (summonphase == 4)
                     {
                        if (m_uiSummonTimer <= diff)
                        {
                           urand(0,1); me->SummonCreature(CREATURE_SUPPRESSER, 4241.539551, 2546.322021, 364.867554, 4.717079, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           urand(0,1); me->SummonCreature(CREATURE_SUPPRESSER, 4241.539551, 2546.322021, 364.867554, 4.717079, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           urand(0,1); me->SummonCreature(CREATURE_SUPPRESSER, 4241.539551, 2546.322021, 364.867554, 4.717079, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           urand(0,1); me->SummonCreature(CREATURE_SUPPRESSER, 4241.539551, 2546.322021, 364.867554, 4.717079, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           urand(0,1); me->SummonCreature(CREATURE_SUPPRESSER, 4241.539551, 2546.322021, 364.867554, 4.717079, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 36000000);
                           summonphase == 0;
                           m_uiSummonTimer = 40000;
                        } else m_uiSummonTimer -= diff;
                     }
                  }

                    if (m_uiPortalTimer <= diff)
                    {
                        // DoScriptText(SAY_OPEN_PORTAL, me);

                        me->SummonCreature(CREATURE_PORTAL, me->GetPositionX()+15, me->GetPositionY()+15, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
                        me->SummonCreature(CREATURE_PORTAL, me->GetPositionX()+10, me->GetPositionY()+25, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
                        me->SummonCreature(CREATURE_PORTAL, me->GetPositionX()+15, me->GetPositionY()-25, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
                        m_uiPortalTimer = 30000;
                    } else m_uiPortalTimer -= diff;

                    if (!bAboveHP && (HealthAbovePct(74)))
                    {
                        // DoScriptText(SAY_ABOVE_75, me);
                        bAboveHP = true;
                    }

                    if (!bBelowHP && (HealthBelowPct(26)))
                    {
                        // DoScriptText(SAY_BELOW_25, me);
                        bBelowHP = true;
                    }

                    if ((HealthAbovePct(99)) && !bEnd)
                    {
                        // DoScriptText(SAY_END, me);
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        me->SetReactState(REACT_PASSIVE);
                        me->RemoveAurasDueToSpell(SPELL_CORRUPTION);

                        bEnd = true;
                    }

                    if(bEnd)
                    {
                        if (m_uiEndTimer <= diff)
                        {
                            switch(m_uiStage)
                            {
                                case 1:
                                    // DoScriptText(SAY_BERSERK , me);
                                    DoCast(me, SPELL_RAGE);
                                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                                    ++m_uiStage;
                                    m_uiEndTimer = 6000;
                                    break;
                                case 2:
                                    {
                                        combat_trigger->ForcedDespawn();
                                        DoCast(me, SPELL_DREAM_SLIP, true);
                                        ++m_uiStage;
                                        m_uiEndTimer = 1000;
                                    }
                                    break;
                                case 3:
                                    //if (pInstance)
                                        //pInstance->SetData(DATA_VALITHRIA_DREAMWALKER_EVENT, DONE);
                                    me->ForcedDespawn();
                                    m_uiEndTimer = 1000;
                                    bEnd = false;
                                    ++m_uiStage;
                                    break;
                            }
                        } else m_uiEndTimer -= diff;
                    }
            }
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new boss_valithriaAI(pCreature);
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
                pInstance = pCreature->GetInstanceScript();
            }

            void InitializeAI()
            {
                DoCast(SPELL_PORTAL_VISUAL);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);

                ScriptedAI::InitializeAI();
            }

            void MoveInLineOfSight(Unit *who)
            {
                if (who->IsControlledByPlayer())
                {
                    if (me->IsWithinDistInMap(who,5.0f))
                    {
                        pPlayer = who;
                        pPlayer->CastSpell(pPlayer, SPELL_DREAM_STATE, false, 0, 0, 0);
                        pPlayer->AddUnitMovementFlag(MOVEMENTFLAG_CAN_FLY);
                        pPlayer->SendMovementFlagUpdate();
                        m_uiStateTimer = 15000;
                        me->ForcedDespawn();
                        me->SummonCreature(CREATURE_CLOUD, me->GetPositionX()-15, me->GetPositionY()+15,me->GetPositionZ()+20, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 20000);
                        me->SummonCreature(CREATURE_CLOUD, me->GetPositionX()+30, me->GetPositionY()-15,me->GetPositionZ()+23, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 20000);
                        me->SummonCreature(CREATURE_CLOUD, me->GetPositionX()-17, me->GetPositionY()+40,me->GetPositionZ()+17, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 20000);
                        me->SummonCreature(CREATURE_CLOUD, me->GetPositionX()+24, me->GetPositionY()-40,me->GetPositionZ()+20, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 20000);
                    }
                }
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiStateTimer <= diff)
                {
                    pPlayer->RemoveAurasDueToSpell(SPELL_DREAM_STATE);
                    pPlayer->RemoveUnitMovementFlag(MOVEMENTFLAG_CAN_FLY);
                    pPlayer->SendMovementFlagUpdate();
                } else m_uiStateTimer -= diff;
            }
        private:
            InstanceScript* pInstance;

            uint32 m_uiStateTimer;
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
                pInstance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                m_uiVolleyTimer = 12000;
                m_uiColumnTimer = 20000;
                m_uiVoidTimer = 30000;
            }

            void EnterCombat(Unit* /*who*/)
            {
                //if (pInstance && pInstance->GetData(DATA_VALITHRIA_DREAMWALKER_EVENT) == NOT_STARTED)
                    //pInstance->SetData(DATA_VALITHRIA_DREAMWALKER_EVENT, IN_PROGRESS);
            }

            void KilledUnit(Unit* /*victim*/)
            {
                // DoScriptText(SAY_PDEATH, pValithria);
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiVolleyTimer <= diff)
                {
                    if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1))
                        DoCast(pTarget, SPELL_VOLLEY);
                    m_uiVolleyTimer = 15000;
                } else m_uiVolleyTimer -= diff;

                if (m_uiVoidTimer <= diff)
                {
                    if(Unit* pTarget = SelectUnit(SELECT_TARGET_TOPAGGRO, 0))
                        me->SummonCreature(CREATURE_VOID, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
                    m_uiVoidTimer = 30000;
                } else m_uiVoidTimer -= diff;

                if (m_uiColumnTimer <= diff)
                {
                    Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
                    if(pTarget && pTarget->GetTypeId() == TYPEID_PLAYER)
                    {
                        DoCast(pTarget, SPELL_COLUMN);
                    }
                    m_uiColumnTimer = 20000;
                } else m_uiColumnTimer -= diff;

                DoMeleeAttackIfReady();
            }
        private:
            InstanceScript* pInstance;

            uint32 m_uiVolleyTimer;
            uint32 m_uiColumnTimer;
            uint32 m_uiVoidTimer;
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
                pInstance = pCreature->GetInstanceScript();
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
            InstanceScript* pInstance;

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
                pInstance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                me->CastSpell(pValithria, SPELL_SUPRESSION, true, 0, 0, 0);
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

            }
        private:
            InstanceScript* pInstance;

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
                pInstance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                DoCast(SPELL_MANA_VOID);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                DoStartNoMovement(me->getVictim());
            }

        private:
            InstanceScript* pInstance;
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
                pInstance = pCreature->GetInstanceScript();
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
            InstanceScript* pInstance;

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
                pInstance = pCreature->GetInstanceScript();
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
            InstanceScript* pInstance;

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
                pInstance = pCreature->GetInstanceScript();
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
                if (me->IsWithinDistInMap(who, 5.0f))
                {
                    DoCast(SPELL_VIGOR);
                    me->AddAura(SPELL_VIGOR, who);
                    me->SetVisible(false);
                    me->Kill(me);


                }
            }

            void UpdateAI(const uint32 diff) { }

        private:
            InstanceScript* pInstance;
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
                pInstance = pCreature->GetInstanceScript();
            }

            void Reset()
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetInCombatWithZone();
                DoStartNoMovement(me->getVictim());
                DoCast(SPELL_COLUMN_AURA);
            }

            void UpdateAI(const uint32 /*uiDiff*/) { }


        private:
            InstanceScript* pInstance;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_icc_column_stalkerAI(pCreature);
        }
};


class npc_icc_trigga_valit : public CreatureScript
{
    public:
        npc_icc_trigga_valit() : CreatureScript("npc_icc_trigga_valit") { }

        struct npc_icc_trigga_valitAI : public ScriptedAI
        {
            npc_icc_trigga_valitAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
                pInstance = pCreature->GetInstanceScript();
            }

            uint8 timer;

            void Reset()
            {
               me->SetVisible(false);
               me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NOT_SELECTABLE);
               timer = 500;
               Valitria_aggro_trigger = 0;
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                    if (timer <= diff)
                    {
                        Valitria_aggro_trigger = 1;
                        timer = 500;

                       if (Valitria_aggro_trigger == 1)
                        {
                            // DoScriptText(SAY_AGGRO, me);


                            Unit* valitria_m = Unit::GetUnit((*me),pValithriaGIUID);
                            combat_trigger = me->SummonCreature(CREATURE_COMBAT_TRIGGER, me->GetPositionX(), me->GetPositionY(),me->GetPositionZ(), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 20000);

                            valitria_m->AddThreat(combat_trigger, 10000000.0f);
                            combat_trigger->AddThreat(valitria_m, 10000000.0f);
                            //valitria_m->AI()->AttackStart(combat_trigger);
                            combat_trigger->AI()->AttackStart(valitria_m);

                            me->Kill(me);
                        }

                    } else timer -= diff;
              }

        private:
            InstanceScript* pInstance;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_icc_trigga_valitAI(pCreature);
        }
};

void AddSC_boss_valithria()
{
    new boss_valithria;
    new npc_skellmage_icc; //not sure
    new npc_fireskell_icc; //not sure
    new npc_dreamportal_icc;
    new npc_suppressor_icc;
    new npc_manavoid_icc;
    new npc_glutabomination_icc;
    new npc_blistzombie_icc;
    new npc_dreamcloud_icc;
    new npc_icc_column_stalker;
    new npc_icc_trigga_valit;
}