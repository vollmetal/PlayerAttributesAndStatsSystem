Scriptname CLO:AttributeCalculationUpdate extends Quest

FormList Property AttributeAVs Auto Const Mandatory
{Actor Values containing all attributes}

FormList Property AttributeBseGlobals Auto Const Mandatory
{Globals containing all attributes}
FormList[] Property AttributeBonusGlobals Auto Const Mandatory
{Globals containing all bonuses derived from each attribute
Organized by position of the attribute (0 is strength bonuses, 1 is perception bonuses, etc)}

FormList[] Property AttributeBonusActorValues Auto Const Mandatory
{Actor Values containing all bonuses derived from each attribute
Organized by position of the attribute (0 is strength bonuses, 1 is perception bonuses, etc)}

FormList[] Property AttributeBonusModifierGlobals Auto Const Mandatory
{Globals that are used to modify the attributes in equations (5hp per level and 1% or 0.01 bonus speed per agility point for examples)
Uses the same organization as AttributeBonusGlobals}

Message Property AttributeMenuMessage Auto Const Mandatory

FormList Property SpellEffectList Auto Const
{Formlist containing spells/abilities that define some attribute effects}

int Property ConfirmOption Auto Const Mandatory

Event OnInit()
    Stop()
EndEvent