{
	
	services.syncthing = {
		enable = true;
		user = "cujo";
		dataDir = "/home/cujo";
		systemService = true;

		settings = {
			devices = {
				server = {
					addresses = [
						"tcp://192.168.0.104:22000"
					];
					id = "3DPX6WI-GVOXCTD-XDB47WD-5KWBOEH-3LTKYKR-C35N6CF-EA3MSZL-OOBHZQD";
				};
				op11 = {
					addresses = [
						"dynamic"
					];
					id = "7BOMYMD-RBWTCWI-OEGZCOX-GTVXC43-HT5Q5XM-BBV3B7S-GPA7OGJ-3XTYJQL";
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
			};
		};
	};
}
