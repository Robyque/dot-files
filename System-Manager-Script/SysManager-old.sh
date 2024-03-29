 #===<Start Of Swapp menu>===#
show_swaps(){
    echo "Showing Swaps...."
    cat /proc/swaps
    echo "Awailable Swaps"
}

disable_swaps(){
    echo "Disabling swaps....."
    sudo swapoff -a
    echo "Swaps Disabled"
}

enable_swaps(){
    echo "Enabling swaps....."
    sudo swapon -a
    echo "Swaps Enabled"
}
show_swappiness_value(){
    echo "Showing swappiness value..."
    echo "The value is:"
    cat /proc/sys/vm/swappiness
}
change_swappiness_value(){
    echo "Changing Swappiness Value..."
    sudo sh -c 'echo 10 > /proc/sys/vm/swappiness'
    echo "Swappiness Value has changed to: "
    cat /proc/sys/vm/swappiness
}
#===<End Of Swapp Menu>===#
swapp_menu(){
    echo "
------------------------------
|1) Show Swaps               |
|2) Disable Swaps            |
|3) Enable Swaps             |
|4) Show Swappiness Value    |
|5) Change Swappiness        |
|6) Back                     |
|7) Main Menu                |
|8) Exit                     |
------------------------------
What?:
"
    read a
    case $a in
        1) show_swaps ; swapp_menu ;;
        2) disable_swaps ; swapp_menu ;;
        3) enable_swaps ; swapp_menu ;;
        4) show_swappiness_value ; swapp_menu ;;
        5) change_swappiness_value ; swapp_menu ;;
        6) system_menu ;;
        7) menu ;;
        8) exit 0 ;;
    esac
}

