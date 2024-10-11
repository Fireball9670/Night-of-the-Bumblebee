import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"

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
end

-- update() runs every frame
function playdate.update()
    -- update all sprites
    sprite.update()

    if playdate.buttonJustPressed(playdate.kButtonA) then
        hideMenu()
    end

end

init()