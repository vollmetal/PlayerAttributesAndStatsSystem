Scriptname CLO:AttributeDetailMenu extends TerminalMenu
{Handles the attribute detail screen for an attribute in the PADS, allowing for modifying the specified attribute and hooking into further calculations}

Group GlobalPlayerData
    GlobalVariable Property FreeAttributePoints Auto Const Mandatory
    {Free attribute points, used up to increase the AttributeAV/TempAttributeGlobal}

    GlobalVariable Property TempFreeAttributePoints Auto Const Mandatory
    {Free attribute points, used up to increase the AttributeAV/TempAttributeGlobal}
EndGroup

Group AttributeBaseData
    ActorValue Property AttributeAV Auto Const Mandatory
    {Actor value for the attribute}

    GlobalVariable Property TempAttributeGlobal Auto Const Mandatory
    {Global for the attribute, for usability with magic effects and other data side effects.}
EndGroup

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    Actor player = Game.GetPlayer()
    akTerminalRef.AddTextReplacementValue("FreeAttributePoints", FreeAttributePoints.GetValue() - TempFreeAttributePoints.GetValue())
    akTerminalRef.AddTextReplacementValue("Attribute", player.GetValue(AttributeAV) + TempAttributeGlobal.GetValue())
    
EndEvent

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    Actor player = Game.GetPlayer()
    If (auiMenuItemID == 1)
        player.ModValue(AttributeAV, 1)
        TempFreeAttributePoints.SetValue(TempFreeAttributePoints.GetValue() + 1)
        TempAttributeGlobal.SetValue(TempAttributeGlobal.GetValue() + 1)
        akTerminalRef.AddTextReplacementValue("FreeAttributePoints", FreeAttributePoints.GetValue() - TempFreeAttributePoints.GetValue())
        akTerminalRef.AddTextReplacementValue("Attribute", player.GetValue(AttributeAV) + TempAttributeGlobal.GetValue())
        
    EndIf
    If (auiMenuItemID == 2)
        player.ModValue(AttributeAV, 1)
        TempFreeAttributePoints.SetValue(TempFreeAttributePoints.GetValue() - 1)
        TempAttributeGlobal.SetValue(TempAttributeGlobal.GetValue() - 1)
        akTerminalRef.AddTextReplacementValue("FreeAttributePoints", FreeAttributePoints.GetValue() - TempFreeAttributePoints.GetValue())
        akTerminalRef.AddTextReplacementValue("Attribute", player.GetValue(AttributeAV) + TempAttributeGlobal.GetValue())
        
    EndIf
EndEvent