local kb = libs.keyboard;
local fs = libs.fs;
local win = libs.win;
local utf8 = libs.utf8;
local server = libs.server;


events.detect = function ()
	return
    fs.exists("D:\\Sooft\\mpv");
end

actions.switch = function()
	
		local hwnd = win.find("mpv", nil);
		if (hwnd == 0) then win.window("mpv.exe"); end
		win.switchtowait("mpv.exe");
	
end

actions.command = function()
	local hwnd = win.find("mpv", nil);
	if (hwnd == 0) then
		hwnd = win.window("mpv.exe");
	end
	 win.switchtowait("mpv.exe");
	--actions.switch();
	actions.update();
end


--@help Update status information
actions.update = function ()
    local hwnd = win.find("mpv", nil);
  if (hwnd == 0) then
    hwnd = win.window("mpv.exe");
  end
  local _title = win.title(hwnd);
  _title = utf8.replace(_title, " - mpv", "");
  if (_title == "") then
    _title = "[Not Playing]";
  end
  
  if (_title ~= title) then
    title = _title;
    server.update({ id = "info", text = title });
  end
end


--@help Lower volume +
actions.volume_down = function()
  actions.command();
  kb.stroke("9");
end

--@help Mute volume
actions.volume_mute = function()
  actions.command();
  kb.stroke("m");
end

--@help Raise volume +
actions.volume_up = function()
  actions.command();
  kb.stroke("0");
end

--@help Previous track
actions.previous = function()
  actions.command();
  kb.stroke("ctrl", "Alt", "1");
end

--@help Next track
actions.next = function()
  actions.command();
  kb.stroke("ctrl", "Alt", "2");
end

--@help Skip forward 5 secs
actions.forward = function()
  actions.command();
  kb.stroke("ctrl", "9");
end

--@help Skip backward 5 secs
actions.backward = function()
actions.command();
  kb.stroke("ctrl", "8");
end


--@help Skip forward 30 secs
actions.forward_30 = function()
actions.command();
  kb.stroke("ctrl", "Alt",  "9");
end

--@help Skip backward 30 secs
actions.backward_30 = function()
actions.command();
  kb.stroke("ctrl", "Alt", "7");
end



--@help Toggle play/pause state +
actions.play_pause = function()
actions.command();
kb.stroke("space");

end

--@help Stop playback
actions.stop = function()
actions.command();
  kb.text("q");
end

--@help Cycle through subtitles
actions.switch_subs = function()
actions.command();
  kb.text("j");
end

--@help Toggle subtitle visibility
actions.toggle_subs = function()
actions.command();
  kb.text("v");
end

--@help Toggle fullscreen
actions.fullscreen = function()
actions.command();
  kb.text("f");
end

actions.osd = function()
actions.command();
  kb.text("O");
end

--@help Increase subtitle delay
actions.subtitle_delay_down = function()
actions.command();
  kb.text("z");
end

--@help Decrease subtitle delay
actions.subtitle_delay_up = function()
actions.command();
  kb.text("x");
end

--@help Increase audio delay
actions.audio_delay_down = function()
actions.command();
  kb.stroke("ctrl", "numpadsubtract");
end

--@help Decrease audio delay
actions.audio_delay_up = function()
actions.command();
  kb.stroke("ctrl", "numpadadd");
end

--@help Decrease playback speed
actions.playback_speed_down = function()
actions.command();
  kb.text("[");
end

--@help Increase playback speed
actions.playback_speed_up = function()
actions.command();
  kb.text("]");
end

--@help Reset playback speed
actions.playback_speed_reset = function()
actions.command();
  kb.stroke("backspace");
end



--@help  Anime4K
actions.anime4k_0 = function()
actions.command();
  kb.stroke("ctrl", "0");
end

actions.anime4k_1 = function()
actions.command();
  kb.stroke("ctrl", "1");
end

actions.anime4k_2 = function()
actions.command();
  kb.stroke("ctrl", "2");
end

actions.anime4k_3 = function()
actions.command();
  kb.stroke("ctrl", "3");
end

actions.anime4k_4 = function()
actions.command();
  kb.stroke("ctrl", "4");
end

actions.anime4k_5 = function()
actions.command();
  kb.stroke("ctrl", "5");
end

actions.anime4k_6 = function()
actions.command();
  kb.stroke("ctrl", "6");
end