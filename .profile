source /usr/share/defaults/etc/profile

export PATH="$HOME/.cargo/bin:$PATH"
if [ -e /home/zeal/.nix-profile/etc/profile.d/nix.sh ]; then . /home/zeal/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
