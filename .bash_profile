if [[ "$(tty)" == '/dev/tty1' ]]; then
	export XDG_SESSION_TYPE=wayland
    export QT_QPA_PLATFORM=wayland
	export XDG_CURRENT_DESKTOP=sway
	exec sway
    #dbus-run-session startplasma-wayland
fi
