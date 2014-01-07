--
-- Created by IntelliJ IDEA.
-- User: playcrab1
-- Date: 13-12-18
-- Time: 下午7:26
-- To change this template use File | Settings | File Templates.
--
require 'scripts/LuaLog'
require 'scripts/LuaError'
require 'scripts/Oop/Object'

-- Event={}




--[[TODO:Event使用方法

   使用Event的各种方法之前先要getInstance()来获得这个单例

   监听器的制作

   1.要新建一个lua脚本然后做成单例,入口函数是onEnter()  [参见:test.testevent.lua]

   2.在RequiresThings.lua中将其引用成为全局变量

   [---------

   每次调用Event的各种方法之前需要先获得Event单例

   local event=Event:getInstance()

   ------------]


   新建一个事件

   事件名称最好为大写字母

   然后调用addEvent方法

   例如: EVENT_POPUP_TEST=event.addEvent()








]]



Event=Object:subclass('Event')
function Event.class:getInstance()

	LuaLog('Event:getInstance()')
	if Event_instance==nil then
		Event_instance=Event:new()
	end

	return Event_instance
end


function Event:addEvent(eventname)
   --加一个Event到EventMap
   LuaLog('Event:addEvent ['..eventname..']')
   EventMap[eventname]={}
    --   print(EventMap[eventname])
   return eventname
end

 --TODO:如果事件没有对应的Listener就输出提示错误
function Event:sendEvent(eventname,data)
    --发送/触发一个Event


    LuaLog('Event:sendEvent ['..eventname..'] data:'..data)
    local v
    local name='testevent'
    for k,v in pairs(EventMap[eventname]) do
        local listener=v:getInstance()
        listener:onEnter(data)
    end



end

function Event:addListener(eventname,listener)
   --添加一个事件监听器

--    LuaLog('Event:addListener ['..eventname..'] listened by ['..listener..']('..EventListenerPath[listener]..')')
    LuaLog('Event:addListener ['..eventname..'] ')
--    print(listener)
--    table.insert(EventMap[eventname],listener)
    EventMap[eventname][listener]=listener



end

function Event:deleteEvent(eventname)
     --删除一个事件从EventMap
    EventMap[eventname]=nil
end


function Event:deleteListener(eventname,listener)

    EventMap[eventname][listener]=nil
--    print(EventMap[eventname][listener])
    for k,v in pairs(EventMap[eventname]) do
        print('value='..v)
        --        print(require (v))
        --        print('class name='..k)
        --        print('type='..type(v))




    end


end


