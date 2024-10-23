local gfx <const> = playdate.graphics

class("Player").extends(gfx.sprite)

-- make new sprite
local imageSpritePlayer = gfx.image.new(assets.bee)

local velocity = 0

function Player:init()
    -- create the player
    Player.super.init(self, imageSpritePlayer)

    self:moveTo(200, 60)

    velocity = 0
end

function Player:setParticlesSprite(particlesSprite)
    assert(type(particlesSprite) == "table")
    self.particlesSprite = particlesSprite
end

function Player:update()
    -- update the player
    Player.super.update(self)

    -- rotate sprite based on the rotation of the Crank[tm]
    local crankPosition = playdate.getCrankPosition()
    self:setRotation(crankPosition)

    -- add velocity when A is pressed
    if playdate.buttonIsPressed(playdate.kButtonA) then
        velocity = 5
    else
        velocity = 0
    end

    -- lua needs angles in radians
    local crankPositionRadians = math.rad(crankPosition)
    -- calculate the x and y velocity
    local vX,vY = velocity * math.cos(crankPositionRadians), velocity * math.sin(crankPositionRadians)

    if self.setParticlesSprite then
        local distanceFromCenter = -33

        local x = self.x + distanceFromCenter * math.cos(crankPositionRadians)
        local y = self.y + distanceFromCenter * math.sin(crankPositionRadians)

        self.particlesSprite:moveTo(x, y)

        self.particlesSprite:setRotation(crankPosition)

        if playdate.buttonJustPressed(playdate.kButtonA) then
            self.particlesSprite:startAnimation()
        end
        if playdate.buttonJustReleased(playdate.kButtonA) then
            self.particlesSprite:endAnimation()
        end
    end



    self:moveBy(vX, vY)

    -- wrap around the screen
    self:moveTo(self.x % 400, self.y % 240)
end