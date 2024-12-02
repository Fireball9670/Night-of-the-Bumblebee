local gfx <const> = playdate.graphics

local spriteScore = gfx.sprite.new()
local imageSpriteScore = gfx.image.new(200, 120)

local scoreFont = playdate.graphics.font.new("assets/score")

local currentScore = 0

spriteScore:moveTo(10, 10)

function ShowScore()
    spriteScore:add()
end

function NewScore(increase)
    currentScore = currentScore + increase
end

function DrawScore()
    gfx.setFontFamily(scoreFont)

    gfx.pushContext(imageSpriteScore)
    gfx.clear()
    gfx.drawTextAligned("Score:"..tostring(currentScore), 100, 60, kTextAlignment.left)
    gfx.popContext()

    spriteScore:setImage(imageSpriteScore:scaledImage(2))
end