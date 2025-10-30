findandkill() {
  port=$(lsof -n -i4TCP:$1 | grep LISTEN | awk '{ print $2 }')
  kill -9 $port
}

tohtml() {
  if [ $# -eq 0 ]; then
    echo "Usage: tohtml <unsafe string>"
    return 1
  fi
  echo "$1" | aha | pbcopy
}

report_aliases_usage() {
  local aliases_list=$(alias)

  echo "Alias usage report:"
  echo "Alias, Count"

  while IFS= read -r line; do
    local alias_name=$(sed 's/=.*//' <<<"$line")
    local count=$(grep -c "^[0-9,\*, ,:]*;$alias_name" ~/.zsh_history)
    if [ $((count)) -gt 0 ]; then
      echo "$alias_name, $count"
    fi
  done <<<$aliases_list
}

# USAGE:
#        Basic command:
#        pomodoro_timer
#        To modify work or break lengths to X, or Y minutes
#        POMO_WORK_LENGTH=X POMO_BREAK_LENGTH=Y pomodoro_timer
export POMO_WORK_LENGTH="15" # pomodoro work duration in minutes
export POMO_BREAK_LENGTH="2" # pomodoro break duration in minutes

pomodoro_timer() {
  export work_alarm_date=$(date -v +"$POMO_WORK_LENGTH"M)

  MESSAGE="⏳ Timer set until $work_alarm_date 💪"
  SOUND="Submarine"
  NOTIF="osascript -e 'display notification \"$MESSAGE\" with title \"Pomodoro Timer\" sound name \"$SOUND\" '"

  eval $NOTIF

  until [[ $(date) > "$work_alarm_date" ]]; do
    echo "working for another 5 seconds"
    sleep 5
  done

  MESSAGE="⌛️ Time to take a $POMO_BREAK_LENGTH minute break ✨"
  NOTIF="osascript -e 'display notification \"$MESSAGE\" with title \"Pomodoro Timer\" sound name \"$SOUND\" '"
  eval $NOTIF

  export rest_alarm_date=$(date -v +"$POMO_BREAK_LENGTH"M)

  until [[ $(date) > "$rest_alarm_date" ]]; do
    echo "resting for another 5 seconds"
    sleep 5
  done

  MESSAGE="✅ Breaks over 🤔"
  NOTIF="osascript -e 'display notification \"$MESSAGE\" with title \"Pomodoro Timer\" sound name \"$SOUND\" '"
  eval $NOTIF
}

put_ssm_param() {
  local service=$(gum input --placeholder "Enter service name")
  local param_name=$(gum input --placeholder "Enter parameter name")
  local value=$(gum input --placeholder "Enter value")

  aws ssm put-parameter \
    --name "/atp/env/atp/-/${service}/${param_name}" \
    --value "${value}" \
    --type String
}

get_ssm_param() {
  local service=$(gum input --placeholder "Enter service name")
  local param_name=$(gum input --placeholder "Enter parameter name")

  aws ssm get-parameter --name "/atp/env/atp/-/${service}/${param_name}" --with-decryption --query "Parameter.Value" --output text
}
