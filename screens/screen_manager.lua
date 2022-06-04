local ScreenManager = {}

function ScreenManager:load()
    self:changeScreen("title")
end

function ScreenManager:update(dt)
    if Screen.update then Screen:update(dt) end
end

function ScreenManager:draw()
    if Screen.draw then Screen:draw() end
end

function ScreenManager:keypressed(key)
    if Screen.keypressed then Screen:keypressed(key) end
end

function ScreenManager:mousepressed(x, y, button)
    if Screen.mousepressed then Screen:mousepressed(x, y, button) end
end

function ScreenManager:changeScreen(nextScreen)
    Screen = require("screens." .. nextScreen)
    if Screen.load then Screen:load() end
end

return ScreenManager
