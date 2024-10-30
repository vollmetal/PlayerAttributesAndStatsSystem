Scriptname CLO:LevelingScript extends Quest

Group Stats
    GlobalVariable Property AttributePointsPerLevelUp Auto Const Mandatory
    {Amount of attribute points gained per level up}
    GlobalVariable Property FreeAttributePoints Auto Const Mandatory
    {Amount of attribute points that haven't been used yet}
    GlobalVariable Property AttributeModValue Auto Const Mandatory
    {Global used to modify the chosen attribute so long as FreeAttributePoints is larger than or equal to it}
    GlobalVariable Property AttributeMaxValue Auto Const Mandatory
    {Global used to specify what the max value is for attributes}    
    FormList Property AttributeActorValues Auto Const Mandatory
    {FormList containing attribute values}
    FormList Property AttributeGlobals Auto Const Mandatory
    {FormList containing globals}
    GlobalVariable Property LastCheckedLevel Auto Const Mandatory
    {The global keeping track of the last time this script has run}
    GlobalVariable Property StartingPoints Auto Const Mandatory
    {Global holding the amount of points for the player to get at the start of the game. Only works if GameInitQuest = true}
    bool Property GameInitQuest = false Auto Const Mandatory
    {Whether the quest this script is a part of is run at the start of a new game or every level up}
EndGroup

Group Messages
    Message Property LevelUpPopup Auto Const Mandatory
    {Message used as a quick popup if level up messages are turned off}
    Message Property AttributeMessageBox Auto Const Mandatory
    {Message box for attribute editing and visualisation}
    Message Property AttributeModWindow Auto Const Mandatory
    {Message box allowing you to edit how many points are modified when increasing attributes}
    Message Property AttributeDetailsWindow Auto Const
    {Message box showing details of what each attribute does}

    int[] Property AttributeMainWindowOptionIDs Auto Const Mandatory

    GameplayOption Property DisplayAttributeMessageOnLevel Auto Const Mandatory
    {GameplayOption determining whether the attribute window displays immediately on level up when not in combat}
EndGroup

CLO:AttributeCalculationUpdate Property AttributeCalculation Auto Const

Event OnQuestStarted()
    Actor playerRef = Game.GetPlayer()
    int playerLevel = playerRef.GetLevel()

    int levelDifference = playerLevel - LastCheckedLevel.GetValue() as int
    LastCheckedLevel.SetValue(playerLevel as float)
    

    ;apply new attribute points to spend
    If (GameInitQuest)
        FreeAttributePoints.SetValue(StartingPoints.GetValue())
        int index = 0
        While (index < AttributeActorValues.GetSize())
            playerRef.SetValue(AttributeActorValues.GetAt(index) as ActorValue, 1)
            index += 1
        EndWhile
    EndIf
    
    If (playerLevel > 1)
        FreeAttributePoints.SetValue(FreeAttributePoints.GetValue() + (AttributePointsPerLevelUp.GetValue() * (levelDifference as float)))
    EndIf
    
    
    LevelUpPopup.Show(FreeAttributePoints.GetValue())

    While (playerRef.GetCombatState() == 1)
        Utility.Wait(0.1)
    EndWhile

    
    
    If (DisplayAttributeMessageOnLevel.GetValue() == 1.0)
    bool closeAttributeMenu = false
        While (!closeAttributeMenu)
            float properAttributeMod = AttributeModValue.GetValue()
            If (properAttributeMod > FreeAttributePoints.GetValue())
                properAttributeMod = FreeAttributePoints.GetValue()
            EndIf
            
            int chosenOption = AttributeMessageBox.Show(FreeAttributePoints.GetValue(), properAttributeMod, playerRef.GetValue(AttributeActorValues.GetAt(0) as ActorValue), playerRef.GetValue(AttributeActorValues.GetAt(1) as ActorValue), playerRef.GetValue(AttributeActorValues.GetAt(2) as ActorValue), playerRef.GetValue(AttributeActorValues.GetAt(3) as ActorValue), playerRef.GetValue(AttributeActorValues.GetAt(4) as ActorValue), playerRef.GetValue(AttributeActorValues.GetAt(5) as ActorValue), playerRef.GetValue(AttributeActorValues.GetAt(6) as ActorValue))
            
            If (chosenOption == AttributeMainWindowOptionIDs[0])
                playerRef.ModValue(AttributeActorValues.GetAt(0) as ActorValue, properAttributeMod)
                If (playerRef.GetValue(AttributeActorValues.GetAt(0) as ActorValue) > AttributeMaxValue.GetValue())
                    playerRef.SetValue(AttributeActorValues.GetAt(0) as ActorValue, AttributeMaxValue.GetValue())
                EndIf
                FreeAttributePoints.SetValue(FreeAttributePoints.GetValue() - properAttributeMod)
                (AttributeGlobals.GetAt(0) as GlobalVariable).SetValue(playerRef.GetValue(AttributeActorValues.GetAt(0) as ActorValue))
                
                
            EndIf
            If (chosenOption == AttributeMainWindowOptionIDs[1])
                playerRef.ModValue(AttributeActorValues.GetAt(1) as ActorValue, properAttributeMod)
                If (playerRef.GetValue(AttributeActorValues.GetAt(1) as ActorValue) > AttributeMaxValue.GetValue())
                    playerRef.SetValue(AttributeActorValues.GetAt(1) as ActorValue, AttributeMaxValue.GetValue())
                EndIf
                FreeAttributePoints.SetValue(FreeAttributePoints.GetValue() - properAttributeMod)
                (AttributeGlobals.GetAt(1) as GlobalVariable).SetValue(playerRef.GetValue(AttributeActorValues.GetAt(1) as ActorValue))
            EndIf
            If (chosenOption == AttributeMainWindowOptionIDs[2])
                playerRef.ModValue(AttributeActorValues.GetAt(2) as ActorValue, properAttributeMod)
                If (playerRef.GetValue(AttributeActorValues.GetAt(2) as ActorValue) > AttributeMaxValue.GetValue())
                    playerRef.SetValue(AttributeActorValues.GetAt(2) as ActorValue, AttributeMaxValue.GetValue())
                EndIf
                FreeAttributePoints.SetValue(FreeAttributePoints.GetValue() - properAttributeMod)
                (AttributeGlobals.GetAt(2) as GlobalVariable).SetValue(playerRef.GetValue(AttributeActorValues.GetAt(2) as ActorValue))
            EndIf
            If (chosenOption == AttributeMainWindowOptionIDs[3])
                playerRef.ModValue(AttributeActorValues.GetAt(3) as ActorValue, properAttributeMod)
                If (playerRef.GetValue(AttributeActorValues.GetAt(3) as ActorValue) > AttributeMaxValue.GetValue())
                    playerRef.SetValue(AttributeActorValues.GetAt(3) as ActorValue, AttributeMaxValue.GetValue())
                EndIf
                FreeAttributePoints.SetValue(FreeAttributePoints.GetValue() - properAttributeMod)
                (AttributeGlobals.GetAt(3) as GlobalVariable).SetValue(playerRef.GetValue(AttributeActorValues.GetAt(3) as ActorValue))
            EndIf
            If (chosenOption == AttributeMainWindowOptionIDs[4])
                playerRef.ModValue(AttributeActorValues.GetAt(4) as ActorValue, properAttributeMod)
                If (playerRef.GetValue(AttributeActorValues.GetAt(4) as ActorValue) > AttributeMaxValue.GetValue())
                    playerRef.SetValue(AttributeActorValues.GetAt(4) as ActorValue, AttributeMaxValue.GetValue())
                EndIf
                FreeAttributePoints.SetValue(FreeAttributePoints.GetValue() - properAttributeMod)
                (AttributeGlobals.GetAt(4) as GlobalVariable).SetValue(playerRef.GetValue(AttributeActorValues.GetAt(4) as ActorValue))
            EndIf
            If (chosenOption == AttributeMainWindowOptionIDs[5])
                playerRef.ModValue(AttributeActorValues.GetAt(5) as ActorValue, properAttributeMod)
                If (playerRef.GetValue(AttributeActorValues.GetAt(5) as ActorValue) > AttributeMaxValue.GetValue())
                    playerRef.SetValue(AttributeActorValues.GetAt(5) as ActorValue, AttributeMaxValue.GetValue())
                EndIf
                FreeAttributePoints.SetValue(FreeAttributePoints.GetValue() - properAttributeMod)
                (AttributeGlobals.GetAt(5) as GlobalVariable).SetValue(playerRef.GetValue(AttributeActorValues.GetAt(5) as ActorValue))
            EndIf
            If (chosenOption == AttributeMainWindowOptionIDs[6])
                playerRef.ModValue(AttributeActorValues.GetAt(6) as ActorValue, properAttributeMod)
                If (playerRef.GetValue(AttributeActorValues.GetAt(6) as ActorValue) > AttributeMaxValue.GetValue())
                    playerRef.SetValue(AttributeActorValues.GetAt(6) as ActorValue, AttributeMaxValue.GetValue())
                EndIf
                FreeAttributePoints.SetValue(FreeAttributePoints.GetValue() - properAttributeMod)
                (AttributeGlobals.GetAt(6) as GlobalVariable).SetValue(playerRef.GetValue(AttributeActorValues.GetAt(6) as ActorValue))
            EndIf
            If (chosenOption == AttributeMainWindowOptionIDs[7])
                bool attributeModWindowOpen = true
                While (attributeModWindowOpen)
                    int attributeOption = AttributeModWindow.Show(AttributeModValue.GetValue())
                    If (attributeOption == 0)
                        AttributeModValue.SetValue(AttributeModValue.GetValue() + 1)
                    EndIf
                    If (attributeOption == 1)
                        AttributeModValue.SetValue(AttributeModValue.GetValue() - 1)
                    EndIf
                    If (attributeOption == 2)
                        attributeModWindowOpen = false
                    EndIf
                EndWhile           
            EndIf
            If (chosenOption == AttributeMainWindowOptionIDs[8])
                AttributeCalculation.Start()
                closeAttributeMenu = true           
            EndIf
            If (chosenOption == AttributeMainWindowOptionIDs[9])
                AttributeDetailsWindow.Show()          
            EndIf
        EndWhile
            
    EndIf
    Stop()
EndEvent
