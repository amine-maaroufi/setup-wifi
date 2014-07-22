# Determine wireless device model (manufacturer 14e4 for Broadcom):
lspci -vvnn | grep 14e4

# Install Broadcom STA driver for BCM43227: 
sudo apt-get update
sudo apt-get install --reinstall linux-headers-generic build-essential dkms bcmwl-kernel-source
sudo modprobe -r b43 ssb wl brcmfmac brcmsmac bcma
sudo modprobe wl

# Connect (press Fn+F3 to enable wifi if necessary first):
sudo ifconfig wlan0 up
sudo iwlist wlan0 scanning
sudo iwconfig wlan0 essid MYSSID key s:MyWifiPwd
sudo dhclient wlan0

# Troubleshooting commands:
iwconfig
nm-tool
rfkill list
sudo lshw -C network
