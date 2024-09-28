#!/bin/bash

#==============================================#
#                     DETAILS                  #
#==============================================#

# TITLE: Tx Power Blast v4.1
# AUTHOR: Majik Cat Security
# DATE: August 18, 2024
# GITHUB: https://github.com/hwac121

#================================================================================================
#========                                 FUNCTIONS                                     ========#
#================================================================================================

Splash(){
	echo -e "\e[31m ______ __ __ ____   ___  __    __   ___ ____       ____  _      ____  ___________ \e[0m";
	sleep 0.05
	echo -e "\e[31m|      |  |  |    \ /   \|  |__|  | /  _]    \     |    \| |    /    |/ ___/      |\e[0m";
	sleep 0.05
	echo -e "\e[31m|      |  |  |  o  )     |  |  |  |/  [_|  D  )    |  o  ) |   |  o  (   \_|      |\e[0m";
	sleep 0.05
	echo -e "\e[31m|_|  |_|_   _|   _/|  O  |  |  |  |    _]    /     |     | |___|     |\__  |_|  |_|\e[0m";
	sleep 0.05
	echo -e "\e[31m  |  | |     |  |  |     |  \`  '  |   [ |    \     |  O  |     |  _  |/  \ | |  |  \e[0m";
	sleep 0.05
	echo -e "\e[31m  |  | |  |  |  |  |     |\      /|     |  .  \    |     |     |  |  |\    | |  |  \e[0m";
	sleep 0.05
	echo -e "\e[31m  |__| |__|__|__|   \___/  \_/\_/ |_____|__|\_|    |_____|_____|__|__| \___| |__|  \e[0m";
	sleep 0.05
	echo -e "\e[31m                                                                                   \e[0m";
	sleep 0.05
	figlet "Version 4.1 designed for Kali Linux";
	echo -e "Visit my channel on YouTube - Majik Cat Security" | lolcat
	echo -e "\e[35mby Majik Cat Security\e[0m";
	sleep 0.05
	echo "......................................................................................"
	sleep .75
	echo " "
}

#================================================================================================
#========                          CHECK IF ROOT OR EXIT                                ========#
#================================================================================================

echo "$(whoami)"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "Now running as root..."
sleep 2

#=================================================================================================
#========                                 MENU SYSTEM                                    ========#
#=================================================================================================

options=("Show Status" "What is Connected" "wlan1 Connection Status" "wlan2 Connections Status" "Boost wlan1" "Boost wlan2" "Set Custom Channel (wlan1)" "Set Custom Channel (wlan2)" "Restart Network Manager" "wlan1 Managed Mode (ON)" "wlan2 Managed Mode (ON)" "wlan1 Monitor Mode (ON)" "wlan2 Monitor Mode (ON)" "Internal IP" "External IP" "Check Tx Power" "Quit")
PS3='Choose which WiFi card to boost and open all channels: '

while [ "$menu" != 1 ]; do
clear
Splash
select opt in "${options[@]}" ; do
		case $opt in
