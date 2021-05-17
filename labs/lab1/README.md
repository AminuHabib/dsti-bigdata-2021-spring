Big Data Ecosystem

## Lab 1: Setting up the connection to Adaltas Cloud

### Context

The Hadoop cluster that you will be using for this class is located on Adaltas Cloud that is on a private network only accessible through a VPN ([Virtual Private Network](https://en.wikipedia.org/wiki/Virtual_private_network)) tunnel. The VPN solution used is [OpenVPN](https://openvpn.net/).

### Prerequisites

You should have received an email from Adaltas containing a .ovpn file that you will use to open the connect via VPN:

- Find the email (also check your “Spam” folder)
- Download the .ovpn file

### Installing the VPN client

1. Depending on your OS, install the OpenVPN client:
   1. On Windows, find the installer here: https://openvpn.net/vpn-client/
   2. On Mac, you can use Tunnelblick: https://tunnelblick.net/ (or the official client https://openvpn.net/vpn-client/)
   3. On Linux, if you have Gnome, you can use the [networkmanager-openvpn](https://wiki.archlinux.org/index.php/Networkmanager-openvpn) package. Otherwise, use your distribution package manager to install the openvpn package.
2. Import the .ovpn file to the client (the way to do so depends on your OS and your client, read the docs!)
3. Start the VPN connection
4. Test that everything is working by pinging the edge server:
   ```
   ping edge-1.au.adaltas.cloud
   ```

### VPN issues troubleshooting

Before asking for help:

- Check the VPN client logs for errors. Use Google to understand what is going on
- Check if you have a DNS issue, ping the edge server using its IP address instead of its FQDN: ping 10.0.0.63
- Check that your client is well installed

If still having trouble, contact your teacher via email using the tag `[DSTI][VPN]` and join:

- The client logs
- The results returned by the ping requests (via FQDN and IP)
- Any other information you find useful

### Connecting via SSH

To interact with the cluster, we will connect to the edge server in order to run commands. We will use the SSH ([Secure SHell](<https://en.wikipedia.org/wiki/Ssh_(Secure_Shell)>)) protocol to open a shell on the edge server and write commands.
To connect via SSH:

1. Check the email you received from Adaltas. You will find your username, password, and a sample SSH command there. My username is gauthier, this is the command I received:

```
ssh gauthier@edge-1.au.adaltas.cloud
```

2. On Windows only, you will have to install Putty: https://www.putty.org/
3. Now open a terminal and run the command from step 1.
4. On your first connection, you will be asked to change your password. **Read the instructions carefully: when you are prompted “current password”, type the temporary password that you received by email.** Please store your new password in a safe place.

### Linux commands

Now your goal is to try out Linux commands. Check out this tutorial https://maker.pro/linux/tutorial/basic-linux-commands-for-beginners and of course, there are all the answers you need on Google.
Ultimately, you have to create a file in the folder that your teacher will give you. The file has to:

- Be named after your username with the extension .txt (e.g. gauthier.txt)
- Write a “Hello world” message inside
