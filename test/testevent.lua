--
-- Created by IntelliJ IDEA.
-- User: playcrab1
-- Date: 13-12-19
-- Time: 上午11:58
-- To change this template use File | Settings | File Templates.
--
require 'scripts/Oop/Object'

testevent=Object:subclass('testevent')


function testevent.class:getInstance()
    LuaLog('testevent:getInstance')

    local instance
    if instance ==nil then
        instance=self:new()


    end

    return instance
end


function testevent:onEnter(data)

    self.data=data

    LuaLog('testevent:onEnter data: '..self.data)

end




