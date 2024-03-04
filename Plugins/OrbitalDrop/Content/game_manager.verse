
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
game_manager := class(creative_device):
    
    @editable var Enemies : []creative_prop = array{}
    @editable var DamagePads : []creative_prop = array{}
    
    var Players : []player = array{}
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitPlayers()
        InitEnemies()


    InitPlayers():void=
        set Players = GetPlayspace().GetPlayers()

    InitEnemies():void=
        if (Player := Players[0]):
            for(X := 0..Enemies.Length - 1):
                if (Enemy := Enemies[X]):
                    spawn:
                        FollowPlayer(Enemy, Player)
