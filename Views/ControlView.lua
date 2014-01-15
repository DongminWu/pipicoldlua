--
-- Created by IntelliJ IDEA.
-- User: playcrab1
-- Date: 14-1-15
-- Time: 上午11:27
-- To change this template use File | Settings | File Templates.
--

--把这个直接做成一个可以返回layer的东西   ,第一版先用自带的CCMenu完成,能触发事件就行

require 'scripts/Requires'
require 'scripts/View'

ControlView = View:subclass('ControlView')


function ControlView:initialize()
    LuaLog('ControlView:initialize()')

end


function ControlView.class:getInstance()
    LuaLog('ControlView:getInstance')
    if ControlView_instance==nil then
        ControlView_instance=ControlView:new()
    end
    return ControlView_instance
end

function ControlView:onEnter(data)
    LuaLog('ControlView:onEnter()')
    self:getEvent()



end


function ControlView:getEvent()
    self.event=Event:getInstance()

end

function ControlView:BuildControlPanel()

    local origin = CCDirector:sharedDirector():getVisibleOrigin()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local buttonsize  =80

    local layer =CCLayer:create()    --layer

    local menu =CCMenu:create()


    function OnClickUP()
        LuaLog('按下"上"按钮')
    end

    function OnClickDOWN()
        LuaLog('按下"下"按钮')
    end

    function OnClickLEFT()
        LuaLog('按下"左"按钮')
    end

    function OnClickRIGHT()
        LuaLog('按下"右"按钮')
    end

    function OnClickATTACK()

        LuaLog('按下"攻击"按钮')

    end

    function OnClickJUMP()

        LuaLog('按下"跳跃"按钮')

    end

    function OnClickDASH()

        LuaLog('按下"冲刺"按钮')

    end


    local buttonup=CCMenuItemFont:create('上')
    local buttonright=CCMenuItemFont:create('右')
    local buttonleft=CCMenuItemFont:create('左')
    local buttondown=CCMenuItemFont:create('下')
    local buttonattack=CCMenuItemFont:create('攻击')
    local buttonjump=CCMenuItemFont:create('跳跃')
    local buttondash=CCMenuItemFont:create('冲刺')

    buttonup:setPosition(buttonsize,buttonsize*2);
    buttonup:registerScriptTapHandler(OnClickUP);

    buttonright:setPosition(buttonsize*2,buttonsize)
    buttonright:registerScriptTapHandler(OnClickRIGHT)

    buttondown:setPosition(buttonsize,0)
    buttondown:registerScriptTapHandler(OnClickDOWN)

    buttonleft:setPosition(0,buttonsize)
    buttonleft:registerScriptTapHandler(OnClickLEFT)

    buttonattack:setPosition(visibleSize.width-(buttonattack:getContentSize().width+buttonsize),0)
    buttonattack:registerScriptTapHandler(OnClickATTACK)

    buttonjump:setPosition(visibleSize.width-(buttonattack:getContentSize().width+buttonsize),buttonsize)
    buttonjump:registerScriptTapHandler(OnClickJUMP)

    buttondash:setPosition(visibleSize.width-(buttonattack:getContentSize().width*2+buttonsize*2),0)
    buttondash:registerScriptTapHandler(OnClickDASH)

    menu:addChild(buttondown)
    menu:addChild(buttonup)
    menu:addChild(buttonleft)
    menu:addChild(buttonright)
    menu:addChild(buttonattack)
    menu:addChild(buttonjump)
    menu:addChild(buttondash)


    menu:setPosition(origin.x+buttonsize,origin.y+buttonsize)

    layer:addChild(menu)

     return layer
end









