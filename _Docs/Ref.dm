/*

----------------
Client Functions
----------------

	Alert(message, title, list("button1", "button2", "button3"))

		+message: A string that is used to set the alert windows message.

		+title: A string that is used to set the alert windows title.

		+list(): An indexed list that is used to set the text on each button.

		+returns:
			-This function returns an integer that represents which button was pressed.
				-If a client clicks button 1, it will return 1.

		+examples:
			src.Alert("This is an alert with one button.", "Alert", list("Button Text"))
			src.Alert("This is an alert with two buttons.", "Alert", list("Button Text", "Button Test2"))
			src.Alert("This is an alert with three buttons.", "Alert", list("Button Text", "Button Text2", "Button Text3"))

			switch(src.Alert("This is an alert that checks which button you press.", "Alert", list("One", "Two", "Three")))
				if(1)
					src.Alert("Button one was pressed.", "Alert")
				if(2)
					src.Alert("Button two was pressed.", "Alert")
				if(3)
					src.Alert("Button three was pressed.", "Alert")

		+notes:
			-The max ammount of buttons is currently 3.
			-Not defining a list defaults in one button that says "Ok"
			-This function will halt code until input is given unless it is spawned off.


	AlertInput(message, title, list("button1", "button2", "button3"), mask)

		+message: A string that is used to set the alert windows message.

		+title: A string that is used to set the alert windows title.

		+list(): An indexed list that is used to set the text on each button.

		+mask: An integer used to toggle text input masking. 0 = Off, 1 = On.

		+returns:
			-This function returns an indexed list that represents which button was pressed and what the input is.
				-If a client clicks button 2, and has entered "Hello" in the input box, it will return list(1 = 2, 2 = "Hello").

		+example:
			var/list/AlertInput=src.AlertInput("This is an alert that takes input as well as a button.", "AlertInput", list("One", "Two"))
			switch(AlertInput[1])
				if(1)
					src.Alert("You hit button one. Your input was: [AlertInput[2]]", "Alert")
				if(2)
					src.Alert("You hit button two. Your input was: [AlertInput[2]]", "Alert")

		+notes:
			-The max ammount of buttons is currently 3.
			-Not defining a list defaults in one button that says "Ok"
			-This function will halt code until input is given unless it is spawned off.

	AlertList(message, title, list("button1", "button2", "button3"))

		+message: A string that is used to set the alert windows message.

		+title: A string that is used to set the alert windows title.

		+list(): An indexed list that is used to set the text on each button.

		+returns:
			-This function returns an integer that represents which button was pressed.
				-If a client clicks button 1, it will return 1.

		+example:
			src.AlertList("This is an alert list with one button.", "Alert", list("Button Text"))
			src.AlertList("This is an alert list with two buttons.", "Alert", list("Button Text", "Button Test2"))
			src.AlertList("This is an alert list with three buttons.", "Alert", list("Button Text", "Button Text2", "Button Text3"))

			switch(src.Alert("This is an alert list that checks which button you press.", "Alert", list("One", "Two", "Three")))
				if(1)
					src.Alert("Button one was pressed.", "Alert")
				if(2)
					src.Alert("Button two was pressed.", "Alert")
				if(3)
					src.Alert("Button three was pressed.", "Alert")

		+notes:
			-The max ammount of buttons is currently 8.
			-Not defining a list defaults in one button that says "Ok"
			-This function will halt code until input is given unless it is spawned off.
/*