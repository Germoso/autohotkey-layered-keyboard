; -------------------------
; Configuración de capas
; -------------------------

; Variable para rastrear si la capa está activa
LayerActive := false

; Activa o desactiva la capa con CapsLock
CapsLock::
    LayerActive := !LayerActive ; Cambia el estado
    if (LayerActive) {
        TrayTip, Capa ActivUUUOOUOUOUOada, La capa de funciones está activa., 1
    } else {
        TrayTip, Capa Desactivada, La capa de funciones está desactivada., 1
    }
    return

; -------------------------
; Funciones de la capa
; -------------------------

#If LayerActive ; Solo activa estas funciones cuando la capa está activa

; Mapeo de teclas básicas
i::Send, {Up}      ; La tecla 'i' envía la flecha hacia arriba
j::Send, {Left}    ; La tecla 'j' envía la flecha hacia la izquierda
k::Send, {Down}    ; La tecla 'k' envía la flecha hacia abajo
l::Send, {Right}   ; La tecla 'l' envía la flecha hacia la derecha
o::Send, {End}     ; La tecla 'o' envía la tecla End
u::Send, {Home}    ; La tecla 'u' envía la tecla Home

; Teclas con Shift
+i::Send, +{Up}      ; Shift + i envía Shift + Flecha Arriba
+j::Send, +{Left}    ; Shift + j envía Shift + Flecha Izquierda
+k::Send, +{Down}    ; Shift + k envía Shift + Flecha Abajo
+l::Send, +{Right}   ; Shift + l envía Shift + Flecha Derecha
+o::Send, +{End}     ; La tecla 'o' envía la tecla End
+u::Send, +{Home}    ; La tecla 'u' envía la tecla Home

; Teclas con Control
^i::Send, ^{Up}      ; Ctrl + i envía Ctrl + Flecha Arriba
^j::Send, ^{Left}    ; Ctrl + j envía Ctrl + Flecha Izquierda
^k::Send, ^{Down}    ; Ctrl + k envía Ctrl + Flecha Abajo
^l::Send, ^{Right}   ; Ctrl + l envía Ctrl + Flecha Derecha

; Combinaciones avanzadas con Ctrl + Shift
^+i::Send, ^+{Up}      ; Ctrl + Shift + i envía Ctrl + Shift + Flecha Arriba
^+j::Send, ^+{Left}    ; Ctrl + Shift + j envía Ctrl + Shift + Flecha Izquierda
^+k::Send, ^+{Down}    ; Ctrl + Shift + k envía Ctrl + Shift + Flecha Abajo
^+l::Send, ^+{Right}   ; Ctrl + Shift + l envía Ctrl + Shift + Flecha Derecha

#If ; Termina el contexto dependiente de LayerActive
