Input
	parent_type=/obj
	AlertBox
		var/id
		var/button
		var/client/client
		var/m
		New(client/C, var/message, var/title, var/list/buttons=list())
			..()
			C.prompts+=src
			src.client=C
			src.id="AlertBox-[rand(1, 999)]"
			if(buttons.len<1) buttons.len=1
			if(buttons.len>3) buttons.len=3
			winclone(src.client, "AlertBox[buttons.len]","[src.id]")
			var/InterfaceQuery/query=new()

			if(buttons.len>=1)
				query.Add({"
					[src.id].Titlebar.text=\"[title]\";
					[src.id].Button1.text=\"[buttons[1]]\";
					[src.id].Button1.command=\"AlertBox-Button1 [src.id]\";"})

				if(buttons.len>=2)
					query.Add({"
						[src.id].Button2.text=\"[buttons[2]]\";
						[src.id].Button2.command=\"AlertBox-Button2 [src.id]\";"})

					if(buttons.len>=3)
						query.Add({"
							[src.id].Button3.text=\"[buttons[3]]\";
							[src.id].Button3.command=\"AlertBox-Button3 [src.id]\";"})

				query.Add({"
					[src.id].is-visible=true;"})

			src.client.mob << output("<center>"+message+"</center>", "[src.id].Message")
			winset(src.client, null, "[query.Execute()]")

		proc/DelPrompt()
			if(src.client) winset(src.client, "[src.id]", "parent=none")
			if(src.client) src.client.prompts-=src
			if(src) client=null

		proc/GetPrompt()
			while(src && src.client)
				if(!src.button)
					sleep(world.tick_lag)
				else
					src.client.prompts-=src
					winset(src.client, "[src.id]", "parent=none")
					return src.button

			//Null references so the garbage collector can clean it up.
			if(src) client=null
			if(src.client) src.client.prompts-=src

	AlertBox_Input
		var/id
		var/button
		var/input
		var/client/client
		New(client/C, var/message, var/title, var/list/buttons=list(), var/mask=0)
			..()
			C.prompts+=src
			src.client=C
			src.id="AlertBox_Input-[rand(1, 999)]"
			if(buttons.len<1) buttons.len=1
			if(buttons.len>3) buttons.len=3
			winclone(src.client, "AlertBox_Input[buttons.len]","[src.id]")
			if(mask) winset(src.client, null, "[src.id].Input.is-password=\"true\";")
			var/InterfaceQuery/query=new()

			if(buttons.len>=1)
				query.Add({"
					[src.id].Titlebar.text=\"[title]\";
					[src.id].Button1.text=\"[buttons[1]]\";
					[src.id].Button1.command=\"AlertBox-Input-Button1 [src.id]\";"})

				if(buttons.len>=2)
					query.Add({"
						[src.id].Button2.text=\"[buttons[2]]\";
						[src.id].Button2.command=\"AlertBox-Input-Button2 [src.id]\";"})

					if(buttons.len>=3)
						query.Add({"
							[src.id].Button3.text=\"[buttons[3]]\";
							[src.id].Button3.command=\"AlertBox-Input-Button3 [src.id]\";"})

				query.Add({"
					[src.id].Input.focus=\"true\";
					[src.id].is-visible=true;"})

			src.client.mob << output("<center>"+message+"</center>", "[src.id].Message")
			winset(src.client, null, "[query.Execute()]")

		proc/DelPrompt()
			if(src.client) winset(src.client, "[src.id]", "parent=none")
			if(src.client) src.client.prompts-=src
			if(src) client=null

		proc/GetPrompt()
			while(src && src.client)
				if(!src.button)
					sleep(world.tick_lag)
				else
					src.client.prompts-=src
					src.input=winget(src.client, "[src.id].Input","text")
					winset(src.client, "[src.id]", "parent=none")
					return src.button

			//Null references so the garbage collector can clean it up.
			if(src) client=null
			if(src.client) src.client.prompts-=src


	AlertBox_List
		var/id
		var/button
		var/client/client
		New(client/C, var/message, var/title, var/list/buttons=list())
			..()
			C.prompts+=src
			src.client=C
			src.id="AlertBox_List-[rand(1, 999)]"
			if(buttons.len<1) buttons.len=1
			if(buttons.len>8) buttons.len=8
			winclone(src.client, "AlertBox_List[buttons.len]","[src.id]")
			var/InterfaceQuery/query=new()

			if(buttons.len>=1)
				query.Add({"
					[src.id].Titlebar.text=\"[title]\";
					[src.id].List1.text=\"[buttons[1]]\";
					[src.id].List1.command=\"AlertBox-List-Button1 [src.id]\";"})

				if(buttons.len>=2)
					query.Add({"
						[src.id].List2.text=\"[buttons[2]]\";
						[src.id].List2.command=\"AlertBox-List-Button2 [src.id]\";"})

					if(buttons.len>=3)
						query.Add({"
							[src.id].List3.text=\"[buttons[3]]\";
							[src.id].List3.command=\"AlertBox-List-Button3 [src.id]\";"})

						if(buttons.len>=4)
							query.Add({"
								[src.id].List4.text=\"[buttons[4]]\";
								[src.id].List4.command=\"AlertBox-List-Button4 [src.id]\";"})

							if(buttons.len>=5)
								query.Add({"
									[src.id].List5.text=\"[buttons[5]]\";
									[src.id].List5.command=\"AlertBox-List-Button5 [src.id]\";"})

								if(buttons.len>=6)
									query.Add({"
										[src.id].List6.text=\"[buttons[6]]\";
										[src.id].List6.command=\"AlertBox-List-Button6 [src.id]\";"})

									if(buttons.len>=7)
										query.Add({"
											[src.id].List7.text=\"[buttons[7]]\";
											[src.id].List7.command=\"AlertBox-List-Button7 [src.id]\";"})

										if(buttons.len>=8)
											query.Add({"
												[src.id].List8.text=\"[buttons[8]]\";
												[src.id].List8.command=\"AlertBox-List-Button8 [src.id]\";"})

				query.Add({"
					[src.id].is-visible=true;"})

				src.client.mob << output("<center>"+message+"</center>", "[src.id].Message")
				winset(src.client, null, "[query.Execute()]")

		proc/DelPrompt()
			if(src.client) winset(src.client, "[src.id]", "parent=none")
			if(src.client) src.client.prompts-=src
			if(src) client=null

		proc/GetPrompt()
			while(src && src.client)
				if(!src.button)
					sleep(world.tick_lag)
				else
					src.client.prompts-=src
					winset(src.client, "[src.id]", "parent=none")
					return src.button

			//Null references so the garbage collector can clean it up.
			if(src) client=null
			if(src.client) src.client.prompts-=src



client

	verb/AlertBox_Button1(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox/I in usr.client.prompts)
			if(id==I.id)
				I.button=1
				break

	verb/AlertBox_Button2(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox/I in usr.client.prompts)
			if(id==I.id)
				I.button=2
				break

	verb/AlertBox_Button3(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox/I in usr.client.prompts)
			if(id==I.id)
				I.button=3
				break

	verb/AlertBox_Input_Button1(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_Input/I in usr.client.prompts)
			if(id==I.id)
				I.button=1
				break

	verb/AlertBox_Input_Button2(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_Input/I in usr.client.prompts)
			if(id==I.id)
				I.button=2
				break

	verb/AlertBox_Input_Button3(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_Input/I in usr.client.prompts)
			if(id==I.id)
				I.button=3
				break

	verb/AlertBox_List_Button1(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_List/I in usr.client.prompts)
			if(id==I.id)
				I.button=1
				break

	verb/AlertBox_List_Button2(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_List/I in usr.client.prompts)
			if(id==I.id)
				I.button=2
				break

	verb/AlertBox_List_Button3(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_List/I in usr.client.prompts)
			if(id==I.id)
				I.button=3
				break

	verb/AlertBox_List_Button4(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_List/I in usr.client.prompts)
			if(id==I.id)
				I.button=4
				break

	verb/AlertBox_List_Button5(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_List/I in usr.client.prompts)
			if(id==I.id)
				I.button=5
				break

	verb/AlertBox_List_Button6(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_List/I in usr.client.prompts)
			if(id==I.id)
				I.button=6
				break

	verb/AlertBox_List_Button7(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_List/I in usr.client.prompts)
			if(id==I.id)
				I.button=7
				break

	verb/AlertBox_List_Button8(id as text)
		set hidden=1
		if(id) for(var/Input/AlertBox_List/I in usr.client.prompts)
			if(id==I.id)
				I.button=8
				break