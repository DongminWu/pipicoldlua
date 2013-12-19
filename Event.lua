--
-- Created by IntelliJ IDEA.
-- User: playcrab1
-- Date: 13-12-18
-- Time: 下午7:26
-- To change this template use File | Settings | File Templates.
--
require 'Requires'

-- Event={}
Event=Object:subclass('Event')
local instance
function Event.class:getInstance()

	LuaLog('Event:getInstance()')
	if instance==nil then
		instance=Event:new()
	end

	return instance
end

--TODO addEvent 不需要

function Event:addEvent(eventname)
   --加一个Event到EventMap
   LuaLog('Event:addEvent')
   EventMap[eventname]=eventname
   print(EventMap.eventname)




end


function Event:sendEvent()
    --发送/触发一个Event

end

function Event:addListener()
   --添加一个事件监听器

end

function Event:deleteEvent()
   --删除一个事件从EventMap


end
