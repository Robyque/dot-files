#!/usr/bin/env bash


# TODO make a second script that installs user specific apps from install menu
#      and finish it as it is
# Declaring list of application from package managers and their category



# Global functions
invalid_option(){
  invalid_option_list=(
  'Bruh chose something that`s already in the list'
  'Cmno man'
  '.......'
  'The sun and the moon could align and you will not chose an option from the list'
  )
  random choice $invalid_option_list[@]

}
check_command(){
    command_name="$1"
    command -v "$command_name" >/dev/null 2>&1

    if [ $? == 0 ];
    then
        echo "yes"
    else
        echo "no"
    fi
}


clear_terminal(){
    printf "\033c"
    #clear && echo -en "\e[3J" #if you are using Konsole terminal use this
}

exit_message(){
    echo "Closing the script"

    sleep 1
    clear_terminal

    exit 0
}

pacman_install(){
    package=$1
    echo "installing $package"
    sudo pacman -S "$package"
}

pacman_install_list(){
    arr=("$@")
    for i in "${arr[@]}";do
        echo "installing $i"
		sudo pacman -S "$i"
	done

}

pacman_remove(){
    package=$1
    echo "removing $package"
    sudo pacman -Rnsd "$package"
}

pacman_remove_list(){
    arr=("$@")
    for i in "${arr[@]}";do
    echo "removing $i"
		sudo pacman -Rnsd "$i"
	done
}

flatpak_install(){
    package=$1
    echo "installing $package"
    flatpak install "$package"
}

flatpak_install_list(){
    arr=("$@")
    for i in "${arr[@]}";do
    echo "installing $i"
		flatpak install "$i"
	done
}
flatpak_remove(){
    package=$1
    echo "removing $package"
    flatpak remove "$package"
}

flatpak_remove_list(){
    arr=("$@")
    for i in "${arr[@]}";do
        echo "removing $package"
		flatpak remove "$i"
	done
}

yay_install(){
    package=$1
    echo "installing $package"
    yay -S "$package"
}

yay_install_lists(){
    arr=("$@")
    for i in "${arr[@]}";do
    echo "installing $i"
		yay -S "$i"
	done
}

yay_remove(){
    package=$1
    echo "removing $package"
    yay -Rnsd "$package"
}

yay_remove_list(){
    arr=("$@")
    for i in "${arr[@]}";do
        echo "removing $package"
		yay -Rnsd "$i"
	done
}

snap_install(){
    package=$1
    echo "installing $package"
    snap install "$package"
}

snap_install_list(){
    arr=("$@")
    for i in "${arr[@]}";do
        echo "installing $i"
		snap install "$i"
	done
}

snap_remove(){
    package=$1
    echo "removing $package"
    snap uninstall "$package"
}

snap_remove_list(){
    arr=("$@")
    for i in "${arr[@]}";do "installing $package"
        echo "removing $package"
		snap uninstall "$i"
	done
}
# multi step instalations

yay_setup(){
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}

paru_setup(){
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
}

virt_manager_qemu_setup(){
    depedencties=(
        'virt-manager'
        'qemu'
        'archlinux-keyring'_installed_package_managers
        'virt-viewer'
        'dnsmasq'
        'vd2'
        'bridge-utils'
        'openbsd-netcat'
        'ebtables'
        'iptables'
        'libguestfs'
        )

    for PKG in "${depedencties[@]}"; do
        echo "Installing: ${PKG} "
        sudo pacman -S "$PKG" --noconfirm --needed
     done

}

# global functions

print(){
	printf "$1 \n"
}

print_list(){
	arr=("$@")
	for i in "${arr[@]}";do
		printf "$i"
	done
}