#===<Desktop enviroment install>===#
#<Official suported>
budgie(){
    echo "Installing Budgie desktop enviroment...."
    sudo pacman -S budgie-desktop
}
cinnamon(){
    echo "Installing Cinnamon desktop enviroment...."
    sudo pacman -S cinnamon
}
cutefish(){
    echo "Installing Cutefish desktop enviroment...."
    sudo pacman -S cutefish
}
deepin(){
    echo "Installing Deepin desktop enviroment...."
    sudo pacman -S deepin
}
enlightenment(){
    echo "Installing Enlightenment desktop enviroment...."
    sudo pacman -S enlightenment
}
gnome(){
    echo "Installing Gnome desktop enviroment..."
    sudo pacman -S gnome
}
gnome_flashback(){
    echo "Installing Gnome Flashback desktop enviroment...."
    sudo pacman -S gnome-flashback
}
kde(){
    echo "Installing KDE Plasma desktop enviroment...."
    sudo pacman -S plasma
}
lxde(){
    echo "Installing LXDE desktop enviroment...."
    sudo pacman -S lxde-gtk3
}
lxqt(){
    echo "Installing LXQT desktop enviroment...."
    sudo pacman -S lxqt
}
mate(){
    echo "Installing MATE desktop enviroment...."
    sudo pacman -S mate
}
sugar(){
    echo "Installing Sugar desktop enviroment...."
    sudo pacman -S sugar sugar-fructose
}
ukui(){
    echo "Installing UKUI desktop enviroment...."
    sudo pacman -S ukui
}
xfce(){
    echo "Installing XFCE desktop enviroment...."
    sudo pacman -S xfce4
}
#<Unofficially supported>
cde(){
    echo "Installing CDE desktop enviroment...."
    yay cdesktopenv
}
ede(){
    echo "Installing EDE desktop enviroment...."
    yay ede
}
kde_1(){
    echo "installing KDE 1 desktop enviroment...."
    yay kde1-kdebase-git
}
liri(){
    echo "Installing Liri desktop enviroment...."
    yay liri-shell-git

}
lumina(){
    echo "Installing Lumina desktop enviroment...."
    yay lumina-desktop
}
moksha(){
    echo "Installing Moksha desktop enviroment...."
    yay moksha-git
}
pantheon(){
    echo "Installing Pantheon desktop enviroment...."
    yay pantheon-session-git
}
paperde(){
    echo "Installing PaperDE desktop enviroment...."
    yay paperde
}
phosh(){
    echo "Installing Phosh desktop enviroment...."
    yay phosh-git
}
thedesk(){
    echo "Installing TheDeskt desktop enviroment...."
    yay thedesk
}
trinity(){
    echo "Installing Trinity desktop enviroment...."
    yay trinity
}
#<Other window managers>
i3wm(){
    echo "Installing i3 & Polybar window manager...."
    sudo pacman -S i3-gaps polybar
}
qtile(){
    echo "Installing Qtile window manager...."
    sudo pacman -S qtile
}
awesome(){
    echo "Installing Awesome window manager...."
    sudo pacman -S awesome
}
xmonad(){
    echo "Installing xmonad window manager...."
    sudo pacman -S xmonad xmonad-contrib xmonad-utils
}
openbox(){
    echo "Installing openbox window manager...."
    sudo pacman -S openbox ttf-dejavu ttf-liberation
}
#<Desktop Enviroment & Window managers menu>
ofde_menu(){
 echo "
------------------------------------------------------------------
|1) Budgie                                                       |
|2) Cinnamon                                                     |
|3) Cutefish                                                     |
|4) Deepin                                                       |
|5) Enlightenment                                                |
|6) Gnome                                                        |
|7) Gnome Flashback                                              |
|8) KDE                                                          |
|9) LXDE                                                         |
|10) MATE                                                        |
|11) Sugar                                                       |
|12) Ukui                                                        |
|13) XFCE                                                        |
|14) Back                                                        |
|15) Main menu                                                   |
|16) Exit                                                        |
------------------------------------------------------------------
What?:
"
 read a
 case $a in
     1) budgie ; ofde_menu ;;
     2) cinnamon ; ofde_menu ;;
     3) cutefish ; ofde_menu ;;
     4) deepin ; ofde_menu ;;
     5) enlightenment ; ofde_menu ;;
     6) gnome ; ofde_menu ;;
     7) gnome_flashback ; ofde_menu ;;
     8) kde ; ofde_menu ;;
     9) lxde ; ofde_menu ;;
     10) mate ; ofde_menu ;;
     11) sugar ; ofde_menu ;;
     12) ukui ; ofde_menu ;;
     13) xfce ; ofde_menu ;;
     14) de_wm_menu ;;
     15) menu ;;
     16) exit 0 ;;
 esac
}
usde_menu(){
    echo "
-------------------------------------------------
|1)CDE                                          |
|2)EDE                                          |
|3)KDE 1                                        |
|4)Liri                                         |
|5)Lumina                                       |
|6)Moksha                                       |
|7)Pantheon                                     |
|8)PaperDE                                      |
|9)Phosh                                        |
|10)TheDesk                                     |
|11)Trinity                                     |
|12)Back                                        |
|13)Main menu                                   |
|14)Exit                                        |
-------------------------------------------------
What?:
"
    read a
    case $a in
        1) cde ; usde_menu ;;
        2) ede ; usde_menu ;;
        3) kde_1 ; usde_menu ;;
        4) liri ; usde_menu ;;
        5) lumina ; usde_menu ;;
        6) moksha ; usde_menu ;;
        7) pantheon ; usde_menu ;;
        8) paperde ; usde_menu ;;
        9) phosh ; usde_menu ;;
        10) thedesk ; usde_menu ;;
        11) trinity ; usde_menu ;;
        12) de_wm_menu ;;
        13) menu ;;
        14) exit 0 ;;
    esac
}
owm_menu(){
    echo "
--------------------------------------------------
|1) i3                                           |
|2) Qtile                                        |
|3) Awesome                                      |
|4) Xmonad                                       |
|5) Openbox                                      |
|6) Back                                         |
|7) Main menu                                    |
|8) Exit                                         |
--------------------------------------------------
What?:
"
    read a
    case $a in
        1) i3wm ; owm_menu ;;
        2) qtile ; owm_menu ;;
        3) awesome ; owm_menu ;;
        4) xmonad ; owm_menu ;;
        5) openbox ; owm_menu ;;
        6) install_menu ;;
        7) menu ;;
        8) exit 0 ;;
    esac
}

de_wm_menu(){
    echo "
--------------------------------------------------
|1) Official supported desktop enviroment        |
|2) Unofficial supported desktop enviroment      |
|3) Tiling window managers                       |
|4) Back                                         |
|5) Main menu                                    |
|6) Exit                                         |
--------------------------------------------------
What?:
"
    read a
    case $a in
        1)ofde_menu ;;
        2)usde_menu ;;
        3)owm_menu ;;
        4) install_menu ;;
        5) menu ;;
        6) exit 0 ;;
    esac
}

