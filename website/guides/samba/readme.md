---
title: Connecting Windows Linux
author: Kevin J. Walchko
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
abstract: This will show you how to connect your Windoze machine to a Linux/Unix system. You will need both file system access to edit files and command line access to run your python programs.
---

# File System Access

## Connect to Samba Share

Just like the network other drives, `K drive` for example, we can connect to
linux and bring up its hard drive. This will allow us to drag/drop code on
the linux system and edit it.

Using this method requires Windows to understand the zeroconfig protocol
linux uses. The **only** way I know how to do this is to install
[*iTunes*](https://www.apple.com/itunes/download/). If
you don't do this, then you will not be able to connect to the robot, since the IP
addresses are served up via
[DHCP](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol),
and they will change from time to time.

1. Click the **Start** button and select **Computer**
2. Click **Map a network drive** on the top toolbar

![](pics/mapDrive.png)

3. Enter the share name: `\\robot_name.local\pi`
    1. Make sure to check the box **Connect using different credentials**

![](pics/logOn.png)

4. Click **Finish**
5. Input *username* and *password*

## Disconnect from Samba Share

![](pics/disconnect.png)

1. Click the **Start** button and select **Computer**
2. Right click on share
3. Select **Disconnect** from menu


# Command Line

To navigate linux, you need access to the command line. The only way to do that
is to use [secure shell](https://en.wikipedia.org/wiki/Secure_Shell) (ssh). This
process is going to allow you to login without
having to always supply a *username* and *password*. We will first create an
[RSA digital certificate](https://en.wikipedia.org/wiki/Public-key_cryptography)
(or pubic/private keys) and then install that cert on the robot.

The process will look similar to the screenshot below.

![](pics/keygen.png)

1. Download and install [GitBash](https://git-scm.com/downloads) (this gives you everything you need)
2. Open a terminal window and navigate to your home directory, `cd ~`
3. Then generate an encrypted certificate with: `ssh-keygen.exe`. Just accept
   the default values and use an empty pass phrase (yes, not the most secure, but oh well ...)
4. Next we have to send that over to our linux system: `ssh-copy-id pi@robot_name.local`.
   Accept anything that pops up. You will need to put in the *username* and *password*
   to authenticate you can add this digital cert to the system.
5. Now test it out: `ssh pi@robot_name.local`. It should log you directly into
   the robot, your authentication is handled via [Diffie–Hellman](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange)
   protocol and the certificate we just created.
   
# Accessing Windows (or a Samba Share) from Linux
   
Sometimes you need to access a Windoze hard drive or another Linux system with a  Samba share from a Linux system.
      
1. Edit `/etc/fstab` with the following line: //*server*/*share* *mountpoint* cifs username=pi,password=raspberry,defaults,users,auto 0 0
    1. *server*: server name like robot.local or an IP address like 10.10.10.2
    1. *share*: folder to give access too, like `pi` (the default user's home folder)
    1. *mountpoint*: where to mount the remote system to your local system. Typically I put it in /mnt, so something like:
        ```bash
        sudo mkdir /mnt/samba
        sudo chown pi:pi /mnt/samba      
        ```
    1. Yes, I am using the default user and password ... change however you see fit.
1. Now this should mount automatically after boot, but if not: `sudo mount -a`