generate_menu(){
	#don't put spaces in nameing options because this thing it's junk and it will not work=/
	option=("$@")
	row=1
	max=0
	side_border="|"
	spacer2="        "

	for v in "${option[@]}"; do
			length=${#v}
	    if (( $length > $max )); then max=$length; fi;
	done

	((max *= 2 ))

	top_border=$(printf "%-${max}s")
    printf "\n"
	echo "${top_border// /-}"

	((max /= 2))

	((max -= 1))

	spacer=$(printf "%-${max}s")

	for i in ${!option[@]};do

		generated_menu_option="$side_border $row) ${option[$i]} ${spacer// / } $side_border"
		border="${top_border// /-}"

		if ((${#generated_menu_option} < ${#border}));
		then

			spaces=$(( ${#border} - ${#generated_menu_option} + 1))
			space=$(($max + $spaces -1))
			spacers=$(printf "%-${space}s")
			echo "$side_border $row) ${option[$i]} ${spacers// / } $side_border"

		elif ((${#generated_menu_option} > ${#border}));
		then
			spaces=$((${#generated_menu_option} - ${#border}))
			space=$(($max - $spaces))
			spacers=$(printf "%-${space}s")
			echo "$side_border $row) ${option[$i]} ${spacers// / } $side_border"
		else

			echo "${generated_menu_option}"

		fi
		let "row++"

	done

	echo "${top_border// /-}"
	echo "->"

}



# Makeing the menus and functions


# ===<Desktop enviroment & window managers menu>===

ofde_menu(){
#don't include spaces in options name
#the options list will always be at the begining of the function
option=(
		'Budgie'
		'Cinnamon'
		'Cutefish'
		'Deepin'
		'Enlightenment'
		'Gnome'
		'Gnome-Flashback'
		'KDE'
		'LXDE'
		'LXQT'
		'MATE'
		'Sugar'
		'Ukui'
		'XFCE'
		'Back'
		'Main menu'
		'Exit'
	)


 echo "Disclaimer: for informations about the official supported
        DE see arch wiki."

 generate_menu "${option[@]}"

 read a
 case $a in
     1) clear_terminal ; pacman_install "budgie-desktop" ; ofde_menu ;;
     2) clear_terminal ; pacman_install "cinnamon" ; ofde_menu ;;
     3) clear_terminal ; pacman_install "cutefish" ; ofde_menu ;;
     4) clear_terminal ; pacman_install "deepin" ; ofde_menu ;;
     5) clear_terminal ; pacman_install "enlightenment" ; ofde_menu ;;
     6) clear_terminal ; pacman_install "gnome" ; ofde_menu ;;
     7) clear_terminal ; pacman_install "gnome-flashback" ; ofde_menu ;;
     8) clear_terminal ; pacman_install "plasma" ; ofde_menu ;;
     9) clear_terminal ; pacman_install "lxde-gtk3" ; ofde_menu ;;
     10) clear_terminal ; pacman_install "lxqt" ; ofde_menu ;;
     11) clear_terminal ; pacman_install "mate" ; ofde_menu ;;
     12) clear_terminal ; pacman_install "sugar sugar-fructose" ; ofde_menu ;;
     13) clear_terminal ; pacman_install "ukui" ; ofde_menu ;;
     14) clear_terminal ; pacman_install "xfce4" ; ofde_menu ;;
     15) clear_terminal ; de_wm_menu ;;
     16) clear_terminal ; menu ;;
     17)  exit_message ;;
     *) clear_terminal ; print "Ivalid option" ; ofde_menu;;
 esac
}

usde_menu(){

    option=(
        'CDE'
        'EDE'
        'KDE-1'
        'Liri'
        'Lumina'
        'Moksha'
        'Pantheon'
        'PaperDE'
        'Phosh'
        'TheDesk'
        'Trinity'
        'Back'
        'Main menu'
        'Exit'
    )

    echo "Disclaimer: for informations about the unofficially supported
            DE see arch wiki."

    generate_menu "${option[@]}"

    read a
    case $a in
        1) clear_terminal ; yay_install "cdesktopenv" ; usde_menu ;;
        2) clear_terminal ; yay_install "ede" ; usde_menu ;;
        3) clear_terminal ; yay_install "kde1-kdebase-git" ; usde_menu ;;
        4) clear_terminal ; yay_install "liri-shell-git" ; usde_menu ;;
        5) clear_terminal ; yay_install "lumina-desktop" ; usde_menu ;;
        6) clear_terminal ; yay_install "moksha-git" ; usde_menu ;;
        7) clear_terminal ; yay_install "pantheon-session-git" ; usde_menu ;;
        8) clear_terminal ; yay_install "paperde" ; usde_menu ;;
        9) clear_terminal ; yay_install "phosh-git" ; usde_menu ;;
        10) clear_terminal ; yay_install "thedesk" ; usde_menu ;;
        11) clear_terminal ; yay_install "trinity" ; usde_menu ;;
        12) clear_terminal ; de_wm_menu ;;
        13) clear_terminal ; menu ;;
        14) exit_message ;;
        *) clear_terminal ; print "Ivalid option"; usde_menu;;
    esac
}

