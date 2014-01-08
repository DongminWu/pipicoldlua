
--main
--[[
require "AudioEngine" 
-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end]]
require 'scripts/Requires'
require 'scripts/RequireThings'
print('hello')


function main()
    LuaLog('Enter main()')

--
--    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
--    local origin = CCDirector:sharedDirector():getVisibleOrigin()
--
--
--    print(tostring(visibleSize.width))
--
--
--
--
--    -----初始化 动画 start
--    local rect=CCRectMake(0,0,128,128)
--
--    local frame0=CCSpriteFrame:create("1.png",rect)
--    local frame1=CCSpriteFrame:create("2.png",rect)
--    local frame2=CCSpriteFrame:create("3.png",rect)
--    local frame3=CCSpriteFrame:create("4.png",rect)
--    local frame4=CCSpriteFrame:create("5.png",rect)
--    local frame5=CCSpriteFrame:create("6.png",rect)
--    local frame6=CCSpriteFrame:create("7.png",rect)
--    local frame7=CCSpriteFrame:create("8.png",rect)
--    local frame8=CCSpriteFrame:create("9.png",rect)
--    local frame9=CCSpriteFrame:create("10.png",rect)
--    local frame10=CCSpriteFrame:create("11.png",rect)
--
--
--    --用create来创建
--    local animFrames=CCArray:create()
--
--    animFrames:addObject(frame0)
--    animFrames:addObject(frame1)
--    animFrames:addObject(frame2)
--    animFrames:addObject(frame3)
--    animFrames:addObject(frame4)
--    animFrames:addObject(frame5)
--    animFrames:addObject(frame6)
--    animFrames:addObject(frame7)
--    animFrames:addObject(frame8)
--    animFrames:addObject(frame9)
--    animFrames:addObject(frame10)
--
--    local animation =CCAnimation:createWithSpriteFrames(animFrames,0.1)
--
--    local animate = CCAnimate:create(animation)
--
--    ----初始化 动画 end
--
--    ----初始化人物精灵start
--
--    local hero = CCSprite:createWithSpriteFrame(frame0)
--
--    hero:setPosition(visibleSize.width/2,visibleSize.height/2)
--
--    hero:runAction(CCRepeatForever:create(animate))    --无限循环
--
--    ----初始化人物精灵end

    local layer=CCLayer:create() --建立场景


    local hero2ins=HeroPartView:getInstance()

    hero2ins:onEnter()

    local hero2=hero2ins:BuildHero()


    hero2:setPosition(visibleSize.width/2,visibleSize.height/2)

--    hero2:ChangeAction()
    layer:addChild(hero2)



    ----添加场景 start
    local sceneGame = CCScene:create()
    sceneGame:addChild(layer)

    CCDirector:sharedDirector():runWithScene(sceneGame)
    ----添加场景 end


----    print('hello, welcome to my world\n')
----    local ss=HeroModel:getInstance()
----    showHeroModel()
--
--    event=Event:getInstance()
--    event:addEvent('TextGameMainView')
--    event:addListener('TextGameMainView',TextGameMainView)
----    event:deleteListener('aaa',testevent)
----    event:addListener('aaa','ccc')
----    print (EventMap['aaa'])
----    event:deleteListener('aaa','ccc')
----    print (EventMap['aaa']['ccc'])
----    for k,v in pairs(EventMap['aaa']) do
----
----
----        print (k,v)
----
----
----    end
--
--    event:sendEvent('TextGameMainView','hello world')


end


function readCommandLine()

    print('----->CMD$:')
    local readCMD=io.read()

    return readCMD
end


function showHeroModel()

    local s1 = HeroModel:getInstance()

    print('HeroModel name:'..s1:getName())



end

main()


