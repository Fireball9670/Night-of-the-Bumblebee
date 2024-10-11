import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"
import "CoreLibs/timer"

import "assets"
import "sprites"
import "menu"

-- make pointers
local gfx <const> = playdate.graphics
local sprite <const> = gfx.sprite

local player = Player()
local particles = Particles()

-- init() runs once at game start
local function init()
    player:add()
    particles:add()

    showMenu()

    playdate.timer.performAfterDelay(1000, function ()
        -- start animation
        particles:startAnimation()
    end)

    playdate.timer.performAfterDelay(4000, function ()
        -- end anymation
        particles:endAnimation()
    end)

end

-- update() runs every frame
function playdate.update()
    -- update all sprites
    sprite.update()
    playdate.timer.updateTimers()

    if playdate.buttonJustPressed(playdate.kButtonA) then
        hideMenu()
    end

end

init()