#!/bin/bash

OUTPUT_FILE=~/Videos/recording_$(date +%Y%m%d_%H%M%S).mp4
PID_FILE=/tmp/ffmpeg_recording.pid
START_TIME_FILE=/tmp/ffmpeg_start_time.txt

start_recording() {
  if [ -f "$PID_FILE" ]; then
    dunstify -u critical -i dialog-warning "Recording already in progress"
    exit 1
  fi

  REGION=$(slop -f '%wx%h+%x+%y')
  WIDTH=$(echo "$REGION" | cut -d 'x' -f 1)
  HEIGHT=$(echo "$REGION" | cut -d 'x' -f 2 | cut -d '+' -f 1)
  X_OFFSET=$(echo "$REGION" | cut -d '+' -f 2)
  Y_OFFSET=$(echo "$REGION" | cut -d '+' -f 3)

  ffmpeg \
    -f x11grab \
    -video_size "${WIDTH}x${HEIGHT}" \
    -framerate 30 \
    -i ":0.0+${X_OFFSET},${Y_OFFSET}" \
    -c:v libx264 \
    -preset ultrafast \
    -movflags +faststart \
    "$OUTPUT_FILE" &

  echo $! >"$PID_FILE"
  date +%s >"$START_TIME_FILE"
  dunstify -u normal -i /usr/share/icons/Qogir-dark/22/actions/media-record.svg "Recording started" "Region: ${WIDTH}x${HEIGHT}+${X_OFFSET}+${Y_OFFSET}"
}

stop_recording() {
  if [ ! -f "$PID_FILE" ]; then
    dunstify -u critical -i dialog-warning "No recording in progress"
    exit 1
  fi

  FFMPEG_PID=$(cat "$PID_FILE")
  kill -SIGINT "$FFMPEG_PID"
  rm "$PID_FILE" "$START_TIME_FILE"
  dunstify -u normal -i /usr/share/icons/Qogir-dark/22/actions/media-record.svg "Recording stopped" "Saved to $OUTPUT_FILE"
}

status() {
  if [ -f "$PID_FILE" ]; then
    START_TIME=$(cat "$START_TIME_FILE")
    CURRENT_TIME=$(date +%s)
    DURATION=$((CURRENT_TIME - START_TIME))
    DURATION_FORMATTED=$(date -u -d @$DURATION +%H:%M:%S)

    # Output status with Pango markup for red text
    echo "<span color='#FF0000'>🎥 Recording ($DURATION_FORMATTED)</span>"
  else
    # Output status with Pango markup for white text
    echo "<span color='#FFFFFF'>🛑 Idle</span>"
  fi
}

toggle_recording() {
  if [ -f "$PID_FILE" ]; then
    stop_recording
  else
    start_recording
  fi
}

case "$1" in
toggle)
  toggle_recording
  ;;
start)
  start_recording
  ;;
stop)
  stop_recording
  ;;
status)
  status
  ;;
*)
  echo "Usage: $0 {toggle|start|stop|status}"
  exit 1
  ;;
esac
