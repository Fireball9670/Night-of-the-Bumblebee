local gfx <const> = playdate.graphics

local imageTable, message = gfx.imagetable.new(assets.particles)
assert(imageTable, message)

-- animation states

local animationStates <const> = {
    pre = 1,
    loop = 2,
    post = 3,
    none =4
}

local animationIndexes <const> = {
    [animationStates.pre] = {1, 10},
    [animationStates.loop] = {11, 33},
    [animationStates.post] = {34, 44}
}

--

class("Particles").extends(gfx.sprite)

function Particles:init()
    Particles.super.init(self, imageTable[self.index])

    self:moveTo(50, 120)
    
    self.index = 1

    self.state = animationStates.none
end

function Particles:startAnimation()
    self.state = animationStates.pre
end

function Particles:endAnimation()
    self.state = animationStates.post
end

function Particles:update()
    if self.state == animationStates.none then
        return
    end

    local indexStart, indexEnd = table.unpack(animationIndexes[self.state])

    -- Change states based on state and index

    if self.state == animationStates.pre and self.index == indexEnd then
        self.state = animationStates.loop
    end

    if self.state == animationStates.post and self.index == indexEnd then
        self.state = animationStates.none
    end

    -- Loop through image table


    if self.index < indexStart or self.index > indexEnd then
        self.index = indexStart
    else
        self.index += 1
    end

    self:setImage(imageTable[self.index])
end