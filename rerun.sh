#!/bin/bash

# Check if at least three arguments are provided (command, file and line number)
if [ $# -lt 3 ]; then
    echo "Usage: $0 <command> <file-to-watch> <line-number>"
    echo 'i.e. ./rerun.sh "bundle exec rspec" ./spec/services/gpt_spec.rb 71'
    exit 1
fi

# Extract the file to watch and line number
file_to_watch=$2
line_number=$3

# Command to run is the first argument
command_to_run=$1

last_modification_time=$(stat -c %Y "$file_to_watch")
run_count=0 # Initialize run counter

# Infinite loop
while true; do
    current_modification_time=$(stat -c %Y "$file_to_watch")

    # Execute the command every 2 minutes, and also if the file modification time has changed
    if [ "$current_modification_time" != "$last_modification_time" ] || true; then
        # Update the last modification time
        last_modification_time=$current_modification_time

        # Increment and display the run count with the timestamp
        ((run_count++))
        echo "---$(date +"%H:%M")--- Run #$run_count ---------"

        # Execute the command with file and line number
        eval "$command_to_run $file_to_watch:$line_number"
    fi

    # Wait for 1 minutes
    sleep 60
done

