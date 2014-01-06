--
-- Created by IntelliJ IDEA.
-- User: playcrab1
-- Date: 13-12-26
-- Time: 下午5:20
-- To change this template use File | Settings | File Templates.
--

-------------
--
--这里是构想.
--想法是在这里面吧hero的各种功能都实现
--上下左右行走 按下攻击键
--各种触发
--感觉就像是一个小的view..在每个场景中的小view
--通过model来获得数据
--
--------------


require 'Requires'
require 'View'

HeroPartView = View:subclass('HeroPartView')




function HeroPartView:initialize()
   LuaLog('HeroPartView:initialize()')
--   self.model=HeroModel:getInstance()

end


function HeroPartView.class:getInstance()
    LuaLog('HeroPartView:getInstance')
    if HeroPartView_instance==nil then
        HeroPartView_instance=HeroPartView:new()
    end
    return HeroPartView_instance
end

function HeroPartView:onEnter(data)

    self:getEvent()
    self.heromodel = HeroModel:getInstance()



end


function HeroPartView:getEvent()
    self.event=Event:getInstance()

end



 function HeroPartView:makeAnimate()

    local rect=CCRectMake(0,0,128,128)

    --local stand_img = self.model:getStandImg()

    local i=1

    local frames={}

    local animFrames=CCArray:create()


    for _,v in pairs(self.heromodel.stand_img) do

         frames[i]=CCSpriteFrame:create(v,rect)
         animFrames:addObject(frames[i])

    end

    local animation =CCAnimation:createWithSpriteFrames(animFrames,0.1)

    local animate = CCAnimate:create(animation)

    return animate

end


function HeroPartView:makeName()

    local model=self.heromodel

    local name=model:getName()

    local nametext = CCLabelTTF:create(name,'微软雅黑',12)

    return nametext


end


function HeroPartView:BuildHero(status)



    local hero =CCSprite:create()

    local text = self:makeName()



    hero:addChild(text)

    pipicold('hero:getContentSize().width='..hero:getContentSize().width)

    text:setPosition(64,0)

    hero:runAction(CCRepeatForever:create(self:makeAnimate()))

    return hero


end







