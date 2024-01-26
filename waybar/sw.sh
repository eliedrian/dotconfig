#!/bin/sh

# FIXME term module if waybar gets killed

running=false
paused=false
timer="00:00:00"
pauseLength=0

pidcount=$(pgrep -cx sw.sh)
if [[ $pidcount == 2 ]]; then
    pidold=$(pgrep -ox sw.sh)
    if [ "$1" = "--stop" ]; then
        kill -s 1 "$pidold"
        exit 0
    else
        kill -s 7 "$pidold"
    fi
    exit 0
fi

resetState () {
    running=false
    paused=false
    timer="00:00:00"
    pauseStart=""
    pauseLength=0
}

toggleState () {
    if [[ $running == true ]]; then
        running=false
        paused=true
        pauseStart=$(date +%s)
    else
        running=true
        paused=false
        if [[ $pauseStart ]]; then
            pauseLength=$(date -ud "now sec - ${pauseStart} sec + ${pauseLength} sec" +%s) 
        else
            startTime=$(date +%s)
        fi
    fi
}

trap toggleState SIGBUS
trap resetState SIGHUP

while true; do

    if [[ $running == true ]]; then
        diff=$(calc ${startTime}+${pauseLength})
        timer=$(date -ud "now sec - ${diff} sec" +%H:%M:%S)
    fi
    if [[ $paused == true ]]; then
        class="paused";
    else
        class="";
    fi

    printf '{"text": "%s", "tooltip": "", "class": "%s", "percentage": 0 }\n' $timer $class
    sleep 1
done
