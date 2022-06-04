local Game = {}

local target = require("scripts.target")
local score = require("scripts.score")
local accuracy = require("scripts.accuracy")
local timer = require("scripts.timer")

function Game:load()
    timer:load()
    score:load()
    accuracy:load()
    target:load()
end

function Game:update(dt)

    timer:update(dt)

    if timer.gameStart and not timer.gameEnd then
        score:update(dt)
        accuracy:update(dt)
        target:update(dt)
    elseif timer.gameOver then
        ScreenManager:changeScreen("game_over")
    end
end

function Game:draw()
    timer:draw()

    if timer.gameStart and not timer.gameEnd then
        score:draw()
        accuracy:draw()
        target:draw()
    end
end

function Game:mousepressed(x, y, button)
    if timer.gameStart and not timer.gameEnd then
        target:mousepressed(x, y, button)
    end
end

return Game