#=================================================================================================
#========                                 WiFi CARD MENU                                 ========#
#=================================================================================================
		"Show Status")
			clear
			Splash
			echo -e "Now showing general status";
			nmcli dev status
			sleep 6
		break
		;;
		"What is Connected")
			clear
			Splash
			echo -e "Now showing what is connected";
			nmcli connection show
			echo -e " "
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to the main menu in 8 seconds...\e[0m"
			sleep 6
		break
		;;
		"wlan1 Connection Status")
			nmcli device show wlan1
			echo -e " "
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to the main menu in 8 seconds...\e[0m"
			sleep 8
		break
		;;
		"wlan2 Connection Status")
			nmcli device show wlan2
			echo -e " "
			echo -e "\e[31mPlease Note:\e[7mYou will retuen to the main menu in 8 seconds...\e[0m"
			sleep 8
		break
		;;
		"Boost wlan1")
			clear
			Splash
			echo -e "Now boosting $opt - option $REPLY"
			echo " "
			sleep 0.5
			echo -e "Taking down \e[34mwlan1\e[0m";
			ifconfig wlan1 down
			echo " "
			sleep 3
			echo -e "Setting Region to \e[34mGuyana\e[0m";
			iw reg set GY
			echo " "
			sleep 3
			echo -e "Starting \e[34mwlan1\e[0m"
			ifconfig wlan1 up
			echo " "
			sleep 2
	        echo -e "Pulled \e[34mwlan1\e[0m interface up";
			echo " "
			sleep 1
			echo -e "Setting \e[34mTxPower to 30\e[0m";
			iwconfig wlan1 txpower 30
			echo " "
			sleep 2
			clear
			iwconfig
			sleep 3
			clear
			echo -e "\e[33mTx Power Now Set\e[0m";
			sleep 1
		break
		;;
		"Boost wlan2")
            clear
            Splash
            echo -e "Now boosting $opt - option $REPLY"
            echo -e " "
            sleep 0.5
            echo -e "Taking down \e[34mwlan2\e[0m";
            ifconfig wlan2 down
            echo -e " "
            sleep 1
            echo -e "Setting Region to \e[34mGuyana\e[0m";
            iw reg set GY
            echo -e " "
            sleep 1
			echo -e "Starting \e[34mwlan2\e[0m"
			ifconfig wlan2 up
			echo " "
			sleep 1
            echo -e "Pulled \e[34mwlan2\e[0m interface up";
			echo " "
			sleep 1
            echo -e "Setting \e[34mTxPower to 30\e[0m";
            iwconfig wlan2 txpower 30
            echo -e " "
            sleep 1
            clear
            sleep 0.5
            iwconfig
            sleep 1
            clear
            echo -e "\e[33mTx Power Now Set\e[0m";
			sleep 1
        break
        ;;
		"Set Custom Channel (wlan1)")
			clear
			Splash
			echo "Enter chosen channel number"
			read mychan1
			echo "Setting Custom Channel to wlan1..."
			iwconfig wlan1 channel $mychan1
			echo " "
			echo "Channel now set to $mychan"
			sleep 2
			clear
		break
		;;
		"Set Custom Channel (wlan2)")
			clear
			Splash
			echo "Enter chosen channel number"
			read mychan2
			echo "Setting Custom Channel to wlan2..."
			iwconfig wlan2 channel $mychan2
			echo " "
			echo "Channel now set to $mychan"
			sleep 2
			clear
		break
		;;
		"Restart Network Manager")
			clear
			Splash
			echo "Restarting the Network Manager..."
			service NetworkManager restart
			sleep 2
			echo -e "\e[31mPlease Note:\e[0m \e[7mAllow a minute or two for devices to reconnect.\e[0m"
			sleep 4
		break
		;;
		"wlan1 Managed Mode (ON)")
			clear
			Splash
			figlet -c "Entering wlan1" | lolcat
			figlet -c "Managed Mode" | lolcat
			ifconfig wlan1 down
			iwconfig wlan1 mode managed
			ifconfig wlan1 up
			clear
			echo "Action Complete!"
			sleep 4
		break
		;;
		"wlan2 Manager Mode (ON)")
			clear
			Splash
			figlet -c "Entering wlan2" | lolcat 
			figlet -c "Monitor Mode" | lolcat
			ifconfig wlan2 down
			iwconfig wlan2 mode managed
			ifconfig wlan2 up
			clear
			echo "Action Complete!"
			sleep 4
		break
		;;
		"wlan1 Monitor Mode (ON)")
			clear
			Splash
			figlet -c "Turning Off wlan1" | lolcat
			figlet -c "Monitor Mode" | lolcat
			ifconfig wlan1 down
			iwconfig wlan1 mode monitor
			ifconfig wlan1 up
			clear
			echo "Action Complete!"
			sleep 4
		break
		;;
        "wlan2 Monitor Mode (ON)")
            clear
            Splash
            figlet -c "Turning Off wlan2" | lolcat
            figlet -c "Monitor Mode" | lolcat
            ifconfig wlan2 down
            iwconfig wlan2 mode monitor
            ifconfig wlan2 up
            clear
            echo "Action Complete!"
            sleep 4
        break
        ;;
#=================================================================================================
#========                                  UTILITIES                                     ========#
#=================================================================================================
		"Internal IP")
			clear
			Splash
			echo -e "#\e[33m***************************\e[0m #"
			sleep 0.15
			echo -e "#\e[33m**\e[0m      \e[32mINTERNAL IP:\e[0m     \e[33m**\e[0m #"
			sleep 0.15
			echo -e "#\e[33m****************************\e[0m#"
			sleep 0.25
			echo -e " "
			sleep 0.25
			hostname -I
			sleep 0.25
			echo -e " "
			sleep 0.25
			ifconfig
			sleep 0.25
			echo -e " "
			sleep 1.5
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to the main menu in 15 seconds...\e[0m"
			sleep 15
			clear
		break
		;;
		"External IP")
			clear
			Splash
			echo -e "#\e[33m***************************\e[0m#"
			sleep 0.15
			echo -e "#\e[33m**\e[0m      \e[32mEXTERNAL IP:\e[0m     \e[33m**\e[0m#"
			sleep 0.15
			echo -e "#\e[33m****************************\e[0m#"
			sleep 0.25
			echo -e " "
			curl ifconfig.me
			echo -e " "
			sleep 1.5
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to main menu in 15 seconds...\e[0m"
			sleep 15
			clear
		break
		;;
		"Check Tx Power")
			clear
			Splash
			iwconfig
			sleep 1.5
			echo -e " "
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to the main menu in 15 seconds...\e[0m"
			sleep 15
			clear
		break
		;;
#=================================================================================================
#========                        CREDITS, HELP, VERSION, QUIT                            ========#
#=================================================================================================
		"Quit")
			clear
			Splash
			echo -e " "
			echo -e "\e[37mThank you for using TX Power Blast 4.1 by Majik Cat Security - August 2024\e[0m"
			sleep 3
			clear
			menu=1
		break
		;;
#=================================================================================================
#========                        ERROR CAPTURE - INVALID OPTION                          ========#
#=================================================================================================
		*) 
			clear
			Splash
			echo -e "invalid option $REPLY"
		break
		;;
		esac
	done
done

exit 0
