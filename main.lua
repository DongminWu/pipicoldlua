
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

require 'GameInit'
require 'HeroModel'
require 'Requires'
require 'Event'

local function main()
    LuaLog('Enter main()')
    print('hello, welcome to my world\n')
    local ss=HeroModel:getInstance()
    showHeroModel()

    event=Event:getInstance()
    event:addEvent('aaa')
    event:addListener('aaa',testevent)
--    event:addListener('aaa','ccc')
--    print (EventMap['aaa']['bbb'])
--    event:deleteListener('aaa','ccc')
--    print (EventMap['aaa']['ccc'])
--    for k,v in pairs(EventMap['aaa']) do
--
--
--        print (k,v)
--
--
--    end

    event:sendEvent('aaa')


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


