citihpc-forensics-collector
===========================

This is the repo for the CitiHPC Forensics Collector.

This tool collects static and dynamic data from a server. The dynamic data is collected by a user rdefined interval and interactions.


revision history
=======
```
written by  Rafael Brito originally created on 09/27/2012
0.1 - created
0.2 - added thread info 02/08/2013
0.3 - added /proc/interruptions, cpuinfo, meminfo 02/18/2013
0.4 - added top -b -n 1 03/08/2013
0.5 - added show threads via top along with regular top
0.6 - added iostat with NFS, /dev/mapper 10/07/2013
0.7 - added nfsstat 10/11/2013
0.8 - added uname, /proc/partitions 10/16/2013
0.9 - iostat parameters rewritten drastically. "sleep" line commented out 10/28/2013
1.0.1 - major revamp -  04/07/2014.
                       - added hostname on the log file name
                       - added lscpu and lscpu -p
                       - added dmidecode
                       - added redhat release
                       - added lspci and lspci -t
                       - added status and stack of running threads (coded via bash arrays)
                       - run turbostat if exists
                       - More info on the screen when running in a loop
1.1 - more info 04/14/2014
                       - added lvs, vgs, pvs, vgdisplay -v, lvdisplay -v and pvdisplay -v;
                       - added df;
                       - added uptime;
                       - suppressed fdisk error output and fixed small code error on the timestamp.
1.2 - added more stuff 04/15/04/07/2014
                       - rc.local
                       - chkconfig -all
1.3 - changed name to citihpc-forensic.sh - 04/29/2014
               - breaking down the output in different files: one with static information (create once) and another set with dynamic information
               (the static info collection is more expensive).
               - new log file names, all using citihpc-forensic

1.4 - more stuff on static collection - 04/30/2014
             - dmesg, ethtool, iptables, netstat -rn, errors on /var/log/messages
             - dynamic: ifconfig -a, arp -a, ethtool -S, larger wait channel column via ps -Teo
1.5 - static: rpm -qa, multipath -ll, asu and conrep - 05/07/2014
              - the script now run for a limited time by default (100 interactions). Gets a command line to overwrite that.
1.5a - fixed conrep command line
1.6 - added second parameter as time interval (like sar command)
1.7 - static: added ethtool -k, ipconfig -a and "ip addr show" - 05/19/2014
1.8a - adding "p" on sar command to show disks instead of devices - 07/23/2014
1.9 - supressing some errors - 07/24/2014
2.0 - Integrating script on git
2.1 - added gpfs metrics collections
2.2 - suppress errors from RHEL5 execution
2.3 - Added ntp.conf, yum.conf and grub.conf. rpm -qa is sorted for better parsing. 09/02/2014.
	Added modprobe.conf and all files under /etc/modprobe.d
```
