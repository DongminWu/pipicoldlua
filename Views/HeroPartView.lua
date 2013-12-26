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

require 'HeroModel'
 require 'Requires'
require 'View'


HeroPartView = View:subclass('HeroPartView')




function HeroPartView:initialize()
   LuaLog('HeroModel:initialize()')
--   self.model=HeroModel:getInstance()

end


local instance
function HeroPartView.class:getInstance()
    LuaLog('HeroPartView:getInstance')
    if instance==nil then
        instance=HeroPartView:new()
    end

    self.model = HeroModel:getInstance()
--    self:onEnter()

    return instance
end

function HeroPartView:onEnter(data)

    self:getEvent()
    self.model = HeroModel:getInstance()





end


function HeroPartView:getEvent()
    self.event=Event:getInstance()

end



local function makeAnimate()

    local rect=CCRectMake(0,0,128,128)

    --local stand_img = self.model:getStandImg()

    local i=1

    local frames={}

    local animFrames=CCArray:create()

    for _,v in pairs(stand_img) do

         frames[i]=CCSpriteFrame:create(v,rect)
         animFrames:addObject(frames[i])

    end

    local animation =CCAnimation:createWithSpriteFrames(animFrames,0.1)

    local animate = CCAnimate:create(animation)

    return animate

end


local function makeName()

    local model=self.model

    local name=model:getName()

    local nametext = CCLableTTF:create(name,'微软雅黑',12)

    return nametext


end


function HeroPartView:BuildHero(status)



    local hero =CCSprite:create()

    local text = makeName()



    hero:addChild(text)

    text:setPosition(hero:getContentSize().width/2,hero:getContentSize().height/2)

    hero:runAction(CCRepeatForever:create(makeAnimate()))

    return runAciton


end







