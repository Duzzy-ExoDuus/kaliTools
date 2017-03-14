#!/bin/bash

#添加/etc/apt/sources.list.d/kali.list文件
function addRepo {
	apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6
	file='/etc/apt/sources.list.d/kali.list'
	echo '# Kali linux repositories -- Added by kaliTools' > $file
	echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> $file
	apt-get update -m
	echo 'Add Kali repositories and Update finish'
}

#delete /etc/apt/sources.list.d/kali.list, remove the
function delRepo {
	file='/etc/apt/sources.list.d/kali.list'
	if [ -e $file ]
	then
		rm $file
	fi
	apt-get update
}

#when start kaliTools, the first interface you will see
function index {
  echo $(whiptail --title "kailiTools" --menu "Choose your option" 15 60 7 \
  "1" "add kali rolling repositories" \
  "2" "remove kali rolling repositories" \
  "3" "install kali software(Categories)" \
  "4" "install kali software(one by one)" \
  "0" "exit kaliTools"  3>&1 1>&2 2>&3)
}

function informationGathering {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred information gathering tool categories" 15 60 8 \
  "1" "acccheck" OFF \
  "2" "ace-voip" OFF \
  "3" "Amap" OFF \
  "4" "Automater" OFF \
  "5" "bing-ip2hosts" OFF \
  "6" "braa" OFF \
  "7" "CaseFile" OFF \
  "8" "CDPSnarf" OFF \
  "9" "cisco-torch" OFF \
  "10" "Cookie Cadger" OFF \
  "11" "copy-router-config" OFF \
  "12" "DMitry" OFF \
  "13" "dnmap" OFF \
  "14" "dnsenum" OFF \
  "15" "dnsmap" OFF \
  "16" "DNSRecon" OFF \
  "17" "dnstracer" OFF \
  "18" "dnswalk" OFF \
  "19" "DotDotPwn" OFF \
  "20" "enum4linux" OFF \
  "21" "enumIAX" OFF \
  "22" "exploitdb" OFF \
  "23" "Fierce" OFF \
  "24" "Firewalk" OFF \
  "25" "fragroute" OFF \
  "26" "fragrouter" OFF \
  "27" "Ghost Phisher" OFF \
  "28" "GoLismero" OFF \
  "29" "goofile" OFF \
  "30" "lbd" OFF \
  "31" "Maltego Teeth" OFF \
  "32" "masscan" OFF \
  "33" "Metagoofil" OFF \
  "34" "Miranda" OFF \
  "35" "Nmap" OFF \
  "36" "ntop" OFF \
  "37" "p0f" OFF \
  "38" "Parsero" OFF \
  "39" "Recon-ng" OFF \
  "40" "SET" OFF \
  "41" "smtp-user-enum" OFF \
  "42" "snmpcheck" OFF \
  "43" "sslcaudit" OFF \
  "44" "SSLsplit" OFF \
  "45" "sslstrip" OFF \
  "46" "SSLyze" OFF \
  "47" "THC-IPV6" OFF \
  "48" "theHarvester" OFF \
  "49" "TLSSLed" OFF \
  "50" "twofi" OFF \
  "51" "URLCrazy" OFF \
  "52" "Wireshark" OFF \
  "53" "WOL-E" OFF \
  "54" "Xplico" OFF \
  "55" "iSMTP" OFF \
  "56" "InTrace" OFF \
  "57" "hping3" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for INFTOOL in $TOOLS
    do
      echo $INFTOOL
      case $INFTOOL in
        \"1\") apt-get -y install acccheck;;
        \"2\") apt-get -y install ace-voip;;
        \"3\") apt-get -y install amap;;
        \"4\") apt-get install automater;;
        \"5\") wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && tar -xzvf bing-ip2hosts-0.4.tar.gz && cp bing-ip2hosts-0.4/bing-ip2hosts /usr/local/bin/;;
        \"6\") apt-get install braa;;
        \"7\") apt-get install casefile;;
        \"8\") apt-get install cdpsnarf;;
        \"9\") apt-get install cisco-torch;;
        \"10\") apt-get install cookie-cadger;;
        \"11\") apt-get install copy-router-config;;
        \"12\") apt-get install dmitry;;
        \"13\") apt-get install dnmap;;
        \"14\") apt-get install dnsenum;;
        \"15\") apt-get install dnsmap;;
        \"16\") apt-get install dnsrecon;;
        \"17\") apt-get install dnstracer;;
        \"18\") apt-get install dnswalk;;
        \"19\") apt-get install dotdotpwn;;
        \"20\") apt-get install enum4linux;;
        \"21\") apt-get install enumiax;;
        \"22\") apt-get install exploitdb;;
        \"23\") apt-get install fierce;;
        \"24\") apt-get install firewalk;;
        \"25\") apt-get install fragroute;;
        \"26\") apt-get install fragrouter;;
        \"27) apt-get install ghost-phisher;;
        \"28\") apt-get install golismero;;
        \"29\") apt-get install goofile;;
        \"30\") apt-get install lbd;;
        \"31\") apt-get install maltego-teeth;;
        \"32\") apt-get install masscan;;
        \"33\") apt-get install metagoofil;;
        \"34\") apt-get install miranda;;
        \"35\") apt-get install nmap;;
        \"36\") echo 'ntop is unavailable';;
        \"37\") apt-get install p0f;;
        \"38\") apt-get install parsero;;
        \"39\") apt-get install recon-ng;;
        \"40\") apt-get install set;;
        \"41\") apt-get install smtp-user-enum;;
        \"42\") apt-get install snmpcheck;;
        \"43\") apt-get install sslcaudit;;
        \"44\") apt-get install sslsplit;;
        \"45\") apt-get install sslstrip;;
        \"46\") apt-get install sslyze;;
        \"47\") apt-get install thc-ipv6;;
        \"48\") apt-get install theharvester;;
        \"49\") apt-get install tlssled;;
        \"50\") apt-get install twofi;;
        \"51\") apt-get install urlcrazy;;
        \"52\") apt-get install wireshark;;
        \"53\") apt-get install wol-e;;
        \"54\") apt-get install xplico;;
        \"55\") apt-get install ismtp;;
        \"56\") apt-get install intrace;;
        \"57\") apt-get install hping3;;
      esac
    done
  else
    echo "You chose Cancel."
  fi

}