owm_menu(){
    option=(
        'i3'
        'Qtile'
        'Awesome'
        'Xmonad'
        'Openbox'
        'Back'
        'Main menu'
        'Exit'
    )

    echo "Disclaimer: you will need to searh yourself
            for the informations about the Stand Alone WM's."

    generate_menu "${option[@]}"

    read a
    case $a in
        1) clear_terminal ; pacman_install "i3-gaps polybar" ; owm_menu ;;
        2) clear_terminal ; pacman_install "qtile" ; owm_menu ;;
        3) clear_terminal ; pacman_install "awesome" ; owm_menu ;;
        4) clear_terminal ; pacman_install "xmonad xmonad-contrib xmonad-utils" ; owm_menu ;;
        5) clear_terminal ; pacman_install "openbox ttf-dejavu ttf-liberatio" ; owm_menu ;;
        6) clear_terminal ; install_menu ;;
        7) clear_terminal ; menu ;;
        8) exit_message ;;
        *) clear_terminal ; print "Ivalid option"; owm_menu;;
    esac
}

de_wm_menu(){
    option=(
        'Official supported desktop enviroment'
        'Unofficial supported desktop enviroment'
        'Stand alone window managers'
        'Back'
        'Main Menu'
        'Exit'
    )

    generate_menu "${option[@]}"

    read a
    case $a in
        1) clear_terminal ; ofde_menu ;;
        2) clear_terminal ; usde_menu ;;
        3) clear_terminal ; owm_menu ;;
        4) clear_terminal ; install_menu ;;
        5) clear_terminal ; menu ;;
        6) exit_message ;;
        *) clear_terminal ; print "Ivalid option"; de_wm_menu;
    esac
}

# =================================================

# ===<Installer menu>===

#<Post install>
minimal(){
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
}


normal(){
    sudo pacman -S git
    PPKGS=(
        'firefox' #browser default
        'alacritty' #default terminal
        'dolphin' #default file manager
        #'thunar' #file manager
        'engrampa' #archive manager
        'vlc' #video player
        'nomacs' #image viewer
        #'feh' #image viewer
        'audacious' #audio player
        'neofetch'
        'htop' #terminal task manager
        'xrandr' #screen resolution manager
        'nitrogen' #teminal background manager
        #'picom' #compositor
        'xorg-xinput' #xorg input manager
        'popsicle' #usb flasher for linux(curently windows iso not suported)
        'libreoffice'
        'calibre'
        'flameshot'
        'onboard'
        'qbittorrent'
        #'redshift'
        'lightdm' #login manager
        'lightdm-gtk-greeter'

    )
    for PPKG in "${PPKGS[@]}"; do
        echo "Installing: ${PPKG} via pacman"
        sudo pacman -S "$PPKG" --noconfirm --needed
    done
    #enabling services
    sudo systemctl enable lightdm.service

}
# Submenu's for each selection

package_managers_install_menu(){
    option=(
        'Install flatpak'
        'Install yay'
        'Install paru'
        'Install snapd'
        'Back'
        'Main Menu'
        'Exit'
    )

    generate_menu "${option[@]}"

    read a

    case $a in
        1) clear_terminal ; pacman_install "flatpak" ;;
        2) clear_terminal ; yay_setup ; yay_install "aura-bin";;
        3) clear_terminal ; paru_setup;;
        4) clear_terminal ; yay_install "snapd" ;;
        5) clear_terminal ; package_managers_menu ;;
        6) clear_terminal ; menu ;;
        7) exit_message ;;
        *) clear_terminal ; print "Ivalid option"; package_managers_install_menu ;;
    esac

}

