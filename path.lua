Path = {}
Path.__index = Path

function Path:create(points, d)
    local path = {}
    setmetatable(path, Path)

    path.points = points
    path.d = 20 or d

    return path
end

function Path:draw()

    local r, g, b, a = love.graphics.getColor()

    love.graphics.setLineWidth(self.d)
    love.graphics.setColor(0.31, 0.31, 0.31, 0.7)

    love.graphics.circle("fill", self.points[1].x, self.points[1].y, self.d / 2)

    local prev = self.points[1]
    for current=2, #self.points do
    
        love.graphics.setColor(0.31, 0.31, 0.31, 0.7)

        love.graphics.setLineWidth(self.d)
        love.graphics.line(prev.x, prev.y, self.points[current].x, self.points[current].y)

        love.graphics.setBlendMode("replace")
        love.graphics.circle("fill", self.points[current].x, self.points[current].y, self.d / 2)
        
        love.graphics.setColor(0, 0, 0, 0.7)
        love.graphics.setLineWidth(self.d / 10)
        love.graphics.line(prev.x, prev.y, self.points[current].x, self.points[current].y)

        prev = self.points[current]
    end

    love.graphics.setColor(r, g, b, a)
end