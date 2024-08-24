{ pkgs, ...} : 
{
  	networking.nat = {
		enable = true;
  		externalInterface = "enp1s0";
  		internalInterfaces = [ "wg0" "wg53" ];
	};	
  
  	networking.wireguard = { 
			enable = true;	
  			interfaces = {
    				wg0 = {
      
      					ips = [ "10.100.0.1/24" ];
      					listenPort = 51820;
			
      					postSetup = ''
      						${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o enp1s0 -j MASQUERADE 
      					'';
      					postShutdown = ''
      						${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o enp1s0 -j MASQUERADE
      					'';
      					privateKeyFile = "/home/cujo/wireguard-keys/private";
		
      					peers = [
						{
	  						# PC   
          						publicKey = "y5x3g/hDwqzqhC64nENtXO4tdweqjGrIglK1J1LscmI=";
          						allowedIPs = [ "10.100.0.2/32" ];
							# Mobile
							publicKey = "2SCkbWqH/LBCq9+JhxWBT1mY9UhG5MI0ZL5mRotxjRQ=";
							allowedIPs = [ "10.100.0.3/32" ];
       						}
      					];
    				};
				
				wg53 = {
					ips = [ "10.100.1.1/24" ];
					listenPort = 53;
					
					postSetup = ''
        					${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.1.0/24 -o enp1s0 -j MASQUERADE
      					'';	
      					postShutdown = ''
        					${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.1.0/24 -o enp1s0 -j MASQUERADE
      					'';
					privateKeyFile = "/home/cujo/wireguard-keys/private-53";
					peers = [
						{
							# PC 
							publicKey = "32J1k4zmR9stwvJZV+Gl86W+3sDcPzsNASnC1fvEkTM=";
							allowedIPs = [ "10.100.1.2/32" ];
							# Mobile 
							publicKey = "9lNEApsiDpmp6WfUDyWSRsTLX9RMxnHHpboIfk9wMnM=";
							allowedIPs = [ "10.100.1.3/32" ];
						}
					];
				};	
  			};
	};

}
