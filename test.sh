#!/bin/bash

Color='\033[0;33m'
NoColor='\033[0m'

    sleep 1

    echo -e "${Color}plymouth://process/changemode --type system-upgrade ${NoColor}"
    plymouth change-mode --system-upgrade
    sleep 1
    echo -e "${Color}plymouth://process/update/system ${NoColor}"
    plymouth system-update --progress 0
    sleep 0.1
    plymouth system-update --progress 20
    sleep 0.1
    plymouth system-update --progress 30
    sleep 0.1
    plymouth system-update --progress 40
    sleep 0.1
    plymouth system-update --progress 50
    sleep 0.1
    plymouth system-update --progress 60
    sleep 0.1
    plymouth system-update --progress 70
    sleep 0.1
    plymouth system-update --progress 80
    sleep 0.1
    plymouth system-update --progress 90
    sleep 0.1
    plymouth system-update --progress 100
    sleep 1
    echo -e "${Color}plymouth://process/changemode --type boot-up ${NoColor}"
    plymouth change-mode --boot-up
    sleep 1
    echo -e "${Color}plymouth://process/changemode --type updates ${NoColor}"
    plymouth change-mode --updates
    sleep 1
    echo -e "${Color}plymouth://process/changemode --type firmware-upgtrade ${NoColor}"
    plymouth change-mode --firmware-upgrade
    sleep 1
    echo -e "${Color}plymouth://process/changemode --type shutdown ${NoColor}"
    plymouth change-mode --shutdown
    sleep 1
    echo -e "${Color}plymouth://process/changemode --type reboot ${NoColor}"
    plymouth change-mode --reboot
    sleep 1
    echo -e "${Color}plymouth://process/update ${NoColor}"
    sleep 1
    echo -e "${Color}plymouth://process/hide ${NoColor}"
    plymouth --hide-splash
    sleep 1
    echo -e "${Color}plymouth://process/stop ${NoColor}"
sleep 1

for i in {1..10}
do
    echo -e "${Color}plymouth://process/test --number $i ${NoColor}"
        plymouth --update=test$i
        sleep 1
done

echo -e "${Color}plymouth://process/hide ${NoColor}"
plymouth --hide-splash
sleep 1

exit 0

# sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/darwin/darwin.plymouth 100
# sudo update-alternatives --config default.plymouth
#
# plymouthd --no-daemon --debug

# `Transition` config in `two-step` animation piece code from https://gitlab.freedesktop.org/plymouth/plymouth
#  if (strcmp (transition, "fade-over") == 0)
#        plugin->transition = PLY_PROGRESS_ANIMATION_TRANSITION_FADE_OVER;
#    else if (strcmp (transition, "cross-fade") == 0)
#        plugin->transition = PLY_PROGRESS_ANIMATION_TRANSITION_CROSS_FADE;
#    else if (strcmp (transition, "merge-fade") == 0)
#        plugin->transition = PLY_PROGRESS_ANIMATION_TRANSITION_MERGE_FADE;
