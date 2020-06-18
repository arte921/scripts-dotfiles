mkdir -p ~/.config/sway
cp sway-config /home/arte/.config/sway/config
cp .bashrc /home/arte/.bashrc
mkdir -p ~/.keep/sauce/
cp -r scripts ~/.keep/
cd ~/.keep/sauce
git config --global credential.helper store
