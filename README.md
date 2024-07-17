# Netpower
CLI for waking up devices on local network.

If you have neabled Wake-On-Lan on target device, all you need to do is add the device 

    netpower add [host-name] [mac-address]


and then run 

    netpower up [host-name]


## Setup 

To get started execute setup.sh and then source you bashrc 

    ./setup.sh 

Then you can use netpower as you like

## Setup WOL on target device
You have to have a wired connection 

List all interfaces and look for wired connection 

    ifconfig

When you have the infeface name edit `/etc/network/interfaces.d/[interface-name]` and add these lines 

    auto [interface-name]
    iface [interface-name] inet dhcp
    post-up /sbin/ethtool -s [interface-name] wol g

Then if you havent already enabled WOL in BIOS, you need to do that. After that, just add the mac address with the host name to netpower on client computer, and you are good to go!
