#!/bin/bash
#set -e
echo "##########################################"
echo "Be Careful this will override your Rice!! "
echo "##########################################"
sleep 5
echo "Creating Backups of ~/.config folder"
echo "#####################################"
cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
sleep 2
echo "Installing required Tools"
echo "#################################"
sudo pacman -S --needed --noconfirm kvantum-qt5 latte-dock lolcat neofetch yakuake
sleep 2
echo "Installing Sweet Theme"
echo "#################################"
sudo pacman -S --needed --noconfirm sweet-gtk-theme-dark sweet-kde-git kvantum-theme-sweet-git plasma-theme-sweet beautyline
sleep 2
echo "Installing Fonts"
echo "#################################"
sudo pacman -S --needed --noconfirm nerd-fonts-hack nerd-fonts-fira-code nerd-fonts-meslo nerd-fonts-terminus noto-fonts-emoji
sleep 2
echo "Applying new Rice, hold on..."
echo "#################################"
cp -Rf Configs/Home/. ~
sudo cp -Rf Configs/System/. /
sudo sed -i "s/Current=breeze/Current=Shiny-SDDM/g" /etc/sddm.conf
sleep 2
echo "Applying Grub Theme...."
echo "#################################"
chmod +x CyberRe.sh
sudo ./CyberRe.sh
sudo sed -i "s/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1920x1080/g" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sleep 2
echo "Rebooting system in 5 seconds..."
echo "#################################"
sleep 5
sudo reboot