package_managers_uninstall_menu(){
    option=(
        'Uninstall flatpak'
        'Uninstall yay'
        'Uninstall paru'
        'Uninsstall snapd'
        'Back'
        'Main Menu'
        'Exit'
    )

    generate_menu "${option[@]}"

    read a

    case $a in
        1) clear_terminal ; pacman_remove "flapak" ;;
        2) clear_terminal ; pacman_remove "yay" ;;
        3) clear_terminal ; pacman_remove "paru" ;;
        4) clear_terminal ; pacman_remove "snapd" ;;
        5) clear_terminal ; package_managers_menu ;;
        6) clear_terminal ; menu ;;
        7) exit_message ;;
        *) clear_terminal ; print "Ivalid option"; package_managers_uninstall_menu ;;
    esac

}

package_managers_show_description_menu(){
        printf "Press enter to go back. \n"
         echo "
         Flatpak:
            Flatpak is a tool for managing applications and the runtimes they use. In the Flatpak
            model, applications can be built and distributed independently from the host system they
            are used on, and they are isolated from the host system ('sandboxed') to some degree, at
            runtime.

         Yay:
            Yet Another Yogurt - An AUR Helper Written in Go

         Snap:
            Service and tools for management of snap packages.

         Paru:
            Paru is your standard pacman wrapping AUR helper with lots of features and minimal interaction.
         "
        read a

        case $a in
            *) clear_terminal; package_managers_menu;;
        esac
}

package_managers_menu(){
    option=(
        'Install'
        'Uninstall'
        'Show Description'
        'Back'
        'Main Menu'
        'Exit'

    )

    generate_menu "${option[@]}"
    read a
    case $a in
        1) clear_terminal ; package_managers_install_menu ;;
        2) clear_terminal ; package_managers_uninstall_menu ;;
        3) clear_terminal ; package_managers_show_description_menu;;
        4) clear_terminal ; install_menu ;;
        5) clear_terminal ; menu ;;
        6) exit_message ;;
        *) clear_terminal ; print 'Ivalid option' ; package_managers_menu;;

    esac

}
check_user_script(){
  if ! user_script=$(find user-install.sh 2>/dev/null| wc -l); then
  	user_script=0;
  fi
  if (($user_script == 0)) ;then
  	print "User Script not found. Going back"
    sleep 2
    clear_terminal
    install_menu
  fi
  #bash ./user-install.sh
}
install_menu(){
    option=(
      'Desktop Enviroment & Window managers menu'
      'Minimal instalation'
      'Normal instalation'
      'Package managers(yay,flatpak,snap)'
      'After install(user-specific)'
      'Back'
      'Main menu'
      'Exit'
    )
    generate_menu "${option[@]}"
    read a

    case $a in
        1) clear_terminal ; de_wm_menu;;
        2) clear_terminal ; minimal ; install_menu ;;
        3) clear_terminal ; normal ; install_menu ;;
        4) clear_terminal ; package_managers_menu ;;
        5) clear_terminal ; check_user_script ;;
        6) clear_terminal ; system_menu ;;
        7) clear_terminal ; menu ;;
        8) exit_message ;;
        *) clear_terminal ; print 'Invalid option' ; install_menu ;;
    esac

}

# ======================


# ===<System Maintanance menu>===

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

