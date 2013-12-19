require 'GameInit'



--hero class

local Object = require 'Oop.Object'
--local Class  = require 'Oop.Class'

HeroModel=Object:subclass('HeroModel');
--HeroModel={}



function HeroModel:initialize()

    local o = {}
    setmetatable(o,self)
    self.__index =self
    self:init()
    return o
end
--TODO !!!!
local instance  ----为什么要这样写呢。。
function HeroModel.class:getInstance()     ----.class is important!!!!!!!
    LuaLog('HeroModel:getInstance()')
    if instance==nil then
        instance=self:new()
    end
    return instance
end


function HeroModel:getName()

    local name=self.name
    return name;
end

--HeroModel:new()





function HeroModel:init()

    self.name='wdm'          --名字
    self.direction={}     --人物朝向
    self.runStatus={}     --人物的行走状态
    self.bodyStatus={}    --人物的身体状态
    self.attackNum=0      --人物的攻击值
    self.defensNnum=0     --人物的防御值
    self.runSpeedNum=0    --人物的移动速度
    self.positionX=0      --人物的坐标X
    self.positionY=0      --人物的坐标Y


    self.runFrameNum=0    --人物的跑动帧数
    self.imageUrl={}      --人物的图像资源路径
    self.soundUrl={}      --人物的音频资源路径


end


--function
