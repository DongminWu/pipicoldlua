--
-- Created by IntelliJ IDEA.
-- User: playcrab1
-- Date: 13-12-20
-- Time: 下午12:14
-- To change this template use File | Settings | File Templates.
--


require 'scripts/Requires'
require 'scripts/View'



TextGameMainView=View:subclass('TextGameMainView')

local instance
function TextGameMainView.class:getInstance()     --把自己声明为一个单例
    LuaLog('TextGameMainView:getInstance')
    if instance==nil then
        instance=TextGameMainView:new()
    end

    return instance
end



function TextGameMainView:onEnter(data)   --当调用这个函数时这里是入口

    self:getEvent()       --可以进行事件操作



    print('hello myworld')

    print('please give me a command')

    self.input=io.read()

    print(self.input)




end


function TextGameMainView:getEvent()
    self.event=Event:getInstance()

end


