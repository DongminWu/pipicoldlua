require 'scripts/GameInit'



--hero class

require 'scripts/Model'
--local Class  = require 'Oop/Class'

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



    self.stand_img={
                   'images/reimu/stand/1.png',
                   'images/reimu/stand/2.png',
                   'images/reimu/stand/3.png',
                   'images/reimu/stand/4.png',
                   'images/reimu/stand/5.png',
                   'images/reimu/stand/6.png',
                   'images/reimu/stand/7.png',
                   'images/reimu/stand/8.png',
                   'images/reimu/stand/9.png',
                   'images/reimu/stand/10.png',
                   'images/reimu/stand/11.png',

    }

    self.walk_forward_img={
        'images/reimu/walk_forward/1.png',
        'images/reimu/walk_forward/2.png',
        'images/reimu/walk_forward/3.png',
        'images/reimu/walk_forward/4.png',
        'images/reimu/walk_forward/5.png',
        'images/reimu/walk_forward/6.png',
        'images/reimu/walk_forward/7.png',

    }

    self.walk_back_img={
        'images/reimu/walk_back/1.png',
        'images/reimu/walk_back/2.png',
        'images/reimu/walk_back/3.png',
        'images/reimu/walk_back/4.png',
        'images/reimu/walk_back/5.png',
        'images/reimu/walk_back/6.png',
        'images/reimu/walk_back/7.png',
        'images/reimu/walk_back/8.png',
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

function HeroModel.getWalkForward()
    return self.walk_forward
end

function HeroModel.getWalkBack()
    return self.walk_back
end

