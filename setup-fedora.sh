dnf update -y
dnf install -y git sway nano chromium nodejs playerctl android-tools slurp grim wl-clipboard dkms bc kernel-devel kernel-headers blueman
curl https://raw.githubusercontent.com/arte921/scripts-dotfiles/master/sway-config > /home/arte/.config/sway/config
curl https://raw.githubusercontent.com/arte921/scripts-dotfiles/master/.bashrc > /home/arte/.bashrc
sudo systemctl enable --now sshd
git clone https://github.com/tomaspinho/rtl8821ce.git
chown -R arte /home/arte
echo "reboot, go in rtl8821ce folder, run sudo ./dkms-install.sh, reboot again just in case"
