--
-- Created by IntelliJ IDEA.
-- User: playcrab1
-- Date: 13-12-19
-- Time: 下午4:47
-- To change this template use File | Settings | File Templates.
--

require 'script/Oop/Object'

testevent2=Object:subclass('testevent')


function testevent2.class:getInstance()
    LuaLog('testevent2:getInstance')

    local instance
    if instance ==nil then
        instance=self:new()


    end

    return instance
end


function testevent2:onEnter(data)


    --TODO:接收传递过来的数据
    self.data=data

    LuaLog('testevent2:onEnter'..data)

end


