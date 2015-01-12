SFTP server Docker image source
===============================

This is a fork of https://github.com/luzifer-docker/sftp-share which nearly did what I wanted. I also wanted to be able to specify the host keys for the sftp server, so I have added a VOLUME you can put them in.

Running this image
-------------------

First you need to start a data image with some keys in. (Generate keys with ssh-keygen). Since the permissions on the keys must be very strict, it's better to have them in a docker than mount them from your own disk. 

	docker run -p 2022:22 -e "USER=myuser" -e "PASS=verysecretpwd" --volumes-from <data_volume>  -d emilybache/sftp-share
