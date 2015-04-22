USERNAME=username_as_you_like
GROUPNAME=groupname_as_you_like
sudo cp -r /etc/skel /home/${USERNAME}
sudo useradd ${USERNAME} -d /home/${USERNAME} -s /usr/bin/zsh -g ${GROUPNAME}
sudo chown ${USERNAME}:${GROUPNAME} -R /home/${USERNAME}
