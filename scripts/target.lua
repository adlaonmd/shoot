local Target = {}

local score = require("scripts.score")
local accuracy = require("scripts.accuracy")

function Target:load()
    self:generateRandomTarget()
end

function Target:update(dt)
end

function Target:draw()
    love.graphics.setColor(255, 255, 255)
    if self:mouseOnTarget(love.mouse.getX(), love.mouse.getY(), self.x, self.y) then
        love.graphics.setColor(255, 0, 0)
    end
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Target:mousepressed(x, y, button)
    if button == 1 then
        if self:mouseOnTarget(x, y, self.x, self.y) then
            score:increaseScore(1)
            self:generateRandomTarget()
        end

        accuracy:setAccuracy(score)
    end
end

function Target:generateRandomTarget()
    local min_radius = 16
    local max_radius = 64
    local paddingMultiplier = 2

    self.radius = love.math.random(min_radius, max_radius)
    self.x = love.math.random(self.radius * paddingMultiplier, love.graphics.getWidth() - self.radius * paddingMultiplier)
    self.y = love.math.random(self.radius * paddingMultiplier, love.graphics.getHeight() - self.radius * paddingMultiplier)
end

function Target:distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function Target:mouseOnTarget(mouseX, mouseY, targetX, targetY)
    local mouseToTarget = self:distanceBetween(mouseX, mouseY, targetX, targetY)
    if mouseToTarget <= self.radius then
        return true
    end

    return false
end

return Target