update_keyrings(){

  sudo pacman-key --init
  sudo pacman-key --populate


}
system_maintanance_menu(){
  option=(
    'Update pacman'
    'Update yay'
    'Update flatpak'
    'Check systemd'
    'Log'
    'Delete pacman cache'
    'Delete yay cache'
    'Delete unwanted depedencies'
    'Delete orphan packages'
    'Clean cache'
    'Clean journal'
    'Update keyrings'
    'Disable internal keyboard'
    'Enable internal keyboard'
    'Swap Menu'
    'Back'
    'Main menu'
    'Exit'
  )
    generate_menu "${option[@]}"
    read a
    case $a in
        1) clear_terminal ; update_pacman; system_maintanance_menu ;;
        2) clear_terminal ; update_yay; system_maintanance_menu ;;
        3) clear_terminal ; update_flatpak; system_maintanance_menu ;;
        4) clear_terminal ; check_systemd; system_maintanance_menu ;;
        5) clear_terminal ; log_files_check; system_maintanance_menu ;;
        6) clear_terminal ; delete_pacman_cache; system_maintanance_menu ;;
        7) clear_terminal ; delete_yay_cache; system_maintanance_menu ;;
        8) clear_terminal ; delete_unwanted_dependencies; system_maintanance_menu ;;
        9) clear_terminal ; remove_orphan_packages; system_maintanance_menu ;;
        10) clear_terminal ; clean_cache; system_maintanance_menu ;;
        11) clear_terminal ; clean_journal ; system_maintanance_menu ;;
        12) clear_terminal ; update_keyrings ; system_maintanance_menu ;;
        13) clear_terminal ; disable_internal_keyboard ; system_maintanance_menu ;;
        14) clear_terminal ; enable_internal_keyboard ; system_maintanance_menu ;;
        15) clear_terminal ; swapp_menu ;;
        16) clear_terminal ; system_menu ;;
        17) clear_terminal ; menu ;;
        18) exit_message ;;
        *) clear_terminal ; print 'Invalid option' ; system_maintanance_menu ;;
    esac
}

# ===============================this repo contains a script for easy system maintanance and customizations and some dot files and wallpapers



# ===<Battery charging limit menu>===


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

restore_charging_limit(){

	if [[ $USER != "root" ]];
	then
		echo "Change user to root just for this operation and the switch back to regular user"
	else
		echo "Charging limit changed. Swith back to regular user."
		sudo echo 100 > /sys/class/power_supply/BAT0/charge_control_end_threshold
	fi

}


battery_charge_limit_menu(){
  option=(
  'Show charging limit'
  'Change charging limit(default 60%)'
  'Change charging limit(custom)'
  'Restore to default'
  'Back'
  'Exit'
  )

  generate_menu "${option[@]}"
	read choice
	case $choice in
		1) clear_terminal ; show_charging_limit ; battery_charge_limit_menu ;;
		2) clear_terminal ; change_charging_limit_default ; battery_charge_limit_menu ;;
		3) clear_terminal ; change_charging_limit_custom ; battery_charge_limit_menu ;;
    4) clear_terminal ; restore_charging_limit ; battery_charge_limit_menu ;;
		5) clear_terminal ; menu ;;
		6) exit_message ;;
    *) clear_terminal ; print 'Invalid option' ; battery_charge_limit_menu ;;
	esac
}

# ===================================

# ===<Swap menu>===

show_swaps(){
    echo "Showing Swaps....
    Awailable Swaps"
    cat /proc/swaps
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
    echo "Showing swappiness value...
    The value is:"
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
  option=(
  'Show Swaps'
  'Disable Swaps'
  'Enable Swaps'
  'Show Swappiness Value '
  'Change Swappiness'
  'Back'
  'Main Menu'
  'Exit'
  )
    generate_menu "${option[@]}"
    read a
    case $a in
        1) clear_terminal ; show_swaps ; swapp_menu ;;
        2) clear_terminal ; disable_swaps ; swapp_menu ;;
        3) clear_terminal ; enable_swaps ; swapp_menu ;;
        4) clear_terminal ; show_swappiness_value ; swapp_menu ;;
        5) clear_terminal ; change_swappiness_value ; swapp_menu ;;
        6) clear_terminal ; system_menu ;;
        7) clear_terminal ; menu ;;
        8) exit_message ;;
        *) clear_terminal ; print 'Invalid option' ; swapp_menu ;;
    esac
}


# =================


# ===<System menu>=====

