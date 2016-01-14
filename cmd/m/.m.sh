#!/bin/bash
m_command() {
  if [ "$1" == "record" ]; then
    m "$@" & # run m in background and pass all args
    return
  fi
}


alias m=m_command
