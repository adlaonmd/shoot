local Score = {}

local scoreFont

function Score:load()
    scoreFont = love.graphics.newFont(24)

    self.x = 0
    self.y = 0
    self.value = 0

end

function Score:update(dt)

end

function Score:draw()
    love.graphics.setFont(scoreFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Score: " .. self.value, self.x, self.y)
end

function Score:increaseScore(score)
    self.value = self.value + score
end

return Score
