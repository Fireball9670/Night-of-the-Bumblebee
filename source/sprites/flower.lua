local gfx <const> = playdate.graphics

--- @class Flower : playdate.graphics.sprite
Flower = {}
class("Flower").extends(gfx.sprite)

Flower.spawnRate = 0.05

-- make new sprite
local imageSpriteFlower = gfx.imagetable.new(assets.flower)

function Flower:init()
    -- create the flower
    Flower.super.init(self, imageSpriteFlower[1])

    --create animation loop
    self.animationLoop = gfx.animation.loop.new(500, imageSpriteFlower)

    self:moveTo(300, 20)
    self:setCollideRect(0, 0, self:getSize())

    self.lifeTimer = playdate.timer.new(5000, self.destroy, self)
end

function Flower:destroy()
    self:remove()
end

function Flower:update()
    -- update the flower
    self:setImage(self.animationLoop:image())
end