/*
 * Copyright (C) 2009 - 2010 WoW-ALive <http://www.wow-alive.de/>
 */

#include "ScriptPCH.h"
#include "icecrown_citadel.h"
#include "ScriptedEscortAI.h"

enum Yells
{
SAY_AGGRO                  = -1666025,
SAY_DEATH                  = -1666023,
SAY_DEATH_2                = -1666025,
SAY_KILLING                = -1666020,
SAY_KILLING_2              = -1666021, 
SAY_BERSERK                = -1666022,
SAY_SLIME_SPRAY            = -1666016,
SAY_EXPLOSION              = -1666017,

};

enum Creatures
{
CREATURE_OOZE_BIG             = 36899,
CREATURE_LITTLE_OOZE          = 36897,
CREATURE_PROFFESOR_PUTRICIDE  = 36678,
};

enum RotfaceSpells
{
SPELL_OOZE_FLOOD           = 71215,
SPELL_SLIME_SPRAY          = 71213,
SPELL_MUTATED_INFECTION    = 71224,
};

enum OozeSpells
{
SPELL_STICKY_OOZE          = 71208,
SPELL_RADIATING_OOZE       = 71212,
SPELL_UNSTABLE_OOZE        = 69558,
SPELL_UNSTABLE_EXPLOSION   = 71209,
};

uint64 OOZ;
uint64 BIG_OOZ;

Creature* pProfessor_Putricide;

class boss_rotface : public CreatureScript
{
    public:
        boss_rotface() : CreatureScript("boss_rotface") { }

        struct boss_rotfaceAI : public BossAI
        {
            boss_rotfaceAI(Creature* pCreature) : BossAI(pCreature, DATA_ROTFACE)
            {
            }

	uint32 m_uiOozeFloodTimer;
	uint32 m_uiSlimeSprayTimer;
	uint32 m_uiMutatedInfectionTimer;
    uint32 m_uiBerserkTimer;
    uint32 m_uiSummonBigTimer;
    uint32 m_uiSummonLittleTimer;

    void Reset()
    {
	m_uiOozeFloodTimer = 12000+rand()%3000;
	m_uiSlimeSprayTimer = 20000+rand()%2000;
	m_uiMutatedInfectionTimer = 6000+rand()%4000;
       m_uiBerserkTimer = 300000;
	m_uiSummonLittleTimer = 15000; // not officially ?
	m_uiSummonBigTimer = 5000; // not officially

       BIG_OOZ = 0;
       OOZ = 0;

		if(instance)
		instance->SetData(DATA_ROTFACE, NOT_STARTED);  
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, me);
        DoScriptText(SAY_DEATH_2, pProfessor_Putricide);
              
          if (BIG_OOZ != 0)
          {
              Unit* m_big_ooz = Unit::GetUnit((*me),BIG_OOZ);
              me->Kill(m_big_ooz);
          }

		if(instance)
		instance->SetData(DATA_ROTFACE, DONE);  
    }

    void EnterCombat(Unit* who)
    {
		DoScriptText(SAY_AGGRO, me);
    }

    void JustReachedHome()
    {
		if(instance)
		instance->SetData(DATA_ROTFACE, FAIL);  
    }

    void KilledUnit(Unit *victim)
    {
        DoScriptText(SAY_KILLING, me);
        DoScriptText(SAY_KILLING_2, me);
    }

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

            if (m_uiSummonLittleTimer<= diff)  
            { 
                 me->SummonCreature(36897, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);

                m_uiSummonLittleTimer = 23000+rand()%4000; 
            }  
            else m_uiSummonLittleTimer -= diff;

            if (m_uiSummonBigTimer<= diff)  
            { 
                 OOZ = 0;
                 me->SummonCreature(36899, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);

                m_uiSummonBigTimer = 36000000; 
            }  
            else m_uiSummonBigTimer -= diff;

