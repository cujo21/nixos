{ 
	services.dunst = {
		enable = true;
		settings = {
			global = {
				width = 300;
				height = 300;
				offset = "30x50";
				origin = "top-right";
			};

			urgency_normal = {
				timeout = 10;
			};
		};
	};

}
