echo "Enjoy :grin:"
sleep 1
clear

# Script for installing the rice

mkdir -p ~/yay

# system update

sudo pacman --noconfirm -Syu

# yay installation
if ! command -v yay &> /dev/null
then
    echo "Installing yay"
        git clone https://aur.archlinux.org/yay.git ~/yay
        (cd ~/yay/ && makepkg -si )
fi
# Dependecies moment

sudo pacman --noconfirm -S alacritty dmenu dunst picom feh flameshotyay -S --noconfirm polybar

# Rice time!!!

git clone https://github.com/BibooChi/I3wm-rice.git

# Config file tranferring

cd config
if [ -f ~/.config/picom.conf ]; then
    echo "picom conf backed up and new config installed"
    cp ~/.config/picom.conf ~/.config/picom.conf.bak
    cp /picom/picom.conf ~/.config/picom.conf
else
    echo "picom conf installed"
    mkdir -p ~/.config/picom
    cp /picom/picom.conf ~/.config/picom.conf
fi

if [ -f ~/.config/alacritty/alacritty.yml ]; then
    echo "alacritty config backed up and new config installed"
    cp ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.bak
    cp alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
else
    echo "alacritty config installed"
    mkdir -p ~/.config/alacritty
    cp alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

if [ -d ~/.config/dunst ]; then
    echo "dunst config backed up and new config installed"
    mkdir ~/.config/dunst.bak && mv ~/.config/dunst/* ~/.config/dunst.bak/
    cp -r dunst/* ~/.config/dunst
else
    echo "dunst config installed"
    mkdir ~/.config/dunst
    cp -r dunst/* ~/.config/dunst
fi

if [ -f ~/.config/i3/config ]; then
    echo "i3 config backed up and new config installed"
    cp ~/.config/i3/config ~/.config/i3/config.bak
    cp i3/config ~/.config/i3/config
else
    echo "i3 config installed"
    cp i3/config ~/.config/i3/config
fi

cd

if [ -d ~/Pictures ]; then
    echo "adding wallpapers"
    cp houses.png  ~/Pictures
else
    echo "adding wallpapers"
    mkdir ~/Pictures && cp -r houses.png ~/Pictures;
fi

cd config

clear
echo "LAST STEP!!!"
echo "What's your resolution"
echo "[1] 1366x768"
echo "[2] 1920x1080"
read res
if [[ "$res" == "1" ]]; then
    if [ -d ~/.config/polybar ]; then
        echo "polybar config backed up and new config installed"
        mkdir ~/.config/polybar.bak && mv ~/.config/polybar/* ~/.config/polybar.bak/
        cp -r polybar/forest ~/.config/polybar
    else
        echo "polybar config installed"
        mkdir ~/.config/polybar
        cp -r polybar/forest ~/.config/polybar
    fi
elif [[ $res == "2" ]]; then
        if [ -d ~/.config/polybar ]; then
        echo "polybar config backed up and new config installed"
        mkdir ~/.config/polybar.bak && mv ~/.config/polybar/* ~/.config/polybar.bak/
        cp -r polybar/forest-1080p ~/.config/polybar/forest
    else
        echo "polybar config installed"
        mkdir ~/.config/polybar
        cp -r polybar/forest-1080p ~/.config/polybar/forest
    fi
else
    echo -e "\n:/ bro enter a correct option, run the script again, thats your punishment\n"
    exit 1
fi

echo "Thank you bbg for using the script"

