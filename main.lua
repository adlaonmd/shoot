ScreenManager = require("screens.screen_manager")

local game = require("screens.game")

function love.load()
    love.window.setMode(1280, 720, {})
    love.window.setTitle("Shoot")

    ScreenManager:load()
end

function love.update(dt)
    ScreenManager:update(dt)
end

function love.draw()
    ScreenManager:draw()

    love.graphics.setBackgroundColor(18 / 255, 18 / 255, 18 / 255)
end

function love.mousepressed(x, y, button)
    ScreenManager:mousepressed(x, y, button)
end
