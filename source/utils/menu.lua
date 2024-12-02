local gfx <const> = playdate.graphics

local spriteTitle = gfx.sprite.new()
local spriteButton = gfx.sprite.spriteWithText("Press A to fly!", 400, 240)

local imageSpriteTitle = gfx.image.new(200, 120)

gfx.setFontFamily(gfx.getFont(gfx.font.kVariantBold))

-- draw text on image
gfx.pushContext(imageSpriteTitle)
gfx.drawTextAligned("Night of the Bumblebee", 100, 60, kTextAlignment.center)
gfx.popContext()

spriteTitle:setImage(imageSpriteTitle:scaledImage(2))

spriteTitle:moveTo(200, 100)
spriteButton:moveTo(200, 170)

function ShowMenu()
    spriteTitle:add()
    spriteButton:add()
end

function HideMenu()
    spriteTitle:remove()
    spriteButton:remove()
end