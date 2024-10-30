# PlayerAttributesAndStatsSystem

## Summary

Player Attributes and Stats System (PASS) is a framework developed to be used to add a functioning Actor Value "attribute" or "stat" system to the game Starfield. Included in the framework is an ESM (Elder Scrolls Master) file that contains a quest that handles stat distribution and effects through FormLists that users attach their own FormLists, Actor Values, and Globals to to allow for modders to create complex stat systems that can effect the entire game.

## Files and Functionality

- All functional script files are in Scripts/CLO/ and their source files are in Scripts/Source/CLO.
- Attribute Calculation Update runs after every time stats are changed, such as when the player has finished viewing or modifying stats in the stats menu.
- AttributeDetailMenu is currently unused but will be used to handle any terminal stat windows if/when a workaround for terminals freezing when modifying player spells/magic effects is found.
- AttributeMenuDisplay is also currently unused but will be used to operate the main display hub/OS for the stat viewing and modification terminal if/when a workaround for terminals freezing when modifying player spells/magic effects is found.
- AttributePerkApply is an initialization script attached to a startup quest that applies any perks, spells, and runs any calculations before the startup "leveling" process is initialized.
- Cleaned_GameplayOptions_Script is a slightly cleaned version of the GameplayOptions script that allows GameOptions to be translated to Globals and transfer to new saves from the main menu.
- LevelingScript runs whenever the player levels up and once when the system is installed on a save to apply the proper amount of stat points to the player and notify them about any free stat points they may have. Until the system can be transferred over to using terminals it also opens up the attribute screen on level up and controls what each option in the attribute screen message box does along with running AttributeCalculationUpdate at the end to run all calculations and reset required spells.
- PADSInit handles use of the PAM consumable and opens up the attribute screen message box and handles the same related processes as in LevelingScript. Will be modified to start up the terminal associated with AttributeMenuDisplay when that system is functional.

## SFCSO ESM functionality

ALL FORMS IN THE MAIN ESM HAVE THE CLO_ PREFIX TO ASSIST WITH FINDING THEM. THIS IS THE PREFIX FOR THE SYSTEM FORMS.

- All functionality currently runs through 2 methods: Quests and the PAM item.

### Quest Functionality

- AttributePerkApply runs the script of the same name on initial startup. This uses the CLO_AttributePerksList FormList to pull from for adding perks to the player and the PAMS consumable object for accessing the attribute menus.
- GameSettingsHandler does exactly what it says.
- LevelingScript is run at level up and runs the script of the same name. It contains all FormLists required for each section of the system to function and currently settings for the attribute window message boxes.
- LevelInit is the same but it runs once on startup to give the player their starting attribute points.

### Consumable "Potion" Functionality

- PersonalAttributeDataSystem contains a Script MagicEffect that runs PADSInit and contains the required FormLists to handle modifying attributes currently.

### FormLists

All FormLists are used to allow for easy extension of systems. All of these FormLists can be extended by making your own FormList and using the "Add To List" function from the new list to point to the one you want to add it to.

- AttributeActorValues contains all ActorValues used by the system as player attributes. Add a FormList containing Actor Values to it for the system to see those Actor Values as attributes to modify.
- AttributeGlobals contains all Globals used by the system as player attributes. The system will convert all Actor Values in AttributeActorValues to these Globals for use with more of CE2's systems. Must have the same arrangement as AttributeActorValues currently. (Working on improving modability)
- AttributePerksList contains all Perks to be added and used by the system.
- AttributeSpellList contains all spells to be added and used by the system. These spells will be removed and readded whenever attribute changes are registered so that they have the proper magnitudes. These spells are also used to run Magic Effects to display information about the system such as attribute counts and attribute effects.

### Globals

- Every attribute must have a global to function
- Included with the base system are globals for: All SPECIAL attributes in the base CE2 engine
- FreeAttributePoints is the global currently used to hold how many attribute points the player has to spend.
- AttributePointsPerLevelUp determines how many attribute points the player gets during level up. This can be modified by the player by going into the game settings and changing AttributePointsPerLevelSetting. These are mapped 1:1 with each other
