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

ObjectReference Property AttributeTerminal Auto Const Mandatory

Potion Property PADSItem Auto Const Mandatory

CLO:AttributeCalculationUpdate Property AttributeCalculation Auto Const

Event OnInit()
    Actor playerRef = Game.GetPlayer()

    AttributeTerminal.Activate(playerRef)
    Game.GetPlayer().AddItem(PADSItem)
EndEvent

