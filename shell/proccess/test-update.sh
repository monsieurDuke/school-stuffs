#!/bin/bash
# wait     : sudo apt-get update & > sudo apt-get upgrade & > sudo apt-get install package
#          : wait $!
echo -e "---\\nUpdating packages ...\\n---"
apt-get update &
wait $!
echo -e "---\\nInstalling packages ...\\n---"
apt-get install vim &
wait $!
echo -e "---\\nDone, Installation Successfully"

