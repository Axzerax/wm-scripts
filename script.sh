#!/bin/bash
echo -e "Would you like to start the install?"
read question





if [ $question == "y" ]; then
  echo "Starting.."

  pacman -Syu -y
  pacman -S ghc picom patch make firefox fish xorg xorg-xrdb xterm polybar lightdm-gtk-greeter wget pulseaudio ttf-font-awesome alsa-utils lightdm htop nitrogen dhcpcd alacritty xmonad xmonad-contrib -y

  echo -e "Enter your user account name"
  read account_name


  echo "Making temp directories"
  
  
  
  mkdir "/home/$account_name/setup_files"
  mkdir "/home/$account_name/.config"
  mkdir "/home/$account_name/.xmonad"

  git clone "https://github.com/Axzerax/Forest" "/home/$account_name/setup_files"

  mkdir "/home/$account_name/Documents"
  mkdir "/home/$account_name/Documents/Wallpaper"

  mv "/home/$account_name/setup_files/wallpaper"/* "/home/$account_name/Documents/Wallpaper"

  mv "/home/$account_name/setup_files/xmonad"/* "/home/$account_name/.xmonad"

  mkdir "/home/$account_name/.config/picom"

  mv "/home/$account_name/setup_files/picom"/* "/home/$account_name/.config/picom"

  mkdir "/home/$account_name/.config/polybar"

  mv "/home/$account_name/setup_files/polybar"/* "/home/$account_name/.config/polybar"

  chmod +x "/home/$account_name/.config/polybar/launch.sh"

  mkdir "/home/$account_name/.config/alacritty"

  mv "/home/$account_name/setup_files/alacritty"/* "/home/$account_name/.config/alacritty"

  echo "Xcursor.size: 16" > "/home/$account_name/.Xresources"

  git clone "https://gitlab.com/dwt1/dmenu-distrotube" "/home/$account_name/setup_files/dmenu_clone"

  cp "/home/$account_name/setup_files/dmenu/colors"/* "/home/$account_name/setup_files/dmenu_clone/colors"

  mv "/home/$account_name/setup_files/dmenu-distrotube/colors/doom-green.h" "/home/$account_name/setup_files/dmenu_clone/colors/doom-one.h"

  cd "/home/$account_name/setup_files/dmenu_clone"

  make clean install && rm config.h

  cd "/home/$account_name"

  systemctl enable lightdm.service

  echo "[Info] Cleaning up temp files"

  #rm -rf "/home/$account_name/setup_files"

  echo "[Requirement] You need to update the xmonad.hs file!"

  echo "Finished!"
else
  echo "invalid choice!"
fi

