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
				oneplus_nameless = {
					addresses = [
						"dynamic"
					];
					id = "R5BLE7S-55SJKXX-SIXPVZ2-ZQLG5JE-HFDEPY4-UFWCQRZ-2DCHKWS-ZJJQ6Q4";
				};
			};
			folders = {
				"/home/cujo/keepass" = {
					label = "keepass";
					id = "rirxw-ffvwq";
					devices = [ "server" "oneplus_nameless" ];
				};
				"/home/cujo/Logseq" = {
					label = "Logseq";
					id = "Logseq";
					devices = [ "server" "oneplus_nameless" ];
				};
			};
		};
	};
}
