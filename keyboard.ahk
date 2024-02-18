#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;//////////////////////////////////////////////////////////////
; initialization
; env variables
;//////////////////////////////////////////////////////////////
#SingleInstance Force ; Allow only one running instance of script.
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:

kbd_layer := 0
;//////////////////////////////////////////////////////////////
; env variables
;//////////////////////////////////////////////////////////////
mouse_move_max_distance := 50
mouse_move_accelation_ratio := 0.05
mouse_move_distance_start := 2
mouse_move_distance := mouse_move_distance_start
tooltip_duration := 2000

noti_type := 1
noti_x := A_ScreenWidth//2-400
noti_y := A_ScreenHeight//2-100

;//////////////////////////////////////////////////////////////
; notications
;//////////////////////////////////////////////////////////////i
RemoveToolTip:
ToolTip
return
RemoveSplash:
SplashImage,Off
return
SetLayer(num){
  global kbd_layer
  global noti_type
  kbd_layer := num
}
return

CapsLock::LControl

$LControl:: ; short tap trigger
  Send,{LControl Down} 
  KeyWait, LControl, t0.30 ; t0.x = short click time
  If ErrorLevel  {
    KeyWait, LControl
  }
  Else If(A_PriorKey = "LControl") { ;check prior key
    SetLayer(0)
  }
  Send,{LControl Up}
  Return

$Lshift:: ; short tap trigger
  Send,{Lshift Down} 
  KeyWait, Lshift, t0.30 ; t0.x = short click time
  If ErrorLevel  {
    KeyWait, Lshift
  }
  Else If(A_PriorKey = "LShift") { ;check prior key
    SetLayer(1)
  }
  Send,{Lshift Up}
  Return

;//////////////////////////////////////////////////////////////
; layer 1 commands
;//////////////////////////////////////////////////////////////
#If kbd_layer=1
  !u::LButton
  !o::RButton
  !p::MButton
  !y::WheelUp
  !h::WheelDown
  !j:: ; left
  !i:: ; up
  !k:: ; down
  !l:: ; right
  global mouse_move_last
  global mouse_move_distance
  mouse_move_interval := A_TickCount - mouse_move_last
  ;ToolTip, %mouse_move_distance% . %mouse_move_last% . %mouse_move_interval%
  If(mouse_move_interval < 100)   {
    if(mouse_move_distance  < mouse_move_max_distance){
      mouse_move_distance := (mouse_move_max_distance-mouse_move_distance)*mouse_move_accelation_ratio + mouse_move_distance  
    }
  } Else{
    mouse_move_distance := mouse_move_distance_start
  }
    
  mouse_move_x := GetKeyState("l","P")*mouse_move_distance -GetKeyState("j","P")*mouse_move_distance 
  mouse_move_y := GetKeyState("k","P")*mouse_move_distance -GetKeyState("i","P")*mouse_move_distance 
  MouseMove, %mouse_move_x%, %mouse_move_y% , 0, R
  mouse_move_last := A_TickCount
  return
  e::=
  s::*
  d::/
  r::-
  f::+
  t::(
  g::)
  i::Up
  k::Down
  j::Left
  l::Right
  y::Home
  u::End
  9::PgUp
  o::PgDn 
  7::PrintScreen
  h::Backspace
  n::Delete
  m::AppsKey
  q::Escape
  '::Escape
return 