import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"
import "CoreLibs/timer"

import "assets"
import "sprites"
import "menu"
import "score"

-- make pointers
local gfx <const> = playdate.graphics
local sprite <const> = gfx.sprite

local player = Player()
local particles = Particles()

-- init() runs once at game start
local function init()
    ShowScore()
    ShowMenu()

    player:add()
    particles:add()
    player:setParticlesSprite(particles)
end

-- update() runs every frame
function playdate.update()
    -- update all sprites
    sprite.update()
    playdate.timer.updateTimers()

    if playdate.buttonJustPressed(playdate.kButtonA) then
        HideMenu()
    end

    if playdate.buttonJustPressed(playdate.kButtonB) then
        NewScore(100)
    end
    DrawScore()
end

init()