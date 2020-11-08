Paddle = Class {}

function Paddle:init(x, y, widht, height)
    self.x = x
    self.y = y
    self.width = widht
    self.height = height
    self.dy = 0
end

function Paddle:update(dt)
    self.y = self.y + self.dy * dt
    self.y = math.max(0, self.y)
    self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y)
end

function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
