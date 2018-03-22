client
	var/tmp/list/prompts=list()

	proc/Alert(var/msg, var/title, var/list/buttons=list(1="Ok"))
		var/Input/AlertBox/I=new(src, msg, title, buttons)
		return I.GetPrompt()

	proc/AlertInput(var/msg, var/title, var/list/buttons=list(1="Ok"), var/mask=0)
		var/Input/AlertBox_Input/I=new(src, msg, title, buttons, mask)
		return list(1=I.GetPrompt(), 2=I.input)

	proc/AlertList(var/msg, var/title, var/list/buttons=list())
		var/Input/AlertBox_List/I=new(src, msg, title, buttons)
		return I.GetPrompt()