/obj/item/mechcomp/relay
	name = "relay"
	desc = "Somebody's gonna get RE-laid. Ha-ha."

	icon_state = "comp_relay"

	var/replace = 0

/obj/item/mechcomp/relay/New()
	..()
	handler.addInput("relay", "relay")

/obj/item/mechcomp/relay/proc/relay(var/signal)
	flick(icon_state+"_active",src)
	if(replace)
		handler.sendSignal()
	else
		handler.sendSignal(signal)

/obj/item/mechcomp/relay/get_settings(var/source)
	var/dat = "<B>Relay settings:</B><BR>"
	dat += "Replace the signal : <A href='?src=\ref[source];relay_action=set_replace'>[replace ? "true" : "false"]</A><BR>"
	return dat

/obj/item/mechcomp/relay/set_settings(href, href_list, user)
	if(href_list["relay_action"])
		switch(href_list["relay_action"])
			if("set_replace")
				replace = !replace

		return MT_REFRESH