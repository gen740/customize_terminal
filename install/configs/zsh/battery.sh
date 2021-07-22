#/bin/zsh
data=`date '+%s %Y-%m-%d-%H-%M' && /usr/sbin/ioreg -l -w0 | grep '"MaxCapacity" =' | awk '{print$5;}'`
echo $data | sed 's/\n//g' >> /Users/fujimotogen/.config/zsh/battery.log 2> /Users/fujimotogen/.config/zsh/error.log
