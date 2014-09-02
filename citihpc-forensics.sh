# CitiHPC-forensic.sh
# written by  Rafael Brito originally created on 09/27/2012
# see README.md for revision history

MYDIR=/tmp
TODAY=`date +%y%m%d`
MYNAME="CATE CitiHPC Forensic v2.1"
mkdir ${MYDIR}/citihpc-forensic 2>/dev/null
cd ${MYDIR}/citihpc-forensic
mkdir $TODAY 2>/dev/null
cd ${MYDIR}/citihpc-forensic/${TODAY}

MYHOST=`hostname`
NOW=`date +%y%m%d-%H%M%S`

LOGSTATIC="static-citihpc-forensic".$MYHOST.$NOW

echo "Info: $MYNAME Collecting basic information from $MYHOST on $TODAY at $NOW..." >> $LOGSTATIC
echo "Info: $MYNAME Collecting basic information from $MYHOST on $TODAY at $NOW..."

# Getting the number of interactions from command line
# by default it will be 100 interations
if [ -z "$1" ]
then
	TOTALLOOP=100
	echo "Info: No parameters passed, by default it will run $TOTALLOOP interactions without sleep intervals ..."
else
	TOTALLOOP=$1
	echo "Info: forensic will run $TOTALLOOP interactions ..."

	if [ ! -z "$2" ]
	then
		SLEEPINTERVAL=$2
		echo "Info: forensic will sleep $SLEEPINTERVAL seconds during interactions ..."
	fi

fi


echo "Info: uname -a ... `date`" >> $LOGSTATIC
uname -a >> $LOGSTATIC
echo "Info: end of uname -a ... " >> $LOGSTATIC
	
echo "Info: red hat release ... `date`" >> $LOGSTATIC
cat /etc/redhat-release >> $LOGSTATIC
echo "Info: end of red hat release ... " >> $LOGSTATIC

echo "Info: dmidecode machine type - dmidecode | grep -i product ... `date`" >> $LOGSTATIC
dmidecode | grep -i product >> $LOGSTATIC
echo "Info: end of dmidecode machine type ... " >> $LOGSTATIC

echo "Info: fdisk -l ... `date`" >> $LOGSTATIC
fdisk -l 2>/dev/null >> $LOGSTATIC
echo "Info: end of fdisk -l ... `date`" >> $LOGSTATIC

echo "Info: vgdisplay -v ... `date`" >> $LOGSTATIC
vgdisplay -v >> $LOGSTATIC 2>>$LOGSTATIC
echo "Info: end of vgdisplay -v ... `date`" >> $LOGSTATIC

echo "Info: vgs --all ... `date`" >> $LOGSTATIC
vgs --all >> $LOGSTATIC 2>>$LOGSTATIC
echo "Info: end of vgs --all ... `date`" >> $LOGSTATIC
	
echo "Info: pvdisplay -v ... `date`" >> $LOGSTATIC
pvdisplay -v >> $LOGSTATIC 2>>$LOGSTATIC
echo "Info: end of pvdisplay -v ... `date`" >> $LOGSTATIC

echo "Info: pvs --all ... `date`" >> $LOGSTATIC
pvs --all >> $LOGSTATIC 2>>$LOGSTATIC
echo "Info: end of pvs --all ... `date`" >> $LOGSTATIC
	
echo "Info: lvdisplay -v ... `date`" >> $LOGSTATIC
lvdisplay -v >> $LOGSTATIC 2>>$LOGSTATIC
echo "Info: end of lvdisplay -v ... `date`" >> $LOGSTATIC
	
echo "Info: lvs --all ... `date`" >> $LOGSTATIC
lvs --all >> $LOGSTATIC 2>>$LOGSTATIC
echo "Info: end of lvs --all ... `date`" >> $LOGSTATIC
	
echo "Info: mount ... `date`" >> $LOGSTATIC
mount >> $LOGSTATIC
echo "Info: end of mount ... `date`" >> $LOGSTATIC

echo "Info: /dev/mapper ... `date`" >> $LOGSTATIC
ls -l /dev/mapper >> $LOGSTATIC
echo "Info: end of ll /dev/mapper ... `date`" >> $LOGSTATIC

echo "Info: /proc/cpuinfo ... `date`" >> $LOGSTATIC
cat /proc/cpuinfo >> $LOGSTATIC
echo "Info: end of /proc/cpuinfo ..." >> $LOGSTATIC

echo "Info: lscpu ... `date`" >> $LOGSTATIC
lscpu 2>/dev/null >> $LOGSTATIC
echo "Info: end of lscpu ..." >> $LOGSTATIC
	
echo "Info: lscpu -p ... `date`" >> $LOGSTATIC
lscpu -p 2>/dev/null >> $LOGSTATIC
echo "Info: end of lscpu -p ..." >> $LOGSTATIC

echo "Info: /proc/partitions ... `date`" >> $LOGSTATIC
cat  /proc/partitions >> $LOGSTATIC
echo "Info: end of cat /proc/partitions ..." >> $LOGSTATIC

echo "Info: dmidecode full  ... `date`" >> $LOGSTATIC
dmidecode >> $LOGSTATIC
echo "Info: end of dmidecode full ..." >> $LOGSTATIC

echo "Info: lspci -mm   ... `date`" >> $LOGSTATIC
lspci -mm >> $LOGSTATIC
echo "Info: end of lspci -mm ..." >> $LOGSTATIC
	
echo "Info: lspci -t   ... `date`" >> $LOGSTATIC
lspci -t >> $LOGSTATIC
echo "Info: end of lspci -t ..." >> $LOGSTATIC
	
echo "Info: cat /etc/rc.local   ... `date`" >> $LOGSTATIC
cat /etc/rc.local >> $LOGSTATIC
echo "Info: end of cat /etc/rc.local ..." >> $LOGSTATIC
	
echo "Info: chkconfig --list   ... `date`" >> $LOGSTATIC
chkconfig --list >> $LOGSTATIC
echo "Info: end of chkconfig --list ..." >> $LOGSTATIC
		
echo "Info: sysctl -a  ... `date`" >> $LOGSTATIC
sysctl -a >> $LOGSTATIC
echo "Info: end of sysctl -a ..." >> $LOGSTATIC

echo "Info: dmesg  ... `date`" >> $LOGSTATIC
dmesg >> $LOGSTATIC
echo "Info: end of dmesg ..." >> $LOGSTATIC

echo "Info: netstat -rn - routing table  ... `date`" >> $LOGSTATIC
netstat -rn >> $LOGSTATIC
echo "Info: end of netstat -rn ..." >> $LOGSTATIC

echo "Info: resolv.conf - name resolution  ... `date`" >> $LOGSTATIC
cat /etc/resolv.conf >> $LOGSTATIC
echo "Info: end of resolv.conf ..." >> $LOGSTATIC

echo "Info: ip addr ... `date`" >> $LOGSTATIC
ip addr >> $LOGSTATIC
echo "Info: end of ip addr ..." >> $LOGSTATIC

echo "Info: ethtool - settings of the network interfaces ... `date`" >> $LOGSTATIC
for i in `ifconfig -a | grep eth | awk '{print $1}'`; do ethtool $i; done >> $LOGSTATIC
echo "Info: end of ethtool" >> $LOGSTATIC

echo "Info: ethtool -i - network driver ... `date`" >> $LOGSTATIC
for i in `ifconfig -a | grep eth | awk '{print $1}'`; do echo "network driver $i"; ethtool -i $i 2>/dev/null; done >> $LOGSTATIC
echo "Info: end of ethtool -i" >> $LOGSTATIC

echo "Info: ethtool -g - ring buffers ... `date`" >> $LOGSTATIC
for i in `ifconfig -a | grep eth | awk '{print $1}'`; do ethtool -g $i 2>/dev/null; done >> $LOGSTATIC
echo "Info: end of ethtool -g" >> $LOGSTATIC

echo "Info: ethtool -k - segment offload ... `date`" >> $LOGSTATIC
for i in `ifconfig -a | grep eth | awk '{print $1}'`; do ethtool -k $i 2>/dev/null; done >> $LOGSTATIC
echo "Info: end of ethtool -k" >> $LOGSTATIC

echo "Info: ifconfig -a  ... `date`" >> $LOGSTATIC
ifconfig -a >> $LOGSTATIC
echo "Info: end of ifconfig -a ..." >> $LOGSTATIC

echo "Info: iptables --list ... `date`" >> $LOGSTATIC
iptables --list >> $LOGSTATIC
echo "Info: end of iptables --list" >> $LOGSTATIC

echo "Info: /var/log/messages errors ... `date`" >> $LOGSTATIC
grep -i err /var/log/messages | grep -v ssh >> $LOGSTATIC
echo "Info: end of /var/log/messages errors ... `date`" >> $LOGSTATIC

echo "Info: rpm -qa ... `date`" >> $LOGSTATIC
rpm -qa | sort >> $LOGSTATIC
echo "Info: end of rpm -qa ... `date`" >> $LOGSTATIC

echo "Info: /etc/ntp.conf ... `date`" >> $LOGSTATIC
cat /etc/ntp.conf >> $LOGSTATIC
echo "Info: end of /etc/ntp.conf  ... `date`" >> $LOGSTATIC

echo "Info: /etc/yum.conf ... `date`" >> $LOGSTATIC
cat /etc/yum.conf >> $LOGSTATIC
echo "Info: end of /etc/yum.conf  ... `date`" >> $LOGSTATIC

echo "Info: /boot/grub/grub.conf ... `date`" >> $LOGSTATIC
cat /boot/grub/grub.conf >> $LOGSTATIC
echo "Info: end of /boot/grub/grub.conf  ... `date`" >> $LOGSTATIC

echo "Info: checking if multipath exists ..." >> $LOGSTATIC
if [ -e /sbin/multipath ]; then
	echo "Info: multipath -ll ... `date`" >> $LOGSTATIC
	multipath -ll >> $LOGSTATIC
	echo "Info: end of multipath -ll ..." >> $LOGSTATIC
fi

echo "Info: checking if asu exists ..." >> $LOGSTATIC
if [ -e /opt/ibm/toolscenter/asu/asu64 ]; then
	echo "Info: /opt/ibm/toolscenter/asu/asu64 show ... `date`" >> $LOGSTATIC
	/opt/ibm/toolscenter/asu/asu64 show 2>>/$LOGSTATIC >> $LOGSTATIC
	echo "Info: end of /opt/ibm/toolscenter/asu/asu64 show ..." >> $LOGSTATIC
fi

echo "Info: checking if conrep (HP bios util) exists ..." >> $LOGSTATIC
if [ -e /opt/hp/conrep/conrep ]; then
	CONREPXML="conrepxml-citihpc-forensic".$MYHOST.$NOW
	echo "Info: /opt/hp/conrep/conrep -x /opt/hp/conrep/conrep.xml -s -f $CONREPXML ... `date`" >> $LOGSTATIC
	/opt/hp/conrep/conrep -x /opt/hp/conrep/conrep.xml -s -f $CONREPXML >> $LOGSTATIC 2>>$LOGSTATIC
	echo "Info: end of /opt/hp/conrep/conrep -x /opt/hp/conrep/conrep.xml -s -f $CONREPXML ... `date`" >> $LOGSTATIC
fi

echo "Info: checking if gpfs exists ..." >> $LOGSTATIC
if [ -e /usr/lpp/mmfs/bin/mmlscluster ]; then

	echo "Info: mmlscluster ... `date`" >> $LOGSTATIC
	/usr/lpp/mmfs/bin/mmlscluster >> $LOGSTATIC
	echo "Info: end of mmlscluster ..." >> $LOGSTATIC

	echo "Info: mmlsconfig ... `date`" >> $LOGSTATIC
	/usr/lpp/mmfs/bin/mmlsconfig >> $LOGSTATIC
	echo "Info: end of mmlsconfig ..." >> $LOGSTATIC

	echo "Info: mmlsmgr ... `date`" >> $LOGSTATIC
	/usr/lpp/mmfs/bin/mmlsmgr >> $LOGSTATIC
	echo "Info: end of mmlsmgr ..." >> $LOGSTATIC

	echo "Info: mmlsnsd ... `date`" >> $LOGSTATIC
	/usr/lpp/mmfs/bin/mmlsnsd >> $LOGSTATIC
	echo "Info: end of mmlsnsd ..." >> $LOGSTATIC
fi

echo "Info: end of static collection at `date` " >> $LOGSTATIC
echo "Info: end of static collection at `date` "
echo "Info: Created $LOGSTATIC file on ${MYDIR}/citihpc-forensic/${TODAY}"
echo ""

echo "Info: Starting dynamic collection at `date` - $TOTALLOOP Loops"

COUNTER=1
	