#<Post install>
minimal(){
    #Installing package managers (yay,flatpak,snap)
    echo "Installing flatpak package manager...."
    sudo pacman -S flatpak
    echo "Installing yay AUR package manager...."
    sudo pacman -S git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    echo "Installing snap package manager...."
    yay snapd

    PKGS=(
        'firefox' #browser
        'alacritty' #terminal
        'dolphin' #file manager
        #'thunar' #file manager
        'flatpak'
        'lightdm'
        'lightdm-gtk-greeter'
        'htop'
        'neofetch'
        'xorg-server'
    )
    for PKG in "${PKGS[@]}"; do
      echo "Installing: ${PKG} via pacman"
      sudo pacman -S "${PKG}" --noconfirm --needed
    done
    #enabling services
    sudo systemctl enable lightdm.service
    #yay(AUR)
    }

normal(){
    #Installing package managers (yay,flatpak,snap)
    echo "Installing flatpak package manager...."
    sudo pacman -S flatpak
    echo "Installing yay AUR package manager...."
    sudo pacman -S git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    echo "Installing snap package manager...."
    yay snapd
    #pacman
    PPKGS=(
        'firefox' #browser default
        'alacritty' #default terminal
        'dolphin' #default file manager
        #'thunar' #file manager
        'engrampa' #archive manager
        'vlc' #video player
        'nomacs' #image viewer
        'feh' #image viewer
        'audacious' #audio player
        'neofetch'
        'htop' #terminal task manager
        'xrandr' #screen resolution manager
        'nitrogen' #teminal background manager
        'picom' #compositor
        'xorg-xinput' #xorg input manager
        'popsicle' #usb flasher for linux(curently windows iso not suported)
        'cmatrix'
        'libreoffice'
        'calibre'
        'flameshot'
        'onboard'
        'qbittorrent'
        'aura-bin'
        'redshift'
        'minder' #efficiency app
        'lightdm' #login manager
        'lightdm-gtk-greeter'

    )
    for PPKG in "${PPKGS[@]}"; do
        echo "Installing: ${PPKG} via pacman"
        sudo pacman -S "$PPKG" --noconfirm --needed
    done
    #enabling services
    sudo systemctl enable lightdm.service
    #flatpak
    FPKGS=(
        're.sonny.Tangram' #tangram
        'com.spotify.Client' #spotify
        'us.zoom.Zoom' #zoom client
        'com.skype.Client' #skype
        'com.github.alainm23.planner' #efficiency app

    )
    for FPKG in "${FPKGS[@]}"; do
        echo "Installing: ${FPKG} via flatpak"
        sudo flatpak install "$FPKG"
    done
}

gameing(){
    #pacman app list
    PPKGS=(
        'discord'
        'discord-canary'
        'steam-native'
        'lutris'
        'winetricks'
    )
     for PPKG in "${PPKGS[@]}"; do
        echo "Installing: ${PPKG} via pacman"
        sudo pacman -S "$PPKG" --noconfirm --needed
     done


    #flatpak app list
    FPKGS=(
      'io.mrarm.mcpelauncher' #minecraft bedrock launcher for linux
      'com.github.Matoking.protontricks' #like winetricks but for proton
      #'com.valvesoftware.Steam' #steam game launcher
    )
     for FPKG in "${FPKGS[@]}"; do
        echo "Installing: ${FPKG} via flatpak"
        sudo flatpak install "$FPKG"
     done
    #aur app
     APKGS=(
         'protonup-git' #proton and wine manager for steam and lutris
     )
     for APKG in "${APKGS[@]}"; do
       echo "Insalling: ${APKG} via yay"
       yay "${APKG}"
     done
}

art(){
    PKGS=(
        'krita'
        'inkscape'
        'obs-studio'
        'blender'
        'kdenlive'
        'darktable'
        'gimp'
    )
     for PKG in "${PKGS[@]}"; do
        echo "Installing: ${PKG} via pacman"
        sudo pacman -S "$PKG" --noconfirm --needed
     done
     FPKGS=(
         'com.github.libresprite.LibreSprite' #LibreSprite pixel art editor
         'net.blockbench.Blockbench' #Minecraft 3d model maker
     )
     for SPKG in "${FPKGS[@]}"; do
       echo "Installing: ${SPKG} via flatpak"
       flatpak install "${SPKG}"
     done


}

efficiency(){
    echo "installing Minder...."
    sudo pacman -S minder
    echo "Installing Planner...."
    flatpak install com.github.alainm23.planner
}

