local Button = {}
Button.__index = Button

local buttonFont

function Button:new()
    local instance = setmetatable({}, Button)
    return instance
end

function Button:load(text, destination, x, y, width, height)
    buttonFont = love.graphics.newFont(32)

    self.text = text
    self.destination = destination
    self.width = width or 200
    self.height = height or buttonFont:getHeight() + 16
    self.x = love.graphics.getWidth() / 2 - self.width / 2 + x
    self.y = love.graphics.getHeight() / 2 - self.height / 2 + y
end

function Button:update(dt)
end

function Button:draw()
    love.graphics.setColor(255, 255, 255)
    if self:onHover() then
        love.graphics.setColor(0, 255, 255)
    end
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    love.graphics.setFont(buttonFont)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(self.text, self.x + self.width / 2 - buttonFont:getWidth(self.text) / 2, self.y + self.height / 2 - buttonFont:getHeight() / 2)
end

function Button:mousepressed(x, y, button)
    if button == 1 then
        if self:onHover() then
            ScreenManager:changeScreen(self.destination)
        end
    end
end

function Button:onHover()
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()

    if mouseX >= self.x and mouseX <= self.x + self.width and mouseY >= self.y and mouseY <= self.y + self.height then
        return true
    end

    return false
end

return Button
