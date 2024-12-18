local gfx <const> = playdate.graphics

local spriteScore = gfx.sprite.new()
local imageSpriteScore = gfx.image.new(200, 120)

local scoreFont = playdate.graphics.font.new("assets/score")

CurrentScore = 0

spriteScore:moveTo(10, 10)

function ShowScore()
    spriteScore:add()
end

function NewScore(increase)
    CurrentScore = CurrentScore + increase
end

function ScoreReset()
    CurrentScore = 0
end

function DrawScore()
    gfx.setFontFamily(scoreFont)

    gfx.pushContext(imageSpriteScore)
    gfx.clear()
    gfx.drawTextAligned("Score:"..tostring(CurrentScore), 100, 60, kTextAlignment.left)
    gfx.popContext()

    spriteScore:setImage(imageSpriteScore:scaledImage(2))
end