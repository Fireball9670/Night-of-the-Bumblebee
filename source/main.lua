import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"
import "CoreLibs/timer"
import "CoreLibs/animation"

import "assets"
import "sprites"
import "utils"

-- make pointers
local gfx <const> = playdate.graphics
local sprite <const> = gfx.sprite

-- classes
local player = Player()
local particles = Particles()
--local flower = Flower()
local flowerSpawner = Spawner(Flower, Flower.spawnRate)

-- init() runs once at game start
local function init()
    playdate.display.setInverted(true)
    ShowScore()
    ShowMenu()

    --flower:add()

    player:add()
    particles:add()
    player:setParticlesSprite(particles)
    flowerSpawner:start()
end

-- update() runs every frame
function playdate.update()
    flowerSpawner:update()
    -- update all sprites

    sprite.update()
    playdate.timer.updateTimers()

    if playdate.buttonJustPressed(playdate.kButtonA) then
        HideMenu()
    end

--    if playdate.buttonJustPressed(playdate.kButtonB) then
--        NewScore(100)
--    end
    DrawScore()
end

init()