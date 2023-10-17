echo "Setting Variables..."
#Replace this variable with the filename you wish to export to. Default is "enum_log"
EXPORT_FILE=enum_log
echo "Variables set. To re-configure, view script."

echo "Enumerating System Information..."
echo "    ~ Host Name ~\n\n" >> $EXPORT_FILE
hostname >> $EXPORT_FILE
echo "\n\n    ~ Distribution ~\n\n" >> $EXPORT_FILE
cat /etc/issue >> $EXPORT_FILE
cat /etc/*release* >> $EXPORT_FILE
echo "\n\n    ~ Kernel Version ~\n\n" >> $EXPORT_FILE
uname -a >> $EXPORT_FILE
echo "\n\n    ~ Hardware Information ~\n\n" >> $EXPORT_FILE
lscpu >> $EXPORT_FILE
free -h >> $EXPORT_FILE
lsblk >> $EXPORT_FILE
df -h >> $EXPORT_FILE
echo "\n\n    ~ Environment Variables ~\n\n" >> $EXPORT_FILE
env >> $EXPORT_FILE
echo "\n\n    ~ Packages (Debian) ~\n\n" >> $EXPORT_FILE
dpkg -l >> $EXPORT_FILE
#This next line leaves space in order to make the output more readable and segment this section of enumeration.
echo "\n\n\n\n" >> $EXPORT_FILE
echo "System Information Enumerated."

#Each of these sections of enumeration can "pop out" or more code can be slotted within in order to add to them. I tried to make the code modular here.

echo "Enumerating Users and Groups..."
echo "\n\n    ~ Current User & All Groups ~\n\n" >> $EXPORT_FILE
whoami >> $EXPORT_FILE
groups >> $EXPORT_FILE
echo "\n\n    ~ List of Accounts ~\n\n" >> $EXPORT_FILE
ls -al /home/ >> $EXPORT_FILE
cat /etc/passwd >> $EXPORT_FILE
echo "\n\n    ~ Legitimate Login History ~\n\n" >> $EXPORT_FILE
last >> $EXPORT_FILE
#Just as before, this next line leaves space for modular readability.
echo "\n\n\n\n" >> $EXPORT_FILE
echo "Users and Groups Enumerated."

echo "Enumerating Network Information..."
echo "\n\n     ~ Internet Protocol Addresses and Adapter ~\n\n" >> $EXPORT_FILE
#ifconfig may not be configured on every machine. You may wish to comment the line out with # to avoid logging errors.
ifconfig >> $EXPORT_FILE
ip a s >> $EXPORT_FILE
cat /etc/networks >> $EXPORT_FILE
echo "\n\n    ~ Running Network Services ~\n\n" >> $EXPORT_FILE
netstat >> $EXPORT_FILE
echo "\n\n    ~ Internal Networks  ~\n\n" >> $EXPORT_FILE
cat /etc/hostname >> $EXPORT_FILE
cat /etc/hosts >> $EXPORT_FILE
cat /etc/resolv.conf >> $EXPORT_FILE
echo "\n\n    ~ Other Hosts on the Network ~\n\n" >> $EXPORT_FILE
#This utility might also not be installed and you may wish to comment out this line as well.
arp -a >> $EXPORT_FILE
route >> $EXPORT_FILE
#Space for modular readability
echo "\n\n\n\n" >> $EXPORT_FILE
echo "Network Information Enumerated."

echo "Enumerating Processes and Cron Jobs..."
echo "\n\n    ~ Processes on this Session~\n\n" >> $EXPORT_FILE
ps >> $EXPORT_FILE
echo "\n\n    ~ Processes ~\n\n" >> $EXPORT_FILE
ps aux >> $EXPORT_FILE
echo "\n\n    ~ Cron Jobs ~\n\n" >> $EXPORT_FILE
cat /etc/cron* >> $EXPORT_FILE
crontab -l >> $EXPORT_FILE
#Space for modular readability
echo "\n\n\n\n" >> $EXPORT_FILE
echo "Proccess and Cron Jobs Enumerated."

echo "Script finished."
