{
	
	services.syncthing = {
		enable = true;
		user = "cujo";
		dataDir = "/home/cujo";
		systemService = true;


		settings = {

		  options = {
		    relaysEnabled = false;
		  };
			devices = {
				server = {
					addresses = [
						"tcp://192.168.0.100:22000"
					];
					id = "3DPX6WI-GVOXCTD-XDB47WD-5KWBOEH-3LTKYKR-C35N6CF-EA3MSZL-OOBHZQD";
				};
				op11 = {
					addresses = [
						"dynamic"
					];
				  id = "5SBLXSE-UL27V7V-XA3Y5S6-DNTFM4K-KE75BTL-AS6Z27F-AD66Y77-CHRVVA3";
				};
			};
			folders = {
				"/home/cujo/keepass" = {
					label = "keepass";
					id = "rirxw-ffvwq";
					devices = [ "server" "op11" ];
				};
				"/home/cujo/Logseq" = {
					label = "Logseq";
					id = "Logseq";
					devices = [ "server" "op11" ];
				};
				"/home/cujo/mount/Music" = {
				  label = "music";
				  id = "music";
				  devices = [ "op11" ];
				};
			};
		};
	};
}
