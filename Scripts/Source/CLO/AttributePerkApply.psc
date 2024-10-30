Scriptname CLO:AttributePerkApply extends Quest

FormList Property AttributePerks Auto Const Mandatory

Potion Property PADSObject Auto Const

Event OnQuestStarted()
    Actor player = Game.GetPlayer()
    int position = 0
    While (position < AttributePerks.GetSize())
        player.AddPerk(AttributePerks.GetAt(position) as Perk)
        
        position += 1
    EndWhile
    player.AddItem(PADSObject)    
    
EndEvent

