scene = "game"

local game = require('game')
fonts = {}
fonts.path = 'assets/fonts/content.ttf'
fonts.secondPath = 'assets/fonts/menuContent.ttf'
fonts.thirdPath = 'assets/fonts/gui.ttf'
fonts.fourPath = 'assets/fonts/menuTitle.ttf'
fonts.fourPath = 'assets/fonts/normal.ttf'


fonts.score = love.graphics.newFont(fonts.path, 80)
fonts.option = love.graphics.newFont()
fonts.title = love.graphics.newFont()

menu = {}
menu.title = {}
menu.title.text = = 'THE PONG'
menu.title.y = 100

menu.option = {}

menu.option[1] = {}
menu.option[2] = {}
menu.option[3] = {}


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
    game.keypressed(key)
end