local gfx <const> = playdate.graphics

local imageSpriteHornet = gfx.image.new(assets.hornet)

local velocity

class("Hornet").extends(gfx.sprite)

function Hornet:init()
    Hornet.super.init(self, imageSpriteHornet)
    self:setCollideRect(0, 0, self:getSize())
end

function Hornet:add()
    Hornet.super.add(self)
    self:moveTo(200, 120)
end

function Hornet:update()
    -- Increase speed for each score milestone
    if CurrentScore and CurrentScore>0 then
        velocity = 1 + CurrentScore//1000
    else
        velocity = 1
    end

    -- Get player
    local player = Player.instance
    if player and not player:isDead() then
        -- Find line to player
        local targetX = player.x
        local targetY = player.y
        local targetAngle = math.atan(targetY-self.y, targetX-self.x)
        local velocityX, velocityY = GetAngleComponents(targetAngle, velocity)
        
        if (targetX-self.x) < 0 then
            imageSpriteHornet = self:setImageFlip(playdate.graphics.kImageFlippedX, true)
        else
            imageSpriteHornet = self:setImageFlip(playdate.graphics.kImageUnflipped, true)
        end

        -- Move to player
        self:moveBy(velocityX, velocityY)
    end

end