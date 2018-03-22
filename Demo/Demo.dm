world
	fps=20

client
	New()
		..()
		spawn() src.InitDemo()


	proc/InitDemo()
		winset(src, null, {"
			A_Demo.is-default=\"true\";
			A_Demo.is-visible=\"true\";"})
		src.AlertList("This is an alert list with one button.", "Alert", list("Button Text"))
		src.AlertList("This is an alert list with two buttons.", "Alert", list("Button Text", "Button Test2"))
		src.AlertList("This is an alert list with three buttons.", "Alert", list("Button Text", "Button Text2", "Button Text3"))

		switch(src.AlertList("This is an alert list that checks which button you press.", "Alert", list("One", "Two", "Three")))
			if(1)
				src.Alert("Button one was pressed.", "Alert")
			if(2)
				src.Alert("Button two was pressed.", "Alert")
			if(3)
				src.Alert("Button three was pressed.", "Alert")

		var/list/AlertInput=src.AlertInput("This is an alert that takes input as well as a button", "AlertInput", list("ONE", "TWO"))
		switch(AlertInput[1])
			if(1)
				src.Alert("You hit button one. Your input was: [AlertInput[2]]", "Alert")
			if(2)
				src.Alert("You hit button two. Your input was: [AlertInput[2]]", "Alert")