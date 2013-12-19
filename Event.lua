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
   LuaLog('Event:addEvent ['..eventname..']')
   EventMap[eventname]={}
    --   print(EventMap[eventname])




end


function Event:sendEvent(eventname)
    --发送/触发一个Event
    LuaLog('Event:sendEvent ['..eventname..']')
    local v
    local name='testevent'

    for k,v in pairs(EventMap[eventname]) do
--        print('value='..v)
--        print(require (v))
--        print('class name='..k)
--        print('type='..type(v))
        local listener=v:getInstance()
        listener:onEnter()

    end



end

function Event:addListener(eventname,listener)
   --添加一个事件监听器

--    LuaLog('Event:addListener ['..eventname..'] listened by ['..listener..']('..EventListenerPath[listener]..')')
    LuaLog('Event:addListener ['..eventname..'] ')
--    print(listener)
    table.insert(EventMap[eventname],listener)
--    table.insert(EventMap[eventname],listener)



end

function Event:deleteEvent(eventname)
     --删除一个事件从EventMap
    EventMap[eventname]=nil

end


function Event:deleteListener(eventname,listener)

    EventMap[eventname][listener]=nil

end