		if (m_uiOozeFloodTimer <= diff)
		{
			DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true), 71215);
			m_uiOozeFloodTimer = 12000+rand()%3000;
		} else m_uiOozeFloodTimer -= diff;

		if (m_uiSlimeSprayTimer <= diff)
		{
			DoScriptText(SAY_SLIME_SPRAY, me);
			DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true), 71213);
			m_uiSlimeSprayTimer = 20000+rand()%2000;
		} else m_uiSlimeSprayTimer -= diff;

		if (m_uiMutatedInfectionTimer <= diff)
		{
			DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true), 71213);
			m_uiMutatedInfectionTimer = 6000+rand()%4000;
		} else m_uiMutatedInfectionTimer -= diff;

		if (m_uiBerserkTimer <= diff)
		{
                  DoScriptText(SAY_BERSERK, me);
			//DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true), 47008);
                     DoCast(me, SPELL_BERSERK);
			m_uiBerserkTimer = 360000;
		} else m_uiBerserkTimer -= diff;

		DoMeleeAttackIfReady();
	}
};

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new boss_rotfaceAI(pCreature);
        }
};




class npc_ooze_big : public CreatureScript
{
    public:
        npc_ooze_big() : CreatureScript("npc_big_ooze") { }

        struct npc_ooze_bigAI : public ScriptedAI
        {
            npc_ooze_bigAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
            }
    
	uint32 m_uiStickyOozeTimer;
	uint32 m_uiRadiatingOozeTimer;
	uint32 m_uiUnstableOozeTimer;
      uint32 m_uiUnstableExplosionTimer;

    void Reset()
    {
	m_uiStickyOozeTimer = 5000+rand()%3000;
	m_uiRadiatingOozeTimer = 7000+rand()%2000;
      m_uiUnstableOozeTimer = 4000;
      m_uiUnstableExplosionTimer = 20000;
      BIG_OOZ = me->GetGUID();
    }

    void EnterCombat(Unit* who)
    {
    }

    void KilledUnit(Unit *victim)
    {
    }

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (m_uiStickyOozeTimer <= diff)
		{
			DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true), 71208);
			m_uiStickyOozeTimer = 5000+rand()%3000;
		} else m_uiStickyOozeTimer -= diff;

		if (m_uiRadiatingOozeTimer <= diff)
		{
			DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true), 71212);
			m_uiRadiatingOozeTimer = 360000;
		} else m_uiRadiatingOozeTimer -= diff;

		if (m_uiUnstableOozeTimer <= diff)
		{
			DoCast(me, 69558);
			 m_uiUnstableOozeTimer = 4000;
		} else m_uiUnstableOozeTimer -= diff;

		if (m_uiUnstableExplosionTimer <= diff)
		{
			DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true), 71212);
			m_uiUnstableExplosionTimer = 20000;
		} else m_uiUnstableExplosionTimer -= diff;

              Unit* m_ooz = Unit::GetUnit((*me),OOZ);

              if (me->IsWithinMeleeRange(m_ooz))
                 {
                    m_ooz->Kill(m_ooz);
                    m_ooz->SetVisible(false);
                 }

		DoMeleeAttackIfReady();
	}
};

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_ooze_bigAI(pCreature);
        }
};



class npc_ooze_little : public CreatureScript
{
    public:
        npc_ooze_little() : CreatureScript("npc_little_ooze") { }

        struct npc_ooze_littleAI : public ScriptedAI
        {
            npc_ooze_littleAI(Creature* pCreature) : ScriptedAI(pCreature)
            {
            }

	uint32 m_uiStickyOozeTimer;
	uint32 m_uiRadiatingOozeTimer;
	uint32 m_uiVereinigenTimer;

    void Reset()
    {
	m_uiStickyOozeTimer = 5000+rand()%2000;
	m_uiRadiatingOozeTimer = 6000+rand()%3000;

       m_uiVereinigenTimer = 500;
    }

    void EnterCombat(Unit* who)
    {
    }

    void KilledUnit(Unit *victim)
    {
    }

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (m_uiStickyOozeTimer <= diff)
		{
			DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true), 71208);
			m_uiStickyOozeTimer = 5000+rand()%3000;
		} else m_uiStickyOozeTimer -= diff;

		if (m_uiRadiatingOozeTimer <= diff)
		{
			DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true), 71210);
			m_uiRadiatingOozeTimer = 360000;
		} else m_uiRadiatingOozeTimer -= diff;

		if (m_uiVereinigenTimer <= diff)
		   {
                        OOZ = me->GetGUID();
		          m_uiVereinigenTimer = 36000000;
		   } else m_uiVereinigenTimer -= diff;
	
		DoMeleeAttackIfReady();
	}
};
        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_ooze_littleAI(pCreature);
        }
};



void AddSC_boss_rotface()
{
    new boss_rotface();
    new npc_ooze_big();
    new npc_ooze_little();
}



