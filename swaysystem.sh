dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install -y gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg vlc git sway nano firefox gnome-terminal nautilus gedit baobab libreoffice node wine lutris steam playerctl android-tools
mkdir -p /home/arte/.config/sway
curl https://raw.githubusercontent.com/arte921/sway-configs/master/pc > /home/arte/.config/sway/config
mkdir -p /home/arte/pictures
curl https://i.redd.it/ijsf9nney0a41.jpg > /home/arte/pictures/ijsf9nney0a41.jpg 
echo sway >> .bash_profile