# function vulnerabilityAnalysis{
#   TOOLS=$(whiptail --title "choose " --checklist \
#   "Choose preferred vulnerability analysis tool categories" 15 60 8 \
#   "1" "BBQSQL" OFF \
#   3>&1 1>&2 2>&3)
#   exitstatus=$?
# }
function vulnerabilityAnalysis {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred vulnerability analysis tool categories" 15 60 8 \
  1 "BBQSQL" OFF \
  2 "BED" OFF \
  3 "cisco-auditing-tool" OFF \
  4 "cisco-global-exploiter" OFF \
  5 "cisco-ocs" OFF \
  6 "cisco-torch" OFF \
  7 "copy-router-config" OFF \
  8 "commix" OFF \
  9 "DBPwAudit" OFF \
  10 "DoonaDot" OFF \
  11 "DotPwn" OFF \
  12 "Greenbone Security Assistant" OFF \
  13 "GSD" OFF \
  14 "HexorBase" OFF \
  15 "Inguma" OFF \
  16 "jSQL" OFF \
  17 "Lynis" OFF \
  18 "Nmap" OFF \
  19 "ohrwurm" OFF \
  20 "openvas-administrator" OFF \
  21 "openvas-cli" OFF \
  22 "openvas-manager" OFF \
  23 "openvas-scanner" OFF \
  24 "Oscanner" OFF \
  25 "Powerfuzzer" OFF \
  26 "sfuzz" OFF \
  27 "SidGuesser" OFF \
  28 "SIPArmyKnife" OFF \
  29 "sqlmap" OFF \
  30 "Sqlninja" OFF \
  31 "sqlsus" OFF \
  32 "THC-IPV6" OFF \
  33 "tnscmd10g" OFF \
  34 "unix-privesc-check" OFF \
  35 "Yersinia" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for VULTOOL in $TOOLS
    do
      case $VULTOOL in
        \"1\") apt-get install bbqsql;;
        \"2\") apt-get install bed;;
        \"3\") apt-get install cisco-auditing-tool;;
        \"4\") apt-get install cisco-global-exploiter;;
        \"5\") apt-get install cisco-ocs;;
        \"6\") apt-get install cisco-torch;;
        \"7\") apt-get install copy-router-config;;
        \"8\") apt-get install git && git clone https://github.com/stasinopoulos/commix.git commix && cd commix && python ./commix.py --install;;
        \"9\") echo 'download page : http://www.cqure.net/wp/tools/database/dbpwaudit/';;
        \"10\") apt-get install doona;;
        \"11\") apt-get install dotdotpwn;;
        \"12\") apt-get install greenbone-security-assistant;;
        \"13\") apt-get install git && git clone git://git.kali.org/packages/gsd.git;;
        \"14\") apt-get install hexorbase;;
        \"15\") Please download inguma from : http://inguma.sourceforge.net;;
        \"16\") apt-get install jsql;;
        \"17\") apt-get install lynis;;
        \"18\") apt-get install nmap;;
        \"19\") apt-get install ohrwurm;;
        \"20\") apt-get install openvas-administrator;;
        \"21\") apt-get install openvas-cli;;
        \"22\") apt-get install openvas-manager;;
        \"23\") apt-get install openvas-scanner;;
        \"24\") apt-get install oscanner;;
        \"25\") apt-get install powerfuzzer;;
        \"26\") apt-get install sfuzz;;
        \"27\") apt-get install sidguesser;;
        \"28\") apt-get install siparmyknife;;
        \"29\") apt-get install sqlmap;;
        \"30\") apt-get install sqlninja;;
        \"31\") apt-get install sqlsus;;
        \"32\") apt-get install thc-ipv6;;
        \"33\") apt-get install tnscmd10g;;
        \"34\") apt-get install unix-privesc-check;;
        \"35\") apt-get install yersinia;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

function wirelessAttacks {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred vulnerability analysis tool categories" 15 60 8 \
  1 "Aircrack-ng" OFF \
  2 "Asleap" OFF \
  3 "Bluelog" OFF \
  4 "BlueMaho" OFF \
  5 "Bluepot" OFF \
  6 "BlueRanger" OFF \
  7 "Bluesnarfer" OFF \
  8 "Bully" OFF \
  9 "coWPAtty" OFF \
  10 "crackle" OFF \
  11 "eapmd5pass" OFF \
  12 "Fern Wifi Cracker" OFF \
  13 "Ghost Phisher" OFF \
  14 "GISKismet" OFF \
  15 "gr-scan" OFF \
  16 "kalibrate-rtl" OFF \
  17 "KillerBee" OFF \
  18 "Kismet" OFF \
  19 "mdk3" OFF \
  20 "mfcuk" OFF \
  21 "mfoc" OFF \
  22 "mfterm" OFF \
  23 "Multimon-NG" OFF \
  24 "PixieWPS" OFF \
  25 "Reaver" OFF \
  26 "redfang" OFF \
  27 "RTLSDR Scanner" OFF \
  28 "Spooftooph" OFF \
  29 "Wifi Honey" OFF \
  30 "Wifitap" OFF \
  31 "Wifite" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for WIRETOOL in $TOOLS
    do
      case $WIRETOOL in
        \"1\") apt-get install aircrack-ng;;
        \"2\") apt-get install asleap;;
        \"3\") apt-get install bluelog;;
        \"4\") apt-get install git && git clone git://git.kali.org/packages/bluemaho.git;;
        \"5\") apt-get install git && git clone git://git.kali.org/packages/bluepot.git;;
        \"6\") apt-get install blueranger;;
        \"7\") apt-get install bluesnarfer;;
        \"8\") apt-get install bully;;
        \"9\") apt-get install cowpatty;;
        \"10\") apt-get install crackle;;
        \"11\") apt-get install eapmd5pass;;
        \"12\") apt-get install fern-wifi-cracker;;
        \"13\") apt-get install ghost-phisher;;
        \"14\") apt-get install giskismet;;
        \"15\") apt-get install git && git clone git://git.kali.org/packages/gr-scan.git;;
        \"16\") apt-get install kalibrate-rtl;;
        \"17\") apt-get install killerbee;;
        \"18\") apt-get install kismet;;
        \"19\") apt-get install mdk3;;
        \"20\") apt-get install mfcuk;;
        \"21\") apt-get install mfoc;;
        \"22\") apt-get install mfterm;;
        \"23\") apt-get install multimon-ng;;
        \"24\") apt-get install pixiewps;;
        \"25\") apt-get install reaver;;
        \"26\") apt-get install redfang;;
        \"27\") apt-get install rtlsdr-scanner;;
        \"28\") apt-get install spooftooph;;
        \"29\") apt-get install wifi-honey;;
        \"30\") apt-get install wifitap;;
        \"31\") apt-get install wifite;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

function webApplication {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred web application tool categories" 15 60 8 \
  1 "apache-users" OFF \
  2 "Arachni" OFF \
  3 "BBQSQL" OFF \
  4 "BlindElephant" OFF \
  5 "Burp Suite" OFF \
  6 "commix" OFF \
  7 "CutyCapt" OFF \
  8 "DAVTest" OFF \
  9 "deblaze" OFF \
  10 "DIRB" OFF \
  11 "DirBuster" OFF \
  12 "fimap" OFF \
  13 "FunkLoad" OFF \
  14 "Grabber" OFF \
  15 "jboss-autopwn" OFF \
  16 "joomscan" OFF \
  17 "jSQL" OFF \
  18 "Maltego Teeth" OFF \
  19 "PadBuster" OFF \
  20 "Paros" OFF \
  21 "Parsero" OFF \
  22 "plecost" OFF \
  23 "Powerfuzzer" OFF \
  24 "ProxyStrike" OFF \
  25 "Recon-ng" OFF \
  26 "Skipfish" OFF \
  27 "sqlmap" OFF \
  28 "Sqlninja" OFF \
  29 "sqlsus" OFF \
  30 "ua-tester" OFF \
  31 "Uniscan" OFF \
  32 "Vega" OFF \
  33 "w3af" OFF \
  34 "WebScarab" OFF \
  35 "Webshag" OFF \
  36 "WebSlayer" OFF \
  37 "WebSploit" OFF \
  38 "Wfuzz" OFF \
  39 "WPScan" OFF \
  40 "XSSer" OFF \
  41 "zaproxy" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for WEBTOOL in $TOOLS
    do
      case $WEBTOOL in
        \"1\") apt-get install apache-users;;
        \"2\") apt-get install arachni;;
        \"3\") apt-get install bbqsql;;
        \"4\") apt-get install blindelephant;;
        \"5\") apt-get install burpsuite;;
        \"6\") apt-get install cutycapt;;
        \"7\") apt-get install git && git clone https://github.com/stasinopoulos/commix.git commix && cd commix && python ./commix.py --install;;
        \"8\") apt-get install davtest;;
        \"9\") apt-get install deblaze;;
        \"10\") apt-get install dirb;;
        \"11\") apt-get install dirbuster;;
        \"12\") apt-get install fimap;;
        \"13\") apt-get install funkload;;
        \"14\") apt-get install grabber;;
        \"15\") apt-get install jboss-autopwn;;
        \"16\") apt-get install joomscan;;
        \"17\") apt-get install jsql;;
        \"18\") apt-get install maltego-teeth;;
        \"19\") apt-get install padbuster;;
        \"20\") apt-get install paros;;
        \"21\") apt-get install parsero;;
        \"22\") apt-get install plecost;;
        \"23\") apt-get install powerfuzzer;;
        \"24\") apt-get install proxystrike;;
        \"25\") apt-get install recon-ng;;
        \"26\") apt-get install skipfish;;
        \"27\") apt-get install sqlmap;;
        \"28\") apt-get install sqlninja;;
        \"29\") apt-get install sqlsus;;
        \"30\") apt-get install ua-tester;;
        \"31\") apt-get install uniscan;;
        \"32\") apt-get install vega;;
        \"33\") apt-get install w3af;;
        \"34\") apt-get install webscarab;;
        \"35\") echo 'Webshag is unavailable';;
        \"36\") apt-get install git && git clone git://git.kali.org/packages/webslayer.git;;
        \"37\") apt-get install websploit;;
        \"38\") apt-get install wfuzz;;
        \"39\") apt-get install wpscan;;
        \"40\") apt-get install xsser;;
        \"41\") apt-get install zaproxy;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

function sniffingSpoofing {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred sniffing spoofing tool categories" 15 60 8 \
  1 "Burp Suite" OFF \
  2 "DNSChef" OFF \
  3 "fiked" OFF \
  4 "hamster-sidejack" OFF \
  5 "HexInject" OFF \
  6 "iaxflood" OFF \
  7 "inviteflood" OFF \
  8 "iSMTP" OFF \
  9 "isr-evilgrade" OFF \
  10 "mitmproxy" OFF \
  11 "ohrwurm" OFF \
  12 "protos-sip" OFF \
  13 "rebind" OFF \
  14 "responder" OFF \
  15 "rtpbreak" OFF \
  16 "rtpinsertsound" OFF \
  17 "rtpmixsound" OFF \
  18 "sctpscan" OFF \
  19 "SIPArmyKnife" OFF \
  20 "SIPp" OFF \
  21 "SIPVicious" OFF \
  22 "SniffJoke" OFF \
  23 "SSLsplit" OFF \
  24 "sslstrip" OFF \
  25 "THC-IPV6" OFF \
  26 "VoIPHopper" OFF \
  27 "WebScarab" OFF \
  28 "Wifi Honey" OFF \
  29 "Wireshark" OFF \
  30 "xspy" OFF \
  31 "Yersinia" OFF \
  32 "zaproxy" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for SSTOOL in $TOOLS
    do
      case $SSTOOL in
        \"1\") apt-get install burpsuite;;
        \"2\") apt-get install dnschef;;
        \"3\") apt-get install fiked;;
        \"4\") apt-get install hamster-sidejack;;
        \"5\") apt-get install hexinject;;
        \"6\") apt-get install iaxflood;;
        \"7\") apt-get install inviteflood;;
        \"8\") apt-get install ismtp;;
        \"9\") apt-get install git && git clone git://git.kali.org/packages/isr-evilgrade.git;;
        \"10\") apt-get install mitmproxy;;
        \"11\") apt-get install ohrwurm;;
        \"12\") apt-get install protos-sip;;
        \"13\") apt-get install rebind;;
        \"14\") apt-get install responder;;
        \"15\") apt-get install rtpbreak;;
        \"16\") apt-get install rtpinsertsound;;
        \"17\") apt-get install rtpmixsound;;
        \"18\") apt-get install sctpscan;;
        \"19\") apt-get install siparmyknife;;
        \"20\") apt-get install sipp;;
        \"21\") apt-get install sipvicious;;
        \"22\") apt-get install sniffjoke;;
        \"23\") apt-get install sslsplit;;
        \"24\") apt-get install sslstrip;;
        \"25\") apt-get install thc-ipv6;;
        \"26\") apt-get install voiphopper;;
        \"27\") apt-get install webscarab;;
        \"28\") apt-get install wifi-honey;;
        \"29\") apt-get install wireshark;;
        \"30\") apt-get install xspy;;
        \"31\") apt-get install yersinia;;
        \"32\") apt-get install zaproxy;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

# function maintainingAccess {
#   TOOLS=$(whiptail --title "choose " --checklist \
#   "Choose preferred maintaining access tool categories" 15 60 8 \
#   3>&1 1>&2 2>&3)
#   exitstatus=$?
#   if [ $exitstatus = 0 ]; then
#     for ACCTOOL in $TOOLS
#     do
#       case $ACCTOOL in
#         \"\") ;;
#       esac
#     done
#   else
#     echo "You chose Cancel."
#   fi
# }

function maintainingAccess {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred maintaining access tool categories" 15 60 8 \
  1 "CryptCat" OFF \
  2 "Cymothoa" OFF \
  3 "dbd" OFF \
  4 "dns2tcp" OFF \
  5 "http-tunnel" OFF \
  6 "HTTPTunnel" OFF \
  7 "Intersect" OFF \
  8 "Nishang" OFF \
  9 "polenum" OFF \
  10 "PowerSploit" OFF \
  11 "pwnat" OFF \
  12 "RidEnum" OFF \
  13 "sbd" OFF \
  14 "U3-Pwn" OFF \
  15 "Webshells" OFF \
  16 "Weevely" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for ACCTOOL in $TOOLS
    do
      case $ACCTOOL in
        \"1\") apt-get install cryptcat;;
        \"2\") apt-get install cymothoa;;
        \"3\") apt-get install dbd;;
        \"4\") apt-get install dns2tcp;;
        \"5\") apt-get install http-tunnel;;
        \"6\") apt-get install httptunnel;;
        \"7\") apt-get install intersect;;
        \"8\") apt-get install nishang;;
        \"9\") apt-get install polenum;;
        \"10\") apt-get install powersploit;;
        \"11\") apt-get install pwnat;;
        \"12\") apt-get install ridenum;;
        \"13\") apt-get install sbd;;
        \"14\") apt-get install u3-pwn;;
        \"15\") apt-get install webshells;;
        \"16\") apt-get install weevely;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}


function reportingTools {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred reporting tools tool" 15 60 8 \
  1 "CaseFile" OFF \
  2 "CutyCapt" OFF \
  3 "dos2unix" OFF \
  4 "Dradis" OFF \
  5 "KeepNote" OFF \
  6 "MagicTree" OFF \
  7 "Metagoofil" OFF \
  8 "Nipper-ng" OFF \
  9 "pipal" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for REPOTOOL in $TOOLS
    do
      case $REPOTOOL in
        \"1\") apt-get install casefile;;
        \"2\") apt-get install cutycapt;;
        \"3\") apt-get install dos2unix;;
        \"4\") apt-get install dradis;;
        \"5\") apt-get install keepnote;;
        \"6\") apt-get install magictree;;
        \"7\") apt-get install metagoofil;;
        \"8\") apt-get install nipper-ng;;
        \"9\") apt-get install pipal;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}


function exploitationTools {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred exploitation tools" 15 60 8 \
  1 "Armitage" OFF \
  2 "Backdoor Factory" OFF \
  3 "BeEF" OFF \
  4 "cisco-auditing-tool" OFF \
  5 "cisco-global-exploiter" OFF \
  6 "cisco-ocs" OFF \
  7 "cisco-torch" OFF \
  8 "commix" OFF \
  9 "crackle  " OFF \
  10 "jboss-autopwn" OFF \
  11 "Linux Exploit Suggester" OFF \
  12 "Maltego Teeth" OFF \
  13 "SET" OFF \
  14 "ShellNoob" OFF \
  15 "sqlmap" OFF \
  16 "THC-IPV6" OFF \
  17 "Yersinia" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for EXPTOOL in $TOOLS
    do
      case $EXPTOOL in
        \"1\") apt-get install armitage;;
        \"2\") apt-get install backdoor-factory;;
        \"3\") apt-get install beef-xss;;
        \"4\") apt-get install cisco-auditing-tool;;
        \"5\") apt-get install cisco-global-exploiter;;
        \"6\") apt-get install cisco-ocs;;
        \"7\") apt-get install cisco-torch;;
        \"8\") apt-get install git && git clone https://github.com/stasinopoulos/commix.git commix && cd commix && python ./commix.py --install;;
        \"9\") apt-get install crackle;;
        \"10\") apt-get install jboss-autopwn;;
        \"11\") apt-get install linux-exploit-suggester;;
        \"12\") apt-get install maltego-teeth;;
        \"13\") apt-get install set;;
        \"14\") apt-get install shellnoob;;
        \"15\") apt-get install sqlmap;;
        \"16\") apt-get install thc-ipv6;;
        \"17\") apt-get install yersinia;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

# Forensics Tools
function forensicsTools {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred forensics tools" 15 60 8 \
  1 "Binwalk" OFF \
  2 "bulk-extractor" OFF \
  3 "Capstone" OFF \
  4 "chntpw" OFF \
  5 "Cuckoo" OFF \
  6 "dc3dd" OFF \
  7 "ddrescue" OFF \
  8 "diStorm3" OFF \
  9 "Dumpzilla" OFF \
  10 "extundelete" OFF \
  11 "Foremost" OFF \
  12 "Galleta" OFF \
  13 "Guymager" OFF \
  14 "iPhone Backup Analyzer" OFF \
  15 "p0f" OFF \
  16 "pdf-parser" OFF \
  17 "pdfid" OFF \
  18 "pdgmail" OFF \
  19 "peepdf" OFF \
  20 "Volatility" OFF \
  21 "Xplico" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for FORETOOL in $TOOLS
    do
      case $FORETOOL in
        \"1\") apt-get install binwalk;;
        \"2\") apt-get install bulk-extractor;;
        \"3\") apt-get install git && git clone git://git.kali.org/packages/capstone.git;;
        \"4\") apt-get install chntpw;;
        \"5\") apt-get install cuckoo;;
        \"6\") apt-get install dc3dd;;
        \"7\") apt-get install ddrescue;;
        \8\") apt-get install git && git clone git://git.kali.org/packages/distorm3.git;;
        \"9\") apt-get install dumpzilla;;
        \"10\") apt-get install extundelete;;
        \"11\") apt-get install foremost;;
        \"12\") apt-get install galleta;;
        \"13\") apt-get install guymager;;
        \"14\") apt-get install iphone-backup-analyzer;;
        \"15\") apt-get install p0f;;
        \"16\") apt-get install pdf-parser;;
        \"17\") apt-get install pdfid;;
        \"18\") apt-get install pdgmail;;
        \"19\") apt-get install peepdf;;
        \"20\") apt-get install volatility;;
        \"21\") apt-get install xplico;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

# Stress Testing
function stressTesting {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred forensics tools" 15 60 8 \
  1 "DHCPig" OFF \
  2 "FunkLoad" OFF \
  3 "iaxflood" OFF \
  4 "Inundator" OFF \
  5 "inviteflood" OFF \
  6 "ipv6-toolkit" OFF \
  7 "mdk3" OFF \
  8 "Reaver" OFF \
  9 "rtpflood" OFF \
  10 "SlowHTTPTest" OFF \
  11 "t50" OFF \
  12 "Termineter" OFF \
  13 "THC-IPV6" OFF \
  14 "THC-SSL-DOS" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for FORETOOL in $TOOLS
    do
      case $FORETOOL in
        \"1\") apt-get install dhcpig;;
        \"2\") apt-get install funkload;;
        \"3\") apt-get install iaxflood;;
        \"4\") apt-get install git && git clone git://git.kali.org/packages/inundator.git;;
        \"5\") apt-get install inviteflood;;
        \"6\") apt-get install ipv6-toolkit;;
        \"7\") apt-get install mdk3;;
        \"8\") apt-get install reaver;;
        \"9\") apt-get install rtpflood;;
        \"10\") apt-get install slowhttptest;;
        \"11\") apt-get install t50;;
        \"12\") apt-get install termineter;;
        \"13\") apt-get install thc-ipv6;;
        \"14\") apt-get install thc-ssl-dos;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

# Password Attacks
function passwordAttacks {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred password attacks tools" 15 60 8 \
  1 "acccheck" OFF \
  2 "Burp Suite" OFF \
  3 "CeWL" OFF \
  4 "chntpw" OFF \
  5 "cisco-auditing-tool" OFF \
  6 "CmosPwd" OFF \
  7 "creddump" OFF \
  8 "crunch" OFF \
  9 "DBPwAudit" OFF \
  10 "findmyhash" OFF \
  11 "gpp-decrypt" OFF \
  12 "hash-identifier" OFF \
  13 "HexorBase" OFF \
  14 "THC-Hydra" OFF \
  15 "John the Ripper" OFF \
  16 "Johnny" OFF \
  17 "keimpx" OFF \
  18 "Maltego Teeth" OFF \
  19 "Maskprocessor" OFF \
  20 "multiforcer" OFF \
  21 "oclgausscrack" OFF \
  22 "Ncrack" OFF \
  23 "PACK" OFF \
  24 "patator" OFF \
  25 "phrasendrescher" OFF \
  26 "polenum" OFF \
  27 "RainbowCrack" OFF \
  28 "rcracki-mt" OFF \
  29 "RSMangler" OFF \
  30 "Statsprocessor" OFF \
  31 "THC-pptp-bruter" OFF \
  32 "TrueCrack" OFF \
  33 "WebScarab" OFF \
  34 "wordlists" OFF \
  35 "zaproxy" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for PASSTOOL in $TOOLS
    do
      case $PASSTOOL in
        \"1\") apt-get install acccheck;;
        \"2\") apt-get install burpsuite;;
        \"3\") apt-get install cewl;;
        \"4\") apt-get install chntpw;;
        \"5\") apt-get install cisco-auditing-tool;;
        \"6\") apt-get install cmospwd;;
        \"7\") apt-get install creddump;;
        \"8\") apt-get install crunch;;
        \"9\") apt-get install git && git clone git://git.kali.org/packages/dbpwaudit.git;;
        \"10\") apt-get install findmyhash;;
        \"11\") apt-get install gpp-decrypt;;
        \"12\") apt-get install hash-identifier;;
        \"13\") apt-get install hexorbase;;
        \"14\") echo 'please visit : https://www.thc.org/thc-hydra/';;
        \"15\") apt-get install john;;
        \"16\") apt-get install johnny;;
        \"17\") apt-get install keimpx;;
        \"18\") apt-get install maltego-teeth;;
        \"19\") apt-get install maskprocessor;;
        \"20\") apt-get install multiforcer;;
        \"21\") apt-get install ncrack;;
        \"22\") apt-get install oclgausscrack;;
        \"23\") apt-get install pack;;
        \"24\") apt-get install patator;;
        \"25\") echo 'please visit : http://www.leidecker.info/projects/phrasendrescher/index.shtml';;
        \"26\") apt-get install polenum;;
        \"27\") apt-get install rainbowcrack;;
        \"28\") apt-get install rcracki-mt;;
        \"29\") apt-get install rsmangler;;
        \"30\") apt-get install statsprocessor;;
        \"31\") apt-get install thc-pptp-bruter;;
        \"32\") apt-get install truecrack;;
        \"33\") apt-get install webscarab;;
        \"34\") apt-get install wordlists;;
        \"35\") apt-get install zaproxy;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

# Reverse Engineering
function reverseEngineering {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred reverse engineering tools" 15 60 8 \
  1 "apktool" OFF \
  2 "dex2jar" OFF \
  3 "diStorm3" OFF \
  4 "edb-debugger" OFF \
  5 "jad" OFF \
  6 "javasnoop" OFF \
  7 "JD-GUI" OFF \
  8 "OllyDbg" OFF \
  9 "smali" OFF \
  10 "Valgrind" OFF \
  11 "YARA" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for REVTOOL in $TOOLS
    do
      case $REVTOOL in
        \"1\") apt-get install apktool;;
        \"2\") apt-get install dex2jar;;
        \"3\") apt-get install python-diStorm3;;
        \"4\") apt-get install edb-debugger;;
        \"5\") apt-get install jad;;
        \"6\") apt-get install javasnoop;;
        \"7\") apt-get install JD;;
        \"8\") apt-get install OllyDbg;;
        \"9\") apt-get install smali;;
        \"10\") apt-get install Valgrind;;
        \"11\") apt-get install YARA;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

# Hardware Hacking
function hardwareHacking {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred hardware hacking tools" 15 60 8 \
  1 "android-sdk" OFF \
  2 "apktool" OFF \
  3 "Arduino" OFF \
  4 "dex2jar" OFF \
  5 "Sakis3G" OFF \
  6 "smali" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for HARDTOOL in $TOOLS
    do
      case $HARDTOOL in
        \"1\") apt-get install android-sdk;;
        \"2\") apt-get install apktool;;
        \"3\") apt-get install arduino;;
        \"4\") apt-get install dex2jar;;
        \"5\") apt-get install sakis3g;;
        \"6\") apt-get install smali;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

# Extra
function extra {
  TOOLS=$(whiptail --title "choose " --checklist \
  "Choose preferred extra tools" 15 60 8 \
  1 "Wifresti" OFF \
  2 "Squid3" OFF \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    for HARDTOOL in $TOOLS
    do
      case $HARDTOOL in
        \"1\") git clone https://github.com/LionSec/wifresti.git && cp wifresti/wifresti.py /usr/bin/wifresti && chmod +x /usr/bin/wifresti && wifresti;;
        \"2\") apt-get install squid3;;
      esac
    done
  else
    echo "You chose Cancel."
  fi
}

function checkListDetail {
  case $1 in
    1) informationGathering;;
    2) vulnerabilityAnalysis;;
    3) wirelessAttacks;;
    4) ;;
    5) ;;
    6) ;;
    7) ;;
    8) ;;
    9) ;;
    10) ;;
    11) ;;
    12) ;;
    13) hardwareHacking;;
    14) extra;;
  esac
}


