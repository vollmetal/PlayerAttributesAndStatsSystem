Scriptname FLA:FalloutAttributeBonusManager extends CLO:AttributeCalculationUpdate



Event OnInit()
    UpdateAttributeBonuses()
    Stop()    
EndEvent

Function UpdateAttributeBonuses()
    Actor player = Game.GetPlayer()

    int x = 0
    While (x < AttributeBseGlobals.GetSize())
        (AttributeBseGlobals.GetAt(x) as GlobalVariable).SetValue(player.GetValue(AttributeAVs.GetAt(x) as ActorValue))
        x += 1
    EndWhile

    int attribute = 0
    While (attribute < AttributeBonusGlobals.Length)
        
        If (attribute == 0)
        GlobalVariable strengthBaseGlobal = AttributeBseGlobals.GetAt(attribute) as GlobalVariable
        GlobalVariable carryWeightBonus = AttributeBonusGlobals[attribute].GetAt(0) as GlobalVariable

        carryWeightBonus.SetValue(strengthBaseGlobal.GetValue() * (AttributeBonusModifierGlobals[attribute].GetAt(0) as GlobalVariable).GetValue())
            
        EndIf
        If (attribute == 1)
            GlobalVariable perceptionBaseGlobal = AttributeBseGlobals.GetAt(attribute) as GlobalVariable
            GlobalVariable swayBonusDisplayGlobal = AttributeBonusGlobals[attribute].GetAt(0) as GlobalVariable
            float modifiedAV = perceptionBaseGlobal.GetValue()/10

            ;Set Actor Values that govern perk bonus
            player.SetValue(AttributeBonusActorValues[attribute].GetAt(0) as ActorValue, 1 + ((modifiedAV * 5) * 0.01))

            ;Set global for magic effect display
            swayBonusDisplayGlobal.SetValue(modifiedAV * 5)
        EndIf
        If (attribute == 2)
            GlobalVariable enduranceBaseGlobal = AttributeBseGlobals.GetAt(attribute) as GlobalVariable

            GlobalVariable healthBonusGlobal = AttributeBonusGlobals[attribute].GetAt(0) as GlobalVariable
            GlobalVariable healthBonusModGlobal = AttributeBonusModifierGlobals[attribute].GetAt(0) as GlobalVariable

            healthBonusGlobal.SetValue((enduranceBaseGlobal.GetValue() * healthBonusModGlobal.GetValue())  * player.GetLevel())
        EndIf
        If (attribute == 3)
            GlobalVariable charismaBaseGlobal = AttributeBseGlobals.GetAt(attribute) as GlobalVariable
            GlobalVariable buyPriceDisplayGlobal = AttributeBonusGlobals[attribute].GetAt(0) as GlobalVariable
            GlobalVariable sellPriceDisplayGlobal = AttributeBonusGlobals[attribute].GetAt(1) as GlobalVariable
            float modifiedAV = charismaBaseGlobal.GetValue()/10

            ;Set Actor Values that govern perk bonus
            player.SetValue(AttributeBonusActorValues[attribute].GetAt(0) as ActorValue, 1 - ((modifiedAV * 5) * 0.01))
            player.SetValue(AttributeBonusActorValues[attribute].GetAt(1) as ActorValue, 1 + ((modifiedAV * 5) * 0.01))

            ;Set global for magic effect display
            buyPriceDisplayGlobal.SetValue(modifiedAV * 5)
            sellPriceDisplayGlobal.SetValue(modifiedAV * 5)
            
        EndIf
        If (attribute == 4)
            GlobalVariable intelligenceBaseGlobal = AttributeBseGlobals.GetAt(attribute) as GlobalVariable
            GlobalVariable craftingCostDisplayGlobal = AttributeBonusGlobals[attribute].GetAt(0) as GlobalVariable
            float modifiedAV = intelligenceBaseGlobal.GetValue()/10

            ;Set Actor Values that govern perk bonus
            player.SetValue(AttributeBonusActorValues[attribute].GetAt(0) as ActorValue, 1 + ((modifiedAV * 5) * 0.01))
            ;Set global for magic effect display
            craftingCostDisplayGlobal.SetValue(modifiedAV * 5)
            
        EndIf
        If (attribute == 5)
            GlobalVariable agilityBaseGlobal = AttributeBseGlobals.GetAt(attribute) as GlobalVariable
            GlobalVariable accuracyBonusDisplayGlobal = AttributeBonusGlobals[attribute].GetAt(1) as GlobalVariable
            float modifiedAV = agilityBaseGlobal.GetValue()/10

            GlobalVariable speedBonusGlobal = AttributeBonusGlobals[attribute].GetAt(0) as GlobalVariable
            GlobalVariable speedBonusModGlobal = AttributeBonusModifierGlobals[attribute].GetAt(0) as GlobalVariable
            If (speedBonusGlobal.GetValue() < 0.5)
                speedBonusGlobal.SetValue(agilityBaseGlobal.GetValue() * speedBonusModGlobal.GetValue())
            Else
                speedBonusGlobal.SetValue(0.5)
            EndIf

            ;Set Actor Values that govern perk bonus
            player.SetValue(AttributeBonusActorValues[attribute].GetAt(0) as ActorValue, 1 - ((modifiedAV * 5) * 0.01))
            player.SetValue(AttributeBonusActorValues[attribute].GetAt(1) as ActorValue, 1 - ((modifiedAV * 5) * 0.01))
            ;Set global for magic effect display
            accuracyBonusDisplayGlobal.SetValue(modifiedAV * 5)
        EndIf
        If (attribute == 6)
            GlobalVariable luckBaseGlobal = AttributeBseGlobals.GetAt(attribute) as GlobalVariable
            GlobalVariable critChanceBonusDisplayGlobal = AttributeBonusGlobals[attribute].GetAt(0) as GlobalVariable
            float modifiedAV = luckBaseGlobal.GetValue()/10

            ;Set Actor Values that govern perk bonus
            player.SetValue(AttributeBonusActorValues[attribute].GetAt(0) as ActorValue, modifiedAV * 5)

            ;Set global for magic effect display
            critChanceBonusDisplayGlobal.SetValue(modifiedAV * 5)
            
        EndIf
        attribute += 1
    EndWhile
    int index = 0
    While (index < SpellEffectList.GetSize())
        int timeoutIterations = 0
        Spell spellToApply = SpellEffectList.GetAt(index) as Spell

        player.removeSpell(spellToApply)
        Utility.wait(0.2)
        player.addSpell(spellToApply)
        index += 1
    EndWhile
    
EndFunction