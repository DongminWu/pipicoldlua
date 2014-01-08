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


require 'scripts/Requires'
require 'scripts/View'

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
    LuaLog('HeroPartView:onEnter()')
    self:getEvent()
    self.heromodel = HeroModel:getInstance()



end


function HeroPartView:getEvent()
    self.event=Event:getInstance()

end



 function HeroPartView:makeAnimate(state)   --输入值：state=判断是走路还是站立等状态

     --把当载入hero的时候把它的所有动画都载入进来

    local rect=CCRectMake(0,0,128,128)

    --local stand_img = self.model:getStandImg()



    --TODO：stand anim start

    local i=1
    local framesStand={}
    local animFramesStand=CCArray:create()


    for _,v in pairs(self.heromodel.stand_img) do

         framesStand[i]=CCSpriteFrame:create(v,rect)
         animFramesStand:addObject(framesStand[i])

    end

    local animationStand =CCAnimation:createWithSpriteFrames(animFramesStand,0.1)

    self.animateStand = CCAnimate:create(animationStand)
   --stand anim end


    --TODO:walk forward anim start
    i=1

    local framesWalkForward={}
    local animFramesWalkForward=CCArray:create()


    for _,v in pairs(self.heromodel.walk_forward_img) do

        framesWalkForward[i]=CCSpriteFrame:create(v,rect)
        animFramesWalkForward:addObject(framesWalkForward[i])

    end

    local animationWalkForward =CCAnimation:createWithSpriteFrames(animFramesWalkForward,0.1)

    self.animateWalkForward = CCAnimate:create(animationWalkForward)

    --walk forward anim end



    --TODO:walk back anim start
    i=1

    local framesWalkBack={}
    local animFramesWalkBack=CCArray:create()


    for _,v in pairs(self.heromodel.walk_back_img) do

        framesWalkBack[i]=CCSpriteFrame:create(v,rect)
        animFramesWalkBack:addObject(framesWalkBack[i])

    end

    local animationWalkBack =CCAnimation:createWithSpriteFrames(animFramesWalkBack,0.1)

    self.animateWalkBack = CCAnimate:create(animationWalkBack)

    --walk back anim end



   --TODO 根据不同的选择返回不同的不同的动画

    if state=='stand' then
        return self.animateStand
    elseif state=='walk_forward' then
        return self.animateWalkForward
    elseif state=='walk_back' then
        return self.animateWalkBack
    end


end


function HeroPartView:makeName()

    local model=self.heromodel

    local name=model:getName()

    local nametext = CCLabelTTF:create(name,'fonts/fangzheng.ttf',12)

    return nametext


end


function HeroPartView:BuildHero()
    LuaLog('HeroPartView:BuildHero()')


    self.heroPart =CCSprite:create()

    self.heroPartNameText = self:makeName()



    self.heroPart:addChild(self.heroPartNameText)


    self.heroPartNameText:setPosition(64,0)
    local makeanimate=self:makeAnimate('stand')
    local action=CCRepeatForever:create(makeanimate)
    self.heroPart:runAction(action)
    return self.heroPart


end


function HeroPartView:ChangeAction(action)

    LuaLog('HeroPartView:ChangeAction()')
    self.heroPart:runAction(CCRepeatForever:create(self.animateWalkForward))



end







