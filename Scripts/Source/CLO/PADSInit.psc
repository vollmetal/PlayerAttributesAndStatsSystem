Scriptname CLO:PADSInit extends ActiveMagicEffect Const

Group Stats
    GlobalVariable Property FreeAttributePoints Auto Const Mandatory
    {Amount of attribute points that haven't been used yet}
    FormList Property AttributeActorValues Auto Const Mandatory
    {FormList containing attribute values}
    FormList Property AttributeGlobals Auto Const Mandatory
    {FormList containing globals}
    GlobalVariable Property AttributeModValue Auto Const Mandatory
    {Global used to modify the chosen attribute so long as FreeAttributePoints is larger than or equal to it}
    GlobalVariable Property AttributeMaxValue Auto Const Mandatory
    {Global used to specify what the max value is for attributes}
EndGroup

Group Messages
    Message Property AttributeMessageBox Auto Const Mandatory
    {Message box for attribute editing and visualisation}
    Message Property AttributeModWindow Auto Const Mandatory
    {Message box allowing you to edit how many points are modified when increasing attributes}
    Message Property AttributeDetailsWindow Auto Const
    {Message box showing details of what each attribute does}
    int[] Property AttributeMainWindowOptionIDs Auto Const Mandatory
    
EndGroup

Potion Property PADSItem Auto Const Mandatory

CLO:AttributeCalculationUpdate Property AttributeCalculation Auto Const

Event OnInit()
    Actor playerRef = Game.GetPlayer()
    
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
    Game.GetPlayer().AddItem(PADSItem)
EndEvent

