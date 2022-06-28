#!/bin/bash
#set -e
echo "##########################################"
echo "Be Careful this will override your Rice!! "
echo "##########################################"
sleep 5
echo "Creating Backups of ~/.config folder"
echo "#####################################"
mv ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
sleep 2
echo "Removing old Latte-Dock & Lightly"
echo "#################################"
sudo pacman -R --noconfirm lightly-git
sudo pacman -R --noconfirm latte-dock
sleep 2
echo "Installing New latte-Git version"
echo "#################################"
sudo pacman -S --needed --noconfirm latte-dock-git kvantum
sleep 2
echo "Installing Sweet Theme"
echo "#################################"
sudo pacman -S --needed --noconfirm sweet-gtk-theme-dark sweet-kde-git kvantum-theme-sweet-git plasma-theme-sweet sweet-cursors-theme-git beautyline
sleep 2
echo "Installing Fonts"
echo "#################################"
sudo pacman -S --needed --noconfirm nerd-fonts-hack nerd-fonts-fira-code nerd-fonts-meslo nerd-fonts-terminus noto-fonts-emoji
sleep 2
echo "Applying new Rice, hold on..."
echo "#################################"
cp -Rf Configs/Home/. ~
sudo cp -Rf Configs/System/. /
sudo sed -i "s/Current=.*/Current=Shiny-SDDM/" /etc/sddm.conf.d/kde_settings.conf
sleep 2
echo "Applying Grub Theme...."
echo "#################################"
chmod +x CyberRe.sh
sudo ./CyberRe.sh
sudo sed -i "s/GRUB_GFXMODE=auto/GRUB_GFXMODE=1920x1080/g" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sleep 2
echo "RebootTo Apply Settings..."
echo "#################################"
