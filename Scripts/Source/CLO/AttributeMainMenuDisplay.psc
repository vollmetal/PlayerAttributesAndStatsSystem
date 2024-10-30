Scriptname CLO:AttributeMainMenuDisplay extends TerminalMenu

FormList Property AttributeAVs Auto Const Mandatory

FormList Property TempAttributeChanges Auto Const Mandatory

GlobalVariable Property FreeAttributePoints Auto Const Mandatory

GlobalVariable Property TempFreeAttributePoints Auto Const Mandatory

int Property ConfirmID Auto Const Mandatory

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    Actor player = Game.GetPlayer()

    akTerminalRef.AddTextReplacementValue("FreeAttributePoints", FreeAttributePoints.GetValue())
    int position = 0
    While (position < AttributeAVs.GetSize())
        akTerminalRef.AddTextReplacementValue("A" + position, player.GetValue(AttributeAVs.GetAt(position) as ActorValue) + (TempAttributeChanges.GetAt(position) as GlobalVariable).GetValue())
        position += 1
    EndWhile
    
EndEvent

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    Actor player = Game.GetPlayer()
    
    If (auiMenuItemID == ConfirmID)
        int index = 0
        While (index < AttributeAVs.GetSize())
            FreeAttributePoints.SetValue(FreeAttributePoints.GetValue() - TempFreeAttributePoints.GetValue())
            player.SetValue(AttributeAVs.GetAt(index) as ActorValue, player.GetValue(AttributeAVs.GetAt(index) as ActorValue) + (TempAttributeChanges.GetAt(index) as GlobalVariable).GetValue())
            (TempAttributeChanges.GetAt(index) as GlobalVariable).SetValue(0)
            
            index += 1
        EndWhile
        TempFreeAttributePoints.SetValue(0)
    EndIf
EndEvent