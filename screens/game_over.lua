local GameOver = {}

local score = require("scripts.score")
local accuracy = require("scripts.accuracy")
local button = require("scripts.button")

local gameOverText = "Game Over"
local scoreText
local accuracyText
local gameOverFont
local detailsFont

local titleButton = button:new()
local playAgainButton = button:new()

function GameOver:load()
    scoreText = "Score: " .. (score.value or 0)
    accuracyText = "Accuracy: " .. string.format("%.2f", accuracy.percentage or 0) .. "%"

    gameOverFont = love.graphics.newFont(64)
    detailsFont = love.graphics.newFont(32)

    titleButton:load("Home", "title", 0, 128)
    playAgainButton:load("Play Again", "game", 0, 192)
end

function GameOver:update(dt)

end

function GameOver:draw()
    love.graphics.setFont(gameOverFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print(gameOverText, love.graphics.getWidth() / 2 - gameOverFont:getWidth(gameOverText) / 2, love.graphics.getHeight() / 3)

    love.graphics.setFont(detailsFont)
    love.graphics.print(scoreText, love.graphics.getWidth() / 2 - detailsFont:getWidth(scoreText) / 2, love.graphics.getHeight() / 2 - detailsFont:getHeight() / 2)
    love.graphics.print(accuracyText, love.graphics.getWidth() / 2 - detailsFont:getWidth(accuracyText) / 2, love.graphics.getHeight() / 2 + detailsFont:getHeight() / 2)

    titleButton:draw()
    playAgainButton:draw()
end

function GameOver:mousepressed(x, y, button)
    titleButton:mousepressed(x, y, button)
    playAgainButton:mousepressed(x, y, button)
end

return GameOver
