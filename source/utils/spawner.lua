--- @class Spawner : playdate.graphics.sprite
Spawner = {}
class("Spawner").extends()

function Spawner:init(spriteClass, spawnRate)
    self.spriteClass = spriteClass
    self.spawnRate = spawnRate

    self.isActive = false
end

function Spawner:start()
    self.isActive = true
end

function Spawner:stop()
    self.isActive = false
end

function Spawner:update()
    if not self.isActive then
        return
    end

    -- should sprite be spawned
    if math.random() < self.spawnRate then
        -- spawn sprite

        local sprite = self.spriteClass()

        -- display sprite
        sprite:moveTo(math.random(0, 400), math.random(0, 240))
        sprite:add()
    end
end