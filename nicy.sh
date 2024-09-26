#!/bin/bash

# Tweakable parameters:

#WAIT_DIR="/run/nicy"
#TIME_WAIT=15 # seconds
#DEBUG=

####

mkdir -pv "${WAIT_DIR}/"
[ -p "${WAIT_DIR}/wait" ] || { rm -f "${WAIT_DIR}/wait"; mkfifo "${WAIT_DIR}/wait"; }

PGREP_ARGS=()

function _pgrep {
  if [ ${#PGREP_ARGS[@]} -gt 0 ]; then
  pgrep "${PGREP_ARGS[@]}" "$@"
  fi
  PGREP_ARGS=()
}

function pids_of_user {
  PGREP_ARGS+=("-u" "$1")
}

function pids_of_cmd {
  PGREP_ARGS+=("-f" "$@")
}

function pids_of_parent {
  local PPIDS=$(pgrep -d',' -f "${@}")
  [ ${#PPIDS} -eq 0 ] && return
  PGREP_ARGS+=("-P" $PPIDS)
}

####

function children_of {
  PIDNODES=$(pgrep -d, -P $@)
  if [ "$PIDNODES" ]; then
    echo $PIDNODES
    children_of $PIDNODES
  fi
}

function children_pids_of {
  if [ $# -gt 0 ]; then
  ( echo "$@ "; children_of $@; ) | comma_list_to_space_list
  fi
  PGREP_ARGS=()
}

function comma_list_to_space_list {
  xargs echo -n | sed -r 's/,/ /g'
  echo
}

####

IONICE_ARGS=()
SCHEDTOOLS_ARGS=()

function _ionice {
  if [ ${#IONICE_ARGS[@]} -gt 0 ]; then
  ionice "${IONICE_ARGS[@]}" "$@" &
  IONICE_ARGS=()
  fi
}

function _schedtool {
  if [ ${#SCHEDTOOLS_ARGS[@]} -gt 0 ]; then
  schedtool "${SCHEDTOOLS_ARGS[@]}" "$@" 1>/dev/null &
  SCHEDTOOLS_ARGS=()
  fi
}

function nice_prio {
  SCHEDTOOLS_ARGS+=("-n" "$1")
}

function sched_policy {
  SCHEDTOOLS_ARGS+=("-M" "$1")
}

function sched_prio {
  SCHEDTOOLS_ARGS+=("-p" "$1")
}

function ionice_class {
  IONICE_ARGS+=("-c" "$1")
}

function ionice_prio {
  IONICE_ARGS+=("-n" "$1")
}

function cpu_affinity {
  SCHEDTOOLS_ARGS+=("-a" "$1")
}

function apply_rule {
  if [ $# -gt 0 ]; then
  [ -z $DEBUG ] || echo _schedtool "$@"
  _schedtool "$@"
  [ -z $DEBUG ] || echo _ionice -t -p "$@"
  _ionice -t -p "$@"
  fi
  IONICE_ARGS=()
  SCHEDTOOLS_ARGS=()
}

function _shell_sleep {
  exec 5<>"${WAIT_DIR}/wait"
  read -u5 -t $1
}

while :; do
  source /usr/share/nicy/prio-levels.sh
  source /usr/share/nicy/application-classes.sh
  source /etc/nicy.d/default.sh # link to /usr/share/nicy/application-profile-default.sh or another profile script
  _shell_sleep $TIME_WAIT
done
