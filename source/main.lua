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
local flowerSpawner = Spawner(Flower, Flower.spawnRate)
local hornet = Hornet()

-- init() runs once at game start
local function init()
    playdate.display.setInverted(true)
    ShowMenu()
end

function gameStart()
    HideMenu()
    gfx.sprite.removeAll()
    ScoreReset()
    ShowScore()
    hornet:add()
    flowerSpawner:start()
    player:add()
end

function gameEnd()
    ShowMenu()

    player:remove()
    flowerSpawner:stop()
    hornet:remove()
end

-- update() runs every frame
function playdate.update()
    flowerSpawner:update()
    -- update all sprites

    sprite.update()
    playdate.timer.updateTimers()

    if IsMenuShown() and playdate.buttonJustPressed(playdate.kButtonA) then
        gameStart()
    end

    DrawScore()

    if not IsMenuShown() and player:isDead() then
        gameEnd()
    end
end

init()