virtualization(){
    PKGS=(
        #virtul box
        'virtualbox'
        #virt manager & depedencies
        'virt-manager'
        'qemu'
        'archlinux-keyring'
        'virt-viewer'
        'dnsmasq'
        'vd2'
        'bridge-utils'
        'openbsd-netcat'
        'ebtables'
        'iptables'
        'libguestfs'
        'docker'
    )
     for PKG in "${PKGS[@]}"; do
        echo "Installing: ${PKG} via pacman"
        sudo pacman -S "$PKG" --noconfirm --needed
     done

    #Warning user to sudo chmod +x for using external hard drives
    echo "To user external hard drives use 'sudo chmod +x /run/media/user/drive'
    and don't use spaces in folder names because virt manager can't read spaces."
    #Starting kvm libvirt service
    sudo systemctl enable libvirtd.service
    sudo systemctl start libvirtd.service
    #Showing kvm service status
    systemctl status libvirtd.service
    #Adding user to libvirt group
    sudo usermod -a -G libvirt $(whoami)
    #Restarting kvm service
    sudo systemctl restart libvirtd.service
}

programing(){
    #pacman apps
    PPKGS=(
        'cmake'
        'atom'
        'kate'
        'emacs'
        'codeblocks'
        'jdk11-openjdk'
        'pycharm-community-edition'
        'gvim'
        'qtcreator'

    )
     for PPKG in "${PPKGS[@]}"; do
        echo "Installing: ${PPKG} via pacman"
        sudo pacman -S "$PPKG" --noconfirm --needed
    done

    #Snap apps
    SPKGS=(
        'sublime-text' #sublime text editor
        'eclipse' #eclipse ide for java
        'code' #visual studio code
        'code-insiders' #visual studio code insiders
    )
     for SPKG in "${SPKGS[@]}"; do
        echo "Installing: ${SPKG} via snap"
        sudo snap install "$SPKG" --classic
    done

}

terminals(){
    PKGS=(
        'kitty'
        'konsole'
        'yakuake'
        'cool-retro-term'
    )
     for PKG in "${PKGS[@]}"; do
        echo "Installing: ${PKG} via pacman"
        sudo pacman -S "$PKG" --noconfirm --needed
    done

}

browsers(){
    PPKGS=(
        'firefox'
        'opera'
        'vivaldi-stable'
        'chromium'
        'qutebrowser'
        'vimb'
    )
     for PPKG in "${PPKGS[@]}"; do
        echo "Installing: ${PPKG} via pacman"
        sudo pacman -S "$PPKG" --noconfirm --needed
    done
     FPKGS=(
         're.sonny.Tangram'
     )
     for FPKG in "${FPKGS[@]}"; do
       echo "Installing: ${FPKG} via flatpak"
       flatpak install "${FPKG}"
     done

}

unixporn(){
    echo "Some of the apps need manual install for the moment."
    #pacman
    PPKGS=(
        'conky-manager'
    )
     for PPKG in "${PPKGS[@]}"; do
        echo "Installing: ${PPKG} via pacman"
        sudo pacman -S "$PPKG" --noconfirm --needed
     done
    #uning yay and aur
    echo "ATENTION!! USING YAY AND AUR"
    #yay(AUR)
    YPKGS=(
        'cava' #terminal sound react
        'tty-clock' #terminal clock
        'pipes' #terminal pipes
        'pfetch' #neofetch but small
        'pixterm' #image to pixelart converter
        'cbonsai-git' #terminal bonsai
        'bpytop' #htop clone but prettier
    )
    #all the tools for making linux rice
    #like cava ttk-clock pipes pfetch feh
    for YPKG in "${YPKGS[@]}"; do
      echo "Installing: ${YPKG} via yay"
      yay "${YPKG}"
    done

}

package_managers(){
    echo "Installing Package managers...."
     #Installing package managers (yay,flatpak,snap)
    echo "Installing flatpak package manager...."
    sudo pacman -S flatpak
    echo "Installing yay AUR package manager...."
    sudo pacman -S git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    echo "Installing snap package manager...."
    yay snapd
}

