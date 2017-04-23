# git-ssh

Simple vanila git server over sshd.


To run:

    host_machine$ docker run -P -d -v /host_machine/authorized_keys:/home/git/.ssh/authorized_keys -v /host_machine/data/:/data git


