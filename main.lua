require("vector")
require("vehicle")
require("path")

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    path = Path:create({Vector:create(0, 150),
                        Vector:create(200, 200),
                        Vector:create(400, 250),
                        Vector:create(600, 220),
                        Vector:create(800, 170)})

    vehicle1 = Vehicle:create(400, 400)
    vehicle2 = Vehicle:create(200, 100)
    vehicle2.maxSpeed = 8
    vehicle2.maxForce = 2
end

function love.update(dt)
    x, y = love.mouse.getPosition()
    mouse = Vector:create(x, y)
    -- vehicle1:seek(mouse)
    vehicle1:followPath(path)
    vehicle1:update()
    vehicle1:borders()
    vehicle2:followPath(path)
    vehicle2:update()
    vehicle2:borders()
end

function love.draw()
    path:draw()
    vehicle1:draw()
    vehicle2:draw()
end