require 'GameInit'



--hero class

require 'Model'
--local Class  = require 'Oop.Class'

HeroModel=Model:subclass('HeroModel');
--HeroModel={}



function HeroModel:initialize()
    LuaLog('HeroModel:initialize()')
--    --[[local o = {}
--    setmetatable(o,self)
--    self.__index =self]]


    self:init()
    return o
end
--TODO !!!!

function HeroModel.class:getInstance()     ----.class is important!!!!!!!
    LuaLog('HeroModel:getInstance()')

    if HeroModel_instance==nil then
        HeroModel_instance=HeroModel:new()
    end
    return  HeroModel_instance
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

    self.myHP=100



    self.stand_img={'1.png',
                   '2.png',
                   '3.png',
                   '4.png',
                   '5.png',
                   '6.png',
                   '7.png',
                   '8.png',
                   '9.png',
                   '10.png',
                   '11.png',

    }

end




function HeroModel:getName()

    return self.name

end



function HeroModel:getHP()

    return self.myHP

end


function HeroModel:getStandImg()

    return self.stand_img
end