system_menu(){
  option=(
  'Installer Menu'
  'System Maintanance'
  'Back'
  'Exit'
  )
    generate_menu "${option[@]}"
    read a
    case $a in
        1) clear_terminal ; install_menu ;;
        2) clear_terminal ; system_maintanance_menu ;;
        3) clear_terminal ; menu ;;
        4) exit_message ;;
        *) clear_terminal ; print 'Invalid option' ; system_menu ;;
    esac
}

# =====================

# ===<Night Light menu>===
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
    printf "What value do you want to set?(default 3000)\n[(d)efault/(c)ustom/(b)ack]:"
    read a
    case $a in
        d) default_temperature ; night_light_menu;;
        c) custom_temperature ; night_light_menu;;
        b) clear_terminal ; night_light_menu;;
        *) clear_terminal; enable_night_light;;
    esac

}
disable_night_light(){
    echo "Disabling night light"
    redshift -x
}
night_light_menu(){
    option=(
        'Enable Night Light'
        'Disable Night Light'
        'Back'
        'Exit'
    )
    generate_menu "${option[@]}"
    read a
    case $a in
        1) clear_terminal ; enable_night_light ; night_light_menu ;;
        2) clear_terminal ; disable_night_light ; night_light_menu ;;
        3) clear_terminal ; menu ;;
        4) exit_message ;;
        *) clear_terminal ; print 'Invalid option' ; night_light_menu ;;
    esac
}

# ========================
# ===<The main menu>===
system_update_check="check"

menu(){
    if [ "$system_update_check" == "check" ]; then
    #check system updates
    print " \n Checking for available updates...."

    if ! pacman_updates=$(checkupdates 2> /dev/null | wc -l ); then
        pacman_updates=0
    fi

    if ! yay_updates=$(yay -Su --aur --quiet | wc -l); then
        yay_updates=0
    fi

    if ! flatpak_updates=$(flatpak remote-ls  --updates | wc -l); then
        flatpak_updates=0
    fi
    else
      pacman_updates="Skipping"
      yay_updates="Skipping"
      flatpak_updates="Skipping"
    fi
    clear_terminal
    #checking if the system has the necessars packaage managers installed
    check_flatpak=$(check_command "flatpak")
    check_yay=$(check_command "yay")
    check_paru=$(check_command "paru")
    check_aura=$(check_command "aura")

    printf "If one of the package managers it's not installed please go and install the needed package managers.
    \n Installed Package Managers \n"

    echo " Yay: $check_yay"
    echo " Paru: $check_paru"
    print " Flatpak: $check_flatpak"
    print " Aura: $check_aura \n"

    print " pacman available updates: $pacman_updates"
    print " yay available updates: $yay_updates"
    print " flatpak available updates: $flatpak_updates"

    option=(
        'System Menu'
        'Night Light'
        'Charging Limit'
        'Winetricks'
        'Exit'
    )
     generate_menu "${option[@]}"
     read a
     case $a in
         1) clear_terminal ; system_menu ;;
         2) clear_terminal ; night_light_menu ;;
		     3) clear_terminal ; battery_charge_limit_menu ;;
         4) clear_terminal ; winetricks ; menu ;;
         5) exit_message ;;
         *) clear_terminal ; print " Invalid option"; menu ;;
     esac
}


# =====================
# Making getop for passing arguments to script
usage(){
	print "
  Usage: SystemManager
	     -h | --help   				        shows this menu
	     -s | --skip-update-check			skips the checking packages available updates
       -d | --default               goes default settings"
	exit 2
}
parsed_arguments=$(getopt -a -n SysManager -o hsd --long help,skip-update-check,default -- "$@")
valid_arguments=$?
if [ "$valid_arguments" != "0" ]; then
	menu
fi
eval set -- "$parsed_arguments"
while :
do
	case "$1" in
		-h | --help) usage ; shift ;;
		-s | --skip-update-check)  system_update_check="skip" ; menu ; shift ;;
    -d | --default) menu; shift;;
		--) shift; break ;;
    *) echo "something went wrong" ; shift;;
	esac
done



# =====================
