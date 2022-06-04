local Timer = {}

local timerFont
local getReadyText = "Get ready..."
local goText = "Go!"
local timesUpText = "Times Up!"

function Timer:load()
    timerFont = love.graphics.newFont(64)

    self.gameStart = false
    self.gameEnd = false
    self.gameOver = false
    self.freezeTime = 5
    self.playTime = 4
    self.endTime = 3
end

function Timer:update(dt)
    if self.freezeTime <= 0 then
        self.gameStart = true

        if self.playTime <= 0 then
            self.gameEnd = true

            if self.endTime <= 0 then
                self.gameOver = true
            else
                self.endTime = self.endTime - dt
            end
        else
            self.playTime = self.playTime - dt
        end
    else
        self.freezeTime = self.freezeTime - dt
    end
end

function Timer:draw()
    love.graphics.setFont(timerFont)
    love.graphics.setColor(255, 255, 255)

    if self.gameStart then
        if self.gameEnd then
            love.graphics.print(timesUpText, love.graphics.getWidth() / 2 - timerFont:getWidth(timesUpText) / 2, love.graphics.getHeight() / 2 - timerFont:getHeight() / 2)
        else
            love.graphics.print(math.floor(self.playTime), love.graphics.getWidth() - timerFont:getWidth(math.floor(self.playTime)), 0)
        end
    else
        if self.freezeTime >= 4 then
            love.graphics.print(getReadyText, love.graphics.getWidth() / 2 - timerFont:getWidth(getReadyText) / 2, love.graphics.getHeight() / 2 - timerFont:getHeight() / 2)
        elseif self.freezeTime <= 1 then
            love.graphics.print(goText, love.graphics.getWidth() / 2 - timerFont:getWidth(goText) / 2, love.graphics.getHeight() / 2 - timerFont:getHeight() / 2)
        else
            love.graphics.print(math.floor(self.freezeTime), love.graphics.getWidth() / 2 - timerFont:getWidth(math.floor(self.freezeTime)) / 2, love.graphics.getHeight() / 2 - timerFont:getHeight() / 2)
        end
    end
end

return Timer
