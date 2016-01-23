#!/bin/bash
M_RECORD=0
m_command() {
  # Call m and pass all param args
  M_RECORD=0

  # Record by setting up a bash trap
  if [ "$1" == "record" ]; then
    M_RECORD=1

    # m "$@" & # run m in background and pass all args
  fi

  m "$@"
}

# This will run before any command is executed.
m_pre() {
  if [ -z "$M_AT_PROMPT" ]; then
    return
  fi
  unset M_AT_PROMPT

  # echo $M_RECORD
  echo "Pre hook"
  if [ "$M_RECORD" -eq 1 ]; then
    echo "Pre: Set M_CMD"
    M_CMD=$*
  fi
}

trap 'm_pre $BASH_COMMAND' DEBUG

# This will run after the execution of the previous full command line.  We don't
# want post to execute when first starting a bash session (FIRST_PROMPT)
M_FIRST_PROMPT=1
m_post() {
  M_AT_PROMPT=1

  if [ -n "$M_FIRST_PROMPT" ]; then
    unset M_FIRST_PROMPT
    return
  fi

  local last_code=$?
  if [ "$M_RECORD" -eq 1 ]; then
    echo "post record"

    # Don't add if the status errored
    if [ "$last_code" -eq 0 ]; then
      # Add current directory and command to r
      m --add "$M_CMD"
      echo "add $M_CMD"

      return
    fi
  fi


  echo "Post"
}


# Run post after command
PROMPT_COMMAND="${PROMPT_COMMAND}"$'\n'"m_post;";

alias m=m_command
