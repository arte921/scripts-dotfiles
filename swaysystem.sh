#arg 1: pc or laptop, arg 2: username

dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install -y gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg vlc git sway nano firefox gnome-terminal nautilus gedit baobab libreoffice node wine lutris steam playerctl android-tools polkit-gnome cockpit
mkdir -p /home/$2/.config/sway
curl https://raw.githubusercontent.com/arte921/sway-configs/master/$1 > /home/$2/.config/sway/config
mkdir -p /home/$2/pictures
curl https://i.redd.it/ijsf9nney0a41.jpg > /home/$2/pictures/ijsf9nney0a41.jpg 
echo sway >> .bash_profile
sudo systemctl enable --now cockpit.socket
sudo firewall-cmd --add-service=cockpit
sudo firewall-cmd --add-service=cockpit --permanent
sudo systemctl enable --now sshd.service
