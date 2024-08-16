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
			};
		};
	};
}
