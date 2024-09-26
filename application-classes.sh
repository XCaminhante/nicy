#### Application classes

function appclass_archiver {
  pids_of_parent "file-roller"; _pgrep
  pids_of_cmd "p7zip"; _pgrep
  pids_of_cmd "megasync"; _pgrep
}
function appclass_audio_server {
  pids_of_cmd "pulseaudio"; _pgrep
}
function appclass_video_server {
  pids_of_cmd "Xorg"; _pgrep
  pids_of_cmd "picom"; _pgrep
}
function appclass_chat {
  pids_of_cmd "Telegram"; _pgrep
}
function appclass_compiler {
  pids_of_cmd "gcc"; _pgrep
  pids_of_cmd "cc"; _pgrep
  pids_of_cmd "cc1"; _pgrep
  pids_of_cmd "lto1"; _pgrep
  pids_of_cmd "arduino-builder"; children_pids_of $(_pgrep -d,)
  pids_of_cmd "ninja"; children_pids_of $(_pgrep -d,)
}
#~function appclass_database {  }
function appclass_user_batch {
  pids_of_cmd "runsvdir"; children_pids_of $(_pgrep -d,)
}
function appclass_user_daemon {
  pids_of_user "user"; pids_of_cmd "dbus-daemon"; _pgrep
  pids_of_cmd "pnmixer"; _pgrep
  pids_of_cmd "blueman-tray"; _pgrep
  pids_of_cmd "conky"; _pgrep
  pids_of_cmd "clipit"; _pgrep
  pids_of_cmd "xpad"; _pgrep
  pids_of_cmd "xcape"; _pgrep
  pids_of_cmd "syndaemon"; _pgrep
  pids_of_cmd "xfce4-"; _pgrep
  pids_of_cmd "ibus-"; _pgrep
  pids_of_cmd "gvfsd"; _pgrep
  pids_of_cmd "obexd"; _pgrep
  pids_of_cmd "light-locker"; _pgrep
  pids_of_cmd "nm-applet"; _pgrep
}
function appclass_system_batch {
  pids_of_cmd "systemd-timesyncd"; _pgrep
  pids_of_cmd "systemd-journald"; _pgrep
  pids_of_cmd "auditd"; _pgrep
}
function appclass_system_daemon {
  pids_of_user "messagebus"; _pgrep
  pids_of_cmd "systemd --system"; _pgrep
  pids_of_cmd "systemd-machined"; _pgrep
  pids_of_cmd "systemd-udevd"; _pgrep
  pids_of_cmd "systemd-networkd"; _pgrep
}
function appclass_DEWM {
  pids_of_cmd "openbox"; _pgrep
  pids_of_cmd "xbindkeys"; _pgrep
  pids_of_cmd "tint2"; _pgrep
  pids_of_cmd "jgmenu$"; _pgrep
}
function appclass_document_editor {
  pids_of_cmd "bl-text-editor"; _pgrep
  pids_of_cmd "geany"; _pgrep
  pids_of_parent "bin/arduino"; _pgrep
  pids_of_cmd "bin/leo-editor"; _pgrep
  pids_of_cmd "^edb$"; _pgrep
}
function appclass_document_viewer {
  pids_of_cmd "oosplash"; _pgrep
  pids_of_cmd "soffice.bin"; _pgrep
  pids_of_cmd "insomnia$"; children_pids_of $(_pgrep -d,)
}
#~function appclass_email_client {}
#~function appclass_file_manager {}
#~function appclass_file_sync {}
#~function appclass_game {}
#~function appclass_image_editor {}
#~function appclass_image_viewer {}
function appclass_music_player {
  pids_of_cmd "ffplay"; _pgrep
}
function appclass_video_player {
  pids_of_cmd "^mpv"; _pgrep
  pids_of_cmd "^vlc"; _pgrep
  pids_of_cmd "^bl-media-player"; _pgrep
}
function appclass_p2p_client {
  pids_of_cmd "transmission-gtk"; _pgrep
}
function appclass_package_manager {
  pids_of_cmd "aptitude"; children_pids_of $(_pgrep -d,)
  pids_of_cmd "apt-get"; children_pids_of $(_pgrep -d,)
  pids_of_cmd "dpkg"; children_pids_of $(_pgrep -d,)
}
#~function appclass_http_server {}
function appclass_terminal {
  pids_of_cmd "bin/x-terminal-emulator"; _pgrep
  pids_of_parent "bin/x-terminal-emulator"; _pgrep
  pids_of_parent "guake"; _pgrep
}
function appclass_tty {
  pids_of_cmd "agetty "; _pgrep
}
#~function appclass_virtual_machine {}
function appclass_web_browser {
  pids_of_cmd "x-www-browser"; children_pids_of $(_pgrep -d,)
  pids_of_cmd "firefox-esr"; children_pids_of $(_pgrep -d,)
  pids_of_cmd "seamonkey"; _pgrep
}
