local Accuracy = {}

local accuracyFont

function Accuracy:load()
    accuracyFont = love.graphics.newFont(24)

    self.x = 0
    self.y = accuracyFont:getHeight()
    self.clicks = 0
    self.percentage = 0
end

function Accuracy:update(dt)

end

function Accuracy:draw()
    love.graphics.setFont(accuracyFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Accuracy: " .. string.format("%.2f", self.percentage) .. "%", self.x, self.y)
end

function Accuracy:setAccuracy(score)
    self.clicks = self.clicks + 1
    self.percentage = (score.value / self.clicks) * 100
end

return Accuracy
