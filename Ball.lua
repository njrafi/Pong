Ball = Class {}

function Ball:init(x, y, widht, height)
    self.x = x
    self.y = y
    self.width = widht
    self.height = height

    self.dx = math.random(2) == 1 and 100 or -100
    self.dy = math.random(-50, 50)
end

function Ball:collides(paddle)

    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end
    
    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end

    return true
end

function Ball:collided()
    self.dx = -self.dx * 1.03
    if (self.dx > 0) then
        self.x = self.x + 5
    else
        self.x = self.x - 5
    end

    if (self.dy > 0) then
        self.dy = -math.random(10, 150)
    else
        self.dy = math.random(10, 150)
    end

end
function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGHT / 2 + self.height / 2

    self.dx = math.random(2) == 1 and 100 or -100
    self.dy = math.random(-50, 50)
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Ball:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
