scene = "menu"

local game = require('game')
fonts = {}
fonts.path = 'assets/fonts/content.ttf'
fonts.secondPath = 'assets/fonts/menuContent.ttf'
fonts.thirdPath = 'assets/fonts/gui.ttf'
fonts.fourPath = 'assets/fonts/normal.ttf'


fonts.score = love.graphics.newFont(fonts.path, 80)
fonts.option = love.graphics.newFont(fonts.thirdPath, 30)
fonts.title = love.graphics.newFont(fonts.fourPath, 50)
fonts.author = love.graphics.newFont(fonts.fourPath, 10)
menu = {}
menu.title = {}
menu.title.text = 'THE PONG'
menu.title.y = 100
menu.color = {}
menu.initialColor = {.5, .5, 1}
menu.hoverColor = {.1, .2, 2}

menu.option = {}


menu.option[1] = {}
menu.option[1].y = 240
menu.option[1].text = "Joueur vs Joueur"
menu.option[1].underlineColor = {.5, .5, 1}
menu.option[2] = {}
menu.option[2].y = 340
menu.option[2].text = "Bot vs Joueur"
menu.option[2].underlineColor = menu.initilalColor

menu.option[3] = {}
menu.option[3].y = 440
menu.option[3].text = "Quitter"
menu.option[3].underlineColor = menu.initilalColor
menu.option.underlineWidth = 50



function love.load()
    love.window.setTitle("The Pong - Développé par Lucarno")
    screen_width = love.graphics.getWidth()
    screen_height =  love.graphics.getHeight()
    cursor = {}
    cursor.hand = love.mouse.getSystemCursor('hand')
    cursor.arrow = love.mouse.getSystemCursor('arrow')

    game.load()
end

function love.update(dt)

game.update()
local mouseX =  love.mouse.getX()
local mouseY =  love.mouse.getY()

if scene == 'menu' then
    if mouseY >= menu.option[1].y and mouseY <= menu.option[1].y + 30 and mouseX > screen_width/2 - 150 and mouseX < screen_width/2 + 150 then
        menu.option[1].underlineColor = menu.hoverColor
        love.mouse.setCursor(cursor.hand)
    elseif mouseY >= menu.option[2].y and mouseY <= menu.option[2].y + 30 and mouseX > screen_width/2 - 150 and mouseX < screen_width/2 + 150 then
        menu.option[2].underlineColor = menu.hoverColor
        love.mouse.setCursor(cursor.hand)
    elseif mouseY >= menu.option[3].y and mouseY <= menu.option[3].y + 30 and mouseX > screen_width/2 - 150 and mouseX < screen_width/2 + 150 then
        menu.option[3].underlineColor = menu.hoverColor
        love.mouse.setCursor(cursor.hand)
    else
        for i, option in ipairs(menu.option) do
           menu.option[i].underlineColor = menu.initialColor
        end 
        love.mouse.setCursor(cursor.arrow)
    end
end
end

function love.draw()
    if scene ~= "game" then
        love.graphics.setColor(.2, .2, .2)
    end
    game.draw()
    love.graphics.setColor(1, 1, 1)
    if scene == "menu" then
        --title
        love.graphics.printf(menu.title.text, fonts.title, 0, menu.title.y, screen_width, 'center' )
        love.graphics.printf('Développé par Steven Lucarno DODDE', fonts.author, 0, 150, screen_width, 'center' )


        --options
        love.graphics.printf(menu.option[1].text, fonts.option, 0, menu.option[1].y, screen_width, 'center' )
        love.graphics.printf(menu.option[2].text, fonts.option, 0, menu.option[2].y, screen_width, 'center' )
        love.graphics.printf(menu.option[3].text, fonts.option, 0, menu.option[3].y, screen_width, 'center' )


        --UNDERLINE
        
          
        for i, option in ipairs(menu.option) do
            love.graphics.setColor(.5,.5,1)
            love.graphics.rectangle('fill', screen_width/2 - menu.option.underlineWidth/2, option.y + 40, menu.option.underlineWidth, 3, 3)
            love.graphics.setColor(1, 1, 1)
        end
       
    end
    
end

function love.keypressed(key)
    game.keypressed(key)
end

function love.mousepressed(mouseX, mouseY, button)
    if scene == 'menu' and button == 1 then
        if mouseY >= menu.option[1].y and mouseY <= menu.option[1].y + 30 and mouseX > screen_width/2 - 150 and mouseX < screen_width/2 + 150 then
            game.gamemode = 1
            reset()
            scene = 'game'
            love.mouse.setCursor(cursor.arrow)
        elseif mouseY >= menu.option[2].y and mouseY <= menu.option[2].y + 30 and mouseX > screen_width/2 - 150 and mouseX < screen_width/2 + 150 then
           game.gamemode = 2
           reset()
            scene = 'game'
            love.mouse.setCursor(cursor.arrow)
        elseif mouseY >= menu.option[3].y and mouseY <= menu.option[3].y + 30 and mouseX > screen_width/2 - 150 and mouseX < screen_width/2 + 150 then
          love.event.quit()

        end
    end
end