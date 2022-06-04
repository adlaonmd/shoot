local Title = {}

local button = require("scripts.button")
local playButton = button:new()

local titleFont
local titleText = "Shoot"

function Title:load()
    titleFont = love.graphics.newFont(64)
    playButton:load("Play", "game", 0, 48)
end

function Title:update(dt)

end

function Title:draw()
    love.graphics.setFont(titleFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print(titleText, love.graphics.getWidth() / 2 - titleFont:getWidth(titleText) / 2, love.graphics.getHeight() / 2 - titleFont:getHeight())

    playButton:draw()
end

function Title:mousepressed(x, y, button)
    playButton:mousepressed(x, y, button)
end

return Title