while [ $COUNTER -le $TOTALLOOP ] ;
do
	NOW=`date +%y%m%d-%H%M%S`
	LOG="dynamic-citihpc-forensic".$MYHOST.$NOW
	echo "Info: Beginning interaction $COUNTER of total of $TOTALLOOP - $MYNAME $TODAY at $NOW..." >> $LOG
	echo "Info: Beginning interaction $COUNTER of total of $TOTALLOOP - $MYNAME $TODAY at `date`..."
	echo "Press Cntrl^C in meanwhile if you want to stop the script..."
	
	echo "Info: uptime ... `date`" >> $LOG
	uptime >> $LOG
	echo "Info: end of uptime ... " >> $LOG
			
	echo "Info:  ps -AlFH ... `date`" >> $LOG
	ps -AlFH >> $LOG
	echo "Info: end of  ps -AlFH ... " >> $LOG
		
	echo "Info:  ps -AlFTe - showing threads ... `date`" >> $LOG
	ps -AlFTe >> $LOG
	echo "Info: end of  ps -AlFTe ... " >> $LOG
	
	echo "Info:  ps -Teo pid,tid,pcpu,stat,psr,wchan:24,comm - showing wait channels in complete - threads ... `date`" >> $LOG
	ps -Teo pid,tid,pcpu,stat,psr,wchan:24,comm >> $LOG
	echo "Info:  end of ps -Teo" >> $LOG
	
	echo "Info: Looking for running processes/lwp ..." >> $LOG
	PIDCOUNTER=0
	LWPCOUNTER=1
	arr=(`ps -AlFTe | awk '{print $4 , $5 , $12}' | grep "-" | awk '{print $1 , $2}'`)
	if [ "${arr[$PIDCOUNTER]}" != "" ]; then
		echo "Info: Found following running processes/lwp on the system : ${arr[*]} ..." >> $LOG
		while [  $PIDCOUNTER -lt ${#arr[*]} ]; do
			echo "Info: Getting info about running thread PID ${arr[$PIDCOUNTER]} and LWP ${arr[$LWPCOUNTER]}" >> $LOG
			if [ -d /proc/${arr[$PIDCOUNTER]}/task/${arr[$LWPCOUNTER]} ]; then
				cat /proc/${arr[$PIDCOUNTER]}/task/${arr[$LWPCOUNTER]}/status >> $LOG
				echo "Stack of PID ${arr[$PIDCOUNTER]} and LWP ${arr[$LWPCOUNTER]} :" >> $LOG
				cat /proc/${arr[$PIDCOUNTER]}/task/${arr[$LWPCOUNTER]}/stack  2>/dev/null >> $LOG
				echo "Info: end of status/stack of PID ${arr[$PIDCOUNTER]} and LWP ${arr[$LWPCOUNTER]}" >> $LOG
			else
				echo "Info: Can't find more info about PID ${arr[$PIDCOUNTER]} and LWP ${arr[$LWPCOUNTER]}. It was a short-lived process or lwp..." >> $LOG
			fi
			let PIDCOUNTER=PIDCOUNTER+2
			let LWPCOUNTER=LWPCOUNTER+2
		done
	else
		echo "Info: No running processes/lwp found on the system..." >> $LOG
	fi	
		
	echo "Info: sar -Ap 1 1 ... `date`" >> $LOG
	sar -Ap 1 1 >>$LOG
	echo "Info: end of sar ..." >>$LOG

	echo "Info: top -b -n 1 ... `date`" >> $LOG
	top -b -n 1 >>$LOG
	echo "Info: end of top -b ..." >>$LOG

	echo "Info: top -H -b -n 1 ... (top w/ threads) `date`" >> $LOG
	top -H -b -n 1 >>$LOG
	echo "Info: end of top -H -b (top w/ threads) ..." >>$LOG
	
	echo "Info: numastat ... `date`" >> $LOG
	numastat >>$LOG
	echo "Info: end of numastat ..." >>$LOG

	echo "Info: vmstat ... `date`" >> $LOG
	vmstat >> $LOG
	echo "Info: end of vmstat ..." >> $LOG

	echo "Info: vmstat -m (slab) ... `date`" >> $LOG
	vmstat -m >> $LOG
	echo "Info: end of vmstat -m ..." >> $LOG

	echo "Info: vmstat -a (inactive process) ... `date`" >> $LOG
	vmstat -a >> $LOG
	echo "Info: end of vmstat -a ..." >> $LOG
	
	echo "Info: checking if turbostat exists ..." >> $LOG
	if [ -e /usr/bin/turbostat ]; then
		echo "Info:   turbostat -v  ps -eo pid,tid,pcpu,stat,psr,wchan:24,comm ..." >> $LOG
		turbostat -v  ps -eo pid,tid,pcpu,stat,psr,wchan:24,comm >> $LOG 2>>$LOG
	fi
	echo "Info: end of turbostat ..." >> $LOG
	
	echo "Info: free ... `date`" >> $LOG
	free >> $LOG
	echo "Info: end of free ... `date`" >> $LOG
	
	echo "Info: iostat -t -N -n -x 1 2... `date`" >> $LOG
	iostat -t -N -n -x 1 2 2>/dev/null >> $LOG
	echo "Info: end of iostat -t -N -n -x 1 2 (nfs) ..." >> $LOG
		
	echo "Info:  df -h ... `date`" >> $LOG
	df -h >> $LOG
	echo "Info: end of  df -h ... `date`" >> $LOG

	echo "Info:  df --total ... `date`" >> $LOG
	df --total 2>/dev/null >> $LOG
	echo "Info: end of  df --total ... `date`" >> $LOG
	
	echo "Info:  df --total -i  - display inodes ... `date`" >> $LOG
	df --total -i >> $LOG
	echo "Info: end of df --total -i  ... `date`" >> $LOG
	
	echo "Info: nfsstat -m ... `date`" >> $LOG
	nfsstat -m 2>/dev/null >> $LOG
	echo "Info: end of nfsstat -m ..." >> $LOG
	
	echo "Info: nfsstat -v ... `date`" >> $LOG
	nfsstat -v 2>/dev/null >> $LOG
	echo "Info: end of nfsstat -v ..." >> $LOG
	
	echo "Info: /proc/interrupts ... `date`" >> $LOG
	cat /proc/interrupts >> $LOG
	echo "Info: end of /proc/interrupts ..." >> $LOG
				
	echo "Info: /proc/meminfo ... `date`" >> $LOG
	cat /proc/meminfo >> $LOG
	echo "Info: end of /proc/meminfo ..." >> $LOG
	
	echo "Info:  mpstat -P ALL ... `date`" >> $LOG
	mpstat -P ALL >> $LOG
	echo "Info: end of  mpstat -P ALL ..." >> $LOG

	echo "Info: netstat -an -p  ... `date`" >> $LOG
	netstat -an -p >> $LOG
	echo "Info: end of  netstat -an -p ..." >> $LOG

	echo "Info: netstat -s  ... `date`" >> $LOG
	netstat -s >> $LOG
	echo "Info: end of netstat -s ..." >> $LOG
	
	echo "Info: ifconfig -a  ... `date`" >> $LOG
	ifconfig -a >> $LOG
	echo "Info: end of ifconfig -a ..." >> $LOG
	
	echo "Info: ethtool -S - NIC statistics ... `date`" >> $LOG
	for i in `ifconfig | grep eth | awk '{print $1}'`; do echo "$i - NIC Statistics"; ethtool -S $i; done >> $LOG
	echo "Info: end of ethtool -S" >> $LOG
	
	echo "Info: arp -a - arp table ... `date`" >> $LOG
	arp -a >> $LOG
	echo "Info: end of arp -a" >> $LOG
			
	if [ -e /usr/lpp/mmfs/bin/mmdiag ]; then

		echo "Info: mmdiag --iohist - gpfs history ... `date`" >> $LOG
		/usr/lpp/mmfs/bin/mmdiag  --iohist >> $LOG
		echo "Info: end of mmdiag --iohist - ... `date`" >> $LOG

		echo "Info: mmdiag --waiters - gpfs waiters ... `date`" >> $LOG
		/usr/lpp/mmfs/bin/mmdiag  --waiters >> $LOG
		echo "Info: end of mmdiag --waiters - ... `date`" >> $LOG
	fi
	MYEND=`date +%y%m%d-%H%M%S`
	echo "Info: end of interaction at $MYEND ..." >> $LOG
	gzip $LOG
	echo "Info: end of interaction $COUNTER of total of $TOTALLOOP - $MYNAME $TODAY at `date` "
	echo "Info: Created $LOG file on ${MYDIR}/citihpc-forensic/${TODAY}"
	let COUNTER=COUNTER+1
	echo ""	
	
	if [ ! -z "$SLEEPINTERVAL" ]
	then
		echo "Info: Sleeping for $SLEEPINTERVAL seconds..."
		sleep $SLEEPINTERVAL
	fi
	
done
echo "Info: end of $MYNAME from $MYHOST on $TODAY at $NOW..."



