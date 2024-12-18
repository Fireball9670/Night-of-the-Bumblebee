local gfx <const> = playdate.graphics

--- @class Player : playdate.graphics.sprite
Player = {}
class("Player").extends(gfx.sprite)

-- make new sprite
local imageSpritePlayer = gfx.image.new(assets.bee)

local velocity = 0

function Player:init()
    -- create the player
    Player.super.init(self, imageSpritePlayer)

    Player.instance = self

    self:setCollideRect(0, 0, self:getSize())
end

function Player:add()
    Player.super.add(self)

    self:moveTo(200, 60)
    velocity = 0
    self._isDead = false
end

function Player:collisionResponse(other)
    return gfx.sprite.kCollisionTypeOverlap
end

function Player:onDeath()
    self._isDead = true
end

function Player:isDead()
    return self._isDead
end


function Player:update()
    -- update the player
    Player.super.update(self)

    -- rotate sprite based on the rotation of the Crank[tm]
    local crankPosition = playdate.getCrankPosition()
    local crankPositionRadians = math.rad(crankPosition)
    self:setRotation(crankPosition)

    -- add velocity when A is pressed
    if playdate.buttonIsPressed(playdate.kButtonA) then
        velocity = 5
    else
        velocity = 0
    end

    -- calculate the x and y velocity
    local vX,vY = GetAngleComponents(crankPositionRadians, velocity)

    local _, _, collisions = self:moveWithCollisions(self.x + vX, self.y + vY)

    for _, collision in pairs(collisions) do
        local other = collision.other

        if getmetatable(other).class == Flower then
            other:destroy()
            NewScore(100)
        end

        if getmetatable(other).class == Hornet then
            self:onDeath()
        end
    end

    -- wrap around the screen
    self:moveTo(self.x % 400, self.y % 240)
end