#show the detail of the software from kali linux
function softwareList {
  SOFTWARELIST=$(whiptail --title "kailiTools" --menu "Choose your option" 15 60 8 \
  "1" "Information_Gathering" \
  "2" "Vulnerability_Analysis" \
  "3" "Wireless_Attacks" \
  "4" "Web_Applications" \
  "5" "Sniffing_Spoofing" \
  "6" "Maintaining_Access" \
  "7" "Reporting_Tools" \
  "8" "Exploitation_Tools" \
  "9" "Forensics_Tools" \
  "10" "Stress_Testing" \
  "11" "Password_Attacks" \
  "12" "Reverse_Engineering" \
  "13" "Hardware_Hacking" \
  "14" "Extra" \
   3>&1 1>&2 2>&3)
   exitstatus=$?
   if [ $exitstatus = 0 ]; then
     case $SOFTWARELIST in
       1) checkListDetail 1;;
       2) checkListDetail 2;;
       3) checkListDetail 3;;
       4) checkListDetail 4;;
       5) checkListDetail 5;;
       6) checkListDetail 6;;
       7) checkListDetail 7;;
       8) checkListDetail 8;;
       9) checkListDetail 9;;
       10) checkListDetail 10;;
       11) checkListDetail 11;;
       12) checkListDetail 12;;
       13) checkListDetail 13;;
       14) checkListDetail 14;;
     esac
     echo $SOFTWARELIST
   else
     echo "You chose Cancel."
   fi
}

#
function checkListCategories {
  TOOLSCATEGORIES=$(whiptail --title "choose " --checklist \
  "Choose preferred kali tool categories" 15 60 8 \
  Information_Gathering "   " OFF \
  Vulnerability_Analysis "    " OFF \
  Wireless_Attacks "    " OFF \
  Web_Applications "    " OFF \
  Sniffing_Spoofing "    " OFF \
  Maintaining_Access "    " OFF \
  Reporting_Tools "    " OFF \
  Exploitation_Tools "    " OFF \
  Forensics_Tools "    " OFF \
  Stress_Testing "    " OFF \
  Password_Attacks "    " OFF \
  Reverse_Engineering "    " OFF \
  Hardware_Hacking "    " OFF \
  Extra "    " OFF 3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    echo $TOOLSCATEGORIES
  else
    echo "You chose Cancel."
  fi
}

function KaliToolsCategories {
  whiptail --clear
  TOOLSCATEGORIES=$(checkListCategories)
  for TOOL in $TOOLSCATEGORIES
  do
    case $TOOL in
      \"Information_Gathering\") apt-get install -y acccheck ace-voip amap \
                                automater braa casefile cdpsnarf cisco-torch \
                                cookie-cadger copy-router-config dmitry dnmap \
                                dnsenum dnsmap dnsrecon dnstracer dnswalk \
                                dotdotpwn enum4linux enumiax exploitdb fierce \
                                firewalk fragroute fragrouter ghost-phisher \
                                golismero goofile lbd maltego-teeth masscan \
                                metagoofil miranda nmap p0f parsero recon-ng \
                                set smtp-user-enum snmpcheck sslcaudit sslsplit \
                                sslstrip sslyze thc-ipv6 theharvester tlssled \
                                twofi urlcrazy wireshark wol-e xplico ismtp \
                                intrace hping3 \
                                && wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && \
                                tar -C /usr/local/bin/ -xzvf bing-ip2hosts-0.4.tar.gz;;
      \"Vulnerability_Analysis\") apt-get install -y bbqsql bed cisco-auditing-tool \
                                cisco-global-exploiter cisco-ocs cisco-torch \
                                copy-router-config doona dotdotpwn \
                                greenbone-security-assistant hexorbase jsql \
                                lynis nmap ohrwurm openvas-cli openvas-manager \
                                openvas-scanner oscanner powerfuzzer sfuzz \
                                sidguesser siparmyknife sqlmap sqlninja sqlsus \
                                thc-ipv6 tnscmd10g unix-privesc-check yersinia;;
      \"Wireless_Attacks\") apt-get install -y aircrack-ng asleap bluelog \
                                blueranger bluesnarfer bully cowpatty crackle \
                                eapmd5pass fern-wifi-cracker ghost-phisher \
                                giskismet gqrx kalibrate-rtl killerbee kismet \
                                mdk3 mfcuk mfoc mfterm multimon-ng pixiewps \
                                reaver redfang spooftooph wifi-honey wifitap wifite;;
      \"Web_Applications\") apt-get install -y apache-users arachni bbqsql \
                                blindelephant burpsuite cutycapt davtest deblaze \
                                dirb dirbuster fimap funkload grabber jboss-autopwn \
                                joomscan jsql maltego-teeth padbuster paros parsero \
                                plecost powerfuzzer proxystrike recon-ng skipfish \
                                sqlmap sqlninja sqlsus ua-tester uniscan vega w3af \
                                webscarab websploit wfuzz wpscan xsser zaproxy;;
      \"Sniffing_Spoofing\") apt-get install -y burpsuite dnschef fiked \
                                hamster-sidejack hexinject iaxflood inviteflood \
                                ismtp mitmproxy ohrwurm protos-sip rebind \
                                responder rtpbreak rtpinsertsound rtpmixsound \
                                sctpscan siparmyknife sipp sipvicious sniffjoke \
                                sslsplit sslstrip thc-ipv6 voiphopper webscarab \
                                wifi-honey wireshark xspy yersinia zaproxy;;
      \"Maintaining_Access\") apt-get install -y cryptcat cymothoa dbd dns2tcp \
                                http-tunnel httptunnel intersect nishang \
                                polenum powersploit pwnat ridenum sbd u3-pwn \
                                webshells weevely;;
      \"Reporting_Tools\") apt-get install -y casefile cutycapt dos2unix dradis \
                                keepnote magictree metagoofil nipper-ng pipal;;
      \"Exploitation_Tools\") apt-get install -y armitage backdoor-factory \
                                cisco-auditing-tool cisco-global-exploiter \
                                cisco-ocs cisco-torch crackle jboss-autopwn \
                                linux-exploit-suggester maltego-teeth set \
                                shellnoob sqlmap thc-ipv6 yersinia beef-xss git \
                                && git clone https://github.com/stasinopoulos/commix.git commix && \
                                cd commix && python ./commix.py --install;;
      \"Forensics_Tools\") apt-get install -y binwalk bulk-extractor chntpw \
                                cuckoo dc3dd ddrescue dumpzilla extundelete \
                                foremost galleta guymager iphone-backup-analyzer \
                                p0f pdf-parser pdfid pdgmail peepdf volatility xplico;;
      \"Stress_Testing\") apt-get install -y dhcpig funkload iaxflood inviteflood \
                                ipv6-toolkit mdk3 reaver rtpflood slowhttptest \
                                t50 termineter thc-ipv6 thc-ssl-dos;;
      \"Password_Attacks\") apt-get install -y acccheck burpsuite cewl chntpw \
                                cisco-auditing-tool cmospwd creddump crunch \
                                findmyhash gpp-decrypt hash-identifier hexorbase \
                                john johnny keimpx maltego-teeth maskprocessor \
                                multiforcer ncrack oclgausscrack pack patator \
                                polenum rainbowcrack rcracki-mt rsmangler \
                                statsprocessor thc-pptp-bruter truecrack \
                                webscarab wordlists zaproxy;;
      \"Reverse_Engineering\") apt-get install -y apktool dex2jar python-diStorm3 \
                                edb-debugger jad javasnoop JD OllyDbg smali Valgrind YARA;;
      \"Hardware_Hacking\") apt-get install -y android-sdk apktool arduino dex2jar sakis3g smali;;
      \"Extra\") apt-get install squid3 git && git clone https://github.com/LionSec/wifresti.git && \
                                cp wifresti/wifresti.py /usr/bin/wifresti && \
                                chmod +x /usr/bin/wifresti && wifresti;;
    esac
  done
}


while [[ true ]]; do
  # OPTION=$(whiptail --title "kailiTools" --menu "Choose your option" 15 60 7 \
  # "1" "add kali rolling repositories" \
  # "2" "remove kali rolling repositories" \
  # "3" "install kali software" \
  # "4" "exit kaliTools"  3>&1 1>&2 2>&3)
  OPTION=$(index)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
      case $OPTION in
        1) addRepo;;
        2) delRepo;;
        3) KaliToolsCategories;;
        4) softwareList;;
        0) delRepo
					 break;;
      esac
  else
      echo "You chose Cancel."
  fi
done
