echo "Enjoy :grin:"
sleep 1
clear

#Start

#making necessary folders
mkdir -p ~/.yay
mkdir -p ~/Pictures

#updating the system
echo "Updating your stuff"
sudo pacman --noconfirm -Syu


#aur
if ! command -v yay &> /dev/null
then
    echo "Installing yay"
        git clone https://aur.archlinux.org/yay.git ~/.yay/yay
        (cd ~/.yay/yay/ && makepkg -si )
fi
yay -S --noconfirm polybar

#important packages
echo "Installing necessary packages"
sudo pacman --noconfirm -S alacritty feh dmenu dunst picom flameshot



#Installing picom config
if [ -f ~/.config/picom.conf ]; then
    echo "picom conf backed up and new config installed"
    cp ~/.config/picom.conf ~/.config/picom.conf.bak
    cp config/picom.conf ~/.config/picom.conf
else
    echo "picom conf installed"
    mkdir -p ~/.config/picom
    cp config/picom.conf ~/.config/picom.conf
fi

#Installing alacritty config
if [ -f ~/.config/alacritty/alacritty.yml ]; then
    echo "alacritty config backed up and new config installed"
    cp ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.bak
    cp config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
else
    echo "alacritty config installed"
    mkdir -p ~/.config/alacritty
    cp config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

#Installing dunst config
if [ -d ~/.config/dunst ]; then
    echo "dunst config backed up and new config installed"
    mkdir ~/.config/dunst.bak && mv ~/.config/dunst/* ~/.config/dunst.bak/
    cp -r config/dunst/* ~/.config/dunst
else
    echo "dunst config installed"
    mkdir ~/.config/dunst
    cp -r config/dunst/* ~/.config/dunst
fi

#Adding wallpapers
if [ -d ~/Pictures/wallpapers ]; then
    echo "adding wallpapers"
    cp wallpapers/houses.png ~/Pictures/houses.png
else
    echo "adding wallpapers"
    cp  wallpapers/houses.png ~/Pictures/houses.png;
fi

#Installing i3 config
if [ -f ~/.config/i3/config ]; then
    echo "i3 config backed up and new config installed"
    cp ~/.config/i3/config ~/.config/i3/config.bak
    cp config/i3/config ~/.config/i3/config
else
    echo "i3 config installed"
    cp config/i3/config ~/.config/i3/config
fi


#Installing polybar config
if [ -d ~/.config/polybar ]; then
    echo "polybar config backed up and new config installed"
    mkdir ~/.config/polybar.bak && mv ~/.config/polybar/* ~/.config/polybar.bak/
    cp -r config/polybar/forest ~/.config/polybar
else
    echo "polybar config installed"
    mkdir ~/.config/polybar
    cp -r config/polybar/forest ~/.config/polybar
fi
