using { /Fortnite.com/Devices }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }
using { /Fortnite.com/Characters }

FollowPlayer(Enemy : creative_prop, Player : player)<suspends>:void=
    MoveSpeed := 0.01
    loop:
        Sleep(0.1)
        if (PlayerCharacter := Player.GetFortCharacter[], Enemy.IsValid[]):
            block:
                PropLocation := Enemy.GetTransform().Translation
                PlayerLocation := PlayerCharacter.GetTransform().Translation

                if (LookDirection := (PlayerLocation - PropLocation).MakeUnitVector[]):
                    Yaw := RadiansToDegrees(ArcTan(LookDirection.Y, LookDirection.X)) - 90.0
                    Pitch := 0.0 #RadiansToDegrees(ArcTan(LookDirection.Z, Sqrt((LookDirection.X * LookDirection.X) + (LookDirection.Y * LookDirection.Y)))
                    Roll := 0.0
                    
                    NewRotation := MakeRotationFromYawPitchRollDegrees(Yaw, Pitch, Roll)
                    
                    #MOVEMENT
                    LerpLocation := Lerp(PropLocation, PlayerLocation, MoveSpeed)
                    FinalLocation := vector3{X := LerpLocation.X, Y := LerpLocation.Y, Z := 0.0}

                    if:
                        Enemy.TeleportTo[FinalLocation, NewRotation]


        else:
            break