install_menu(){
    echo "
-------------------------------------------------
|1) Desktop Enviroment & Window managers menu   |
|2) Minimal instalation                         |
|3) Normal instalation                          |
|4) Package managers(yay,flatpak,snap)          |
|5) Gaming apps                                 |
|6) Art apps                                    |
|7) Virtualization Apps                         |
|8) Programing Apps                             |
|9) Terminals                                   |
|10) Browsers                                   |
|11) Linux Rice                                 |
|12) Productivity                               |
|13) Back                                       |
|14) Main menu                                  |
|15) Exit                                       |
-------------------------------------------------
What?:
"
    read a
    case $a in
        1) de_wm_menu;;
        2) minimal ; install_menu ;;
        3) normal ; install_menu ;;
        4) package_managers ; install_menu ;;
        5) gameing ; install_menu ;;
        6) art ; install_menu ;;
        7) virtualization ; install_menu ;;
        8) programing ; install_menu ;;
        9) terminals ; install_menu ;;
        10) browsers ; install_menu ;;
        11) unixporn ; install_menu ;;
        12) efficiency ; install_menu ;;
        13) system_menu ;;
        14) menu ;;
        15) exit 0 ;;
    esac

}
#===<System Maintanance>===#
update_pacman(){
    echo "Running system update...."
    sudo pacman -Syyu
}
update_yay(){
    echo "Updating yay...."
    yay
}
update_flatpak(){
    echo "Updating flatpak...."
    sudo flatpak update
}
check_systemd(){
    echo "Checking systemd failed services...."
    systemctl --failed

}
log_files_check(){
    echo "Checking log files...."
    sudo journalctl -p 3 -xb
}
delete_pacman_cache(){
    echo "Deleting pacman cache...."
    sudo pacman -Scc
}
delete_yay_cache(){
    echo "Deleting yay cache...."
    yay -Scc
}
delete_unwanted_dependencies(){
    echo "Deleting unwated dependecies"
    yay -Yc
}
remove_orphan_packages(){
    echo "Removing orphan packages...."
    sudo aura -Oj
}
clean_cache(){
    echo "Cleaning Cache...."
    sudo rm -rf .cache/*
}
clean_journal(){
    echo "Cleaning Journal"
    sudo journalctl --vacuum-time=2weeks
}
disable_internal_keyboard(){
    xinput
    echo 'Look for  "↳ AT Translated Set 2 keyboard" to disable and enter his id:'
    read id
    xinput float $id
    echo "The internal keyboard was disabled"
}
enable_internal_keyboard(){
    xinput
    echo 'Look for  "↳ AT Translated Set 2 keyboard" to enable and enter his id:'
    read id
    echo 'now enter his master:'
    read master
    xinput float $id $master
    echo 'Internal keyboard now enabled'
}

system_maintanance_menu(){
    echo "
---------------------------------------------
|1) Update pacman                           |
|2) Update yay                              |
|3) Update flatpak                          |
|4) Check systemd                           |
|5) Log                                     |
|6) Delete pacman cache                     |
|7) Delete yay cache                        |
|8) Delete unwanted depedencies             |
|9) Delete orphan packages                  |
|10) Clean cache                            |
|11) Clean journal                          |
|12) Disable internal keyboard              |
|13) Enable internal keyboard               |
|14) Back                                   |
|15) Main menu                              |
|16) Exit                                   |
---------------------------------------------
What?:
"
    read a
    case $a in
        1) update_pacman; system_maintanance_menu ;;
        2) update_yay; system_maintanance_menu ;;
        3) update_flatpak; system_maintanance_menu ;;
        4) check_systemd; system_maintanance_menu ;;
        5) log_files_check; system_maintanance_menu ;;
        6) delete_pacman_cache; system_maintanance_menu ;;
        7) delete_yay_cache; system_maintanance_menu ;;
        8) delete_unwanted_dependencies; system_maintanance_menu ;;
        9) remove_orphan_packages; system_maintanance_menu ;;
        10) clean_cache; system_maintanance_menu ;;
        11) clean_journal ; system_maintanance_menu ;;
        12) disable_internal_keyboard ; system_maintanance_menu ;;
        13) enable_internal_keyboard ; system_maintanance_menu ;;
        14) system_menu ;;
        15) menu ;;
        16) exit 0 ;;
    esac
}
#===<Battery charging limit>===#
show_charging_limit(){
	cat /sys/class/power_supply/BAT0/charge_control_end_threshold
}

change_charging_limit_default(){
	
	if [[ $USER != "root" ]];
	then
		echo "Change user to root just for this operation and the switch back to regular user"
	else
		echo "Charging limit changed. Swith back to regular user."
		sudo echo 60 > /sys/class/power_supply/BAT0/charge_control_end_threshold
	fi
	
}

change_charging_limit_custom(){
	if [[ $USER != "root" ]];
	then
		echo "Change user to root just for this operation and the switch back to regular user"
	else
		echo "Enter the value(between 10-100%):"
		read ch 
		sudo echo "${ch}" > /sys/class/power_supply/BAT0/charge_control_end_threshold
		echo "Charging limit changed. Swith back to regular user."
	fi	
	
}

battery_charge_limit_menu(){
	echo "
-------------------------------------------
|1) Show charging limit                   |
|2) Change charging limit(default 60%)    |
|3) Change charging limit(custom)		  |
|4) Back                                  |
|5) Exit                                  |
-------------------------------------------
What?:
"
	read choice 
	case $choice in
		1) show_charging_limit ; battery_charge_limit_menu ;;
		2) change_charging_limit_default ; battery_charge_limit_menu ;;
		3) change_charging_limit_custom ; battery_charge_limit_menu ;;
		4) menu ;;
		5) exit 0 ;;
	esac	
}
#===<System Menu>===#
system_menu(){
    echo "
-------------------------------------------
|1) Swap Menu                             |
|2) Installer Menu                        |
|3) System Maintanance                    |
|4) Back                                  |
|5) Exit                                  |
-------------------------------------------
What?:
"
    read a
    case $a in
        1) swapp_menu ;;
        2) install_menu ;;
        3) system_maintanance_menu ;;
        4) menu ;;
        5) exit 0 ;;
    esac
}
#===<End of System Menu>===#

#===<Night Light Menu>===#
custom_temperature(){
    echo "Enter value:"
    read c
    echo "Enabling night light with value: ${c}k"
    redshift -O "${c}"
}
default_temperature(){
    echo "Enabling night light with the default value"
    redshift -O 3000
}
enable_night_light(){
    echo "What value do you want to set?(default 3000)(d,c):"
    read a
    case $a in
        d) default_temperature ; night_light_menu;;
        c) custom_temperature ; night_light_menu;;
    esac

}
disable_night_light(){
    echo "Disabling night light"
    redshift -x
}
night_light_menu(){
    echo "
---------------------------------
|1) Enable night light          |
|2) Disable night light         |
|3) Back                        |
|4) Exit                        |
---------------------------------
"
    read a
    case $a in
        1) enable_night_light ; night_light_menu ;;
        2) disable_night_light ; night_light_menu ;;
        3) menu ;;
        4) exit 0 ;;
    esac
}
#===<End of Night Light Menu>===#
#
#===<Principal Menu>===#


winetricks_choice(){
    echo "Starting winetricks....."
    winetricks
}
linux_rice_menu(){
    echo "
-----------------------------------------
|1) Conky Manager (Conky-manager)       |
|2) Cava (cava)                         |
|3) TTY-Clock (tty-clock)               |
|4) Pipes (pipes)                       |
|5) Pfetch (pfetch)                     |
|6) Cbonsai (cbonsai)                   |
|7) Cmatrix (cmatrix)                   |
|8) bpytop (bpytop)                     |
|9) Back                                |
|10) Exit                               |
-----------------------------------------
What?:
"
    read a
    case $a in
        1) conky-manager ; linux_rice_menu ;;
        2) cava ; linux_rice_menu ;;
        3) tty-clock -Dc ; linux_rice_menu ;;
        4) pipes ; linux_rice_menu ;;
        5) pfetch ; linux_rice_menu ;;
        6) cbonsai ; linux_rice_menu ;;
        7) cmatrix ; linux_rice_menu ;;
        8) bpytop ; linux_rice_menu ;;
        9) menu ;;
        10) exit 0 ;;

    esac
}
menu(){
    echo "
------------------------------------
| TIP:try not to use AUR that much |
| and if you use it use -bin, -git |
| or source code for better suport |
| and don't use yay a lot.	       |
| Update the system every 2 days   |
| not more not less than 2 days or |
| it will break. 		           |
------------------------------------
|1) System menu                    |
|2) Night light                    |
|3) Charging limit                 |
|4) Winetricks                     |
|5) Linux Rice                     |
|6) Exit                           |
------------------------------------
What?:
"
     read a
     case $a in
         1) system_menu ;;
         2) night_light_menu ;;
		 3) battery_charge_limit_menu ;;
         4) winetricks ; menu ;;
         5) linux_rice_menu ;;
         6) exit 0 ;;
     esac
}
menu
