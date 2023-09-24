scene = "game"

local game = require('game')

function love.load()
    screen_width = love.graphics.getWidth()
    screen_height =  love.graphics.getHeight()

    game.load()
end

function love.update(dt)

game.update()
end

function love.draw()
    game.draw()
end

function love.keypressed(key)
    game.keypressed()
end