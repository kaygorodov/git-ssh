# git-ssh

Simple vanilla git server over ssh.

### On your host machine:
	
1. Create file `authorized_keys`:

        touch authorized_keys && chmod 600 authorized_keys

2. Add public ssh keys for which you would like to give an access to git:

        cat my_id_rsa.pub >> authorized_keys 

3. Create folder `data` which is going to be mounted into a container to be used as a root folder for your repositories:

        mkdir data

4. Run a container:

        host_machine$ docker run -p <exposed_port>:22 -d -v /host_machine/authorized_keys:/home/git/.ssh/authorized_keys -v /host_machine/data/:/data akaygorodov/git-ssh


### Create a repo

### In the container

	local_machine$ ssh -p <exposed_port> git@<host_machine_ip>
	git$ cd /data
	git$ mkdir newrepo.git
	git$ cd newrepo.git
        git$ git init --bare


### On your local machine:

	mkdir newrepo
	cd newrepo
	git init
	echo "init" > Readme
	git add Readme
	git commit -m "init"
	git remote add origin ssh://git@<host_machine_ip>:<exposed_port>/data/newrepo.git/
	git push --set-upstream origin master

