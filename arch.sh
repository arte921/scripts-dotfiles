mkdir -p ~/.config/sway
cp sway-config > /home/arte/.config/sway/config
cp .bashrc > /home/arte/.bashrc
sudo systemctl enable --now sshd
mkdir -p ~/.keep/sauce/
cp -r scripts ~/.keep/
cd ~/.keep/sauce
git clone https://github.com/tomaspinho/rtl8821ce.git
git config --global credential.helper store
