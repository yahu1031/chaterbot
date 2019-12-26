#!/bin/bash
reset
# ****************
# * Progress Bar *
# ****************
Checking()
{
ProgressBar() {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10

printf "\rChecking packages already installed or not : "
printf "${_progress}%%"
}
# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=100

# Proof of concept
for number in $(seq ${_start} ${_end})
do
    sleep 0.1
    ProgressBar ${number} ${_end}
done

echo
}

# *******
# * T&C *
# *******

tc()
{
  echo -e "\e[31m\033[1mNOTICE : \e[39m\033[0m"
  echo
  echo -e "\033[1mThis is completely for educational purposes. Never use this for any illegal activities and we are not responsible for it. \033[0m"
  echo
  echo -e "\033[1mEnter yes to accept the Terms and Conditions : \033[0m"
  echo
}

# **************
# *    ICON    *
# **************
name()
{
echo "
  ____ _   _    _  _____ _____ ____    ____   ___ _____
/ ___| | | |  / \|_   _| ____|  _ \  | __ ) / _ \_   _|
| |   | |_| | / _ \ | | |  _| | |_) | |  _ \| | | || |
| |___|  _  |/ ___ \| | | |___|  _ <  | |_) | |_| || |
\____|_| |_/_/   \_\_| |_____|_| \_\ |____/ \___/ |_|
"
}
echo -e "

                            ▖▌▌▄
                           ▗▚▚▚▚
                            ▚▚▚▘▘
                             ▌▌▘
                            ▝▞▞▖
                            ▝▞▞
                 ▄▐▞▞▟▐▞▞▟▐▞▟▐▀▌▛▞▞▌▙▚▌▙▚▚▖▖
               ▗▚▚▚▚▜▐▐▐▞▞▞▞▞▞▟▐▞▞▌▌▌▌▌▌▙▚▚▚▖
               ▞▞▞▌▙▚▚▌▌▙▜▐▞▞▌▌▌▌▙▚▜▐▞▟▐▐▞▌▌▌
               ▚▜▐▞▞▞▘   ▐▐▐▚▚▜▐▞▞▞   ▘▛▞▞▟▐▞
               ▌▙▚▚▜▞     ▌▙▚▜▐▚▚▌▖    ▌▛▞▞▞▞
               ▞▞▌▛▞▞▌▖ ▗▗▜▐▞▌▙▚▌▙▖   ▄▚▌▛▞▙▜
               ▚▜▐▞▙▜▐▐▚▌▛▞▌▌▛▞▟▐▞▞▛▞▛▞▞▟▐▚▚▚
               ▜▞▌▙▚▚▜▞▌▙▜▝▝▙▚▜▐▝▝▟▞▌▙▜▞▞▌▛▞▙
               ▌▙▜▐▞▙▚▚▜▐▞▖ ▘▛▞▘▘▐▐▐▞▟▐▞▙▜▐▚▚
               ▞▟▐▚▚▚▜▚▙▚▌▛▄▖  ▖▄▚▜▞▟▞▌▙▚▌▛▞▙
               ▝▞▌▛▞▛▞▙▞▌▛▞▌▙▜▚▜▞▜▞▟▐▞▟▐▞▞▙▜
                 ▀▞▛▞▙▚▚▜▞▙▜▐▞▙▚▜▚▜▐▚▜▐▚▜▞▝
                           ▝▌▙▚▜
                            ▝▞▛▞
                             ▝▘

"
# icon
echo "  [**********************************************************]
              Type 'Install' to install CHATER BOT.
  [**********************************************************]"
echo
read -p '                         ' install
echo
if [ $install != Install ] | [ $install != install ]; then
  echo -e "                              \e[31m\033[1mSorry Wrong Input, Try again.\e[39m\033[0m"
  echo
else
  Checking
  echo
  echo "Please wait until requriements get installed."
  echo
  pip=$(sudo pip -V | cut -c 1-3)
  if [[ pip != "pip" ]]; then
    echo "Installing pip..."
    sudo apt-get install python-pip
  else
    echo "Pip detected."
    echo
  fi
  pip install -r requirements.txt
  echo
  sleep 5s;
  tc
  # sleep 3s;
  read -p '' agree
  if [ $agree != YES ] | [ $agree != yes ]; then
    echo -e "                              \e[31m\033[1mSorry Wrong Input, Try again.\e[39m\033[0m"
    echo
  else
    echo "\033[1mHere you go getting things ready. Allowing all scripts to be executed.\033[0m"
    chmod +777 aiml/*
    chmod +777 aiml/standard/*
    chmod +777 modules/*
    chmod +777 *
    sleep
  fi
echo -e "\033[1mlinuxenum is getting permissions to execute.\033[0m"
sleep 3s
chmod +x modules/linuxenum.sh
echo
echo -e "\033[1mmimipenguin is getting permissions to execute.\033[0m"
sleep 3s
chmod +x modules/mimipenguin.sh
echo
echo -e "\033[1mshellshock is getting permissions to execute.\033[0m"
sleep 3s
chmod +x modules/shellshock.sh
echo
echo -e "\033[1mChater Bot is getting permissions to execute.\033[0m"
sleep 3s
chmod +x hackerbot.py
echo
sleep 3s
name
echo -e "\033[1mEverything seems good. Ready to have a little convo with this bot : )\033[0m"
python hackerbot.py
fi
