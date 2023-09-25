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
fonts.rules = love.graphics.newFont(fonts.path, 30)
menu = {}
menu.title = {}
menu.title.text = 'THE PONG'
menu.title.y = 80
menu.color = {}
menu.initialColor = {.5, .5, 1}
menu.hoverColor = {.1, .2, 2}

menu.option = {}


menu.option = {}

menu.option[1] = {}
menu.option[1].y = 180
menu.option[1].text = "Joueur vs Joueur"
menu.option[1].underlineColor = {.5, .5, 1}


menu.option[2] = {}
menu.option[2].y = 250
menu.option[2].text = "Bot vs Joueur"
menu.option[2].underlineColor = menu.initialColor


menu.option[3] = {}
menu.option[3].y = 320
menu.option[3].text = "Regles du jeu"
menu.option[3].underlineColor = menu.initialColor


menu.option[4] = {}
menu.option[4].y = 390
menu.option[4].text = "Quitter"
menu.option[4].underlineColor = menu.initialColor
menu.option.underlineWidth = 50

local isInRulesPage = false
rulesContent = "Règles du jeu Pong :\n\n" ..
               "Deux modes de jeu sont disponibles :\n\n" ..
               "1. Joueur contre Joueur : Utilisez les touches Z (monter) et S (descendre) pour le joueur de gauche, et les touches fléchées Haut et Bas pour le joueur de droite.\n\n" ..
               "2. Bot contre Joueur : Vous jouez contre un bot. Utilisez les touches fléchées Haut et Bas pour le joueur de droite. Le bot est à gauche.\n\n" ..
                "3. Le but du jeu est de faire passer la balle dans le camp adverse. Le score s'affiche en haut. Bon jeu !!\n\n"


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
    elseif mouseY >= menu.option[4].y and mouseY <= menu.option[4].y + 30 and mouseX > screen_width/2 - 150 and mouseX < screen_width/2 + 150 then
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
        love.graphics.printf('Développé par Steven Lucarno DODDE', fonts.author, 0, 128, screen_width, 'center' )


        --options
        love.graphics.printf(menu.option[1].text, fonts.option, 0, menu.option[1].y, screen_width, 'center' )
        love.graphics.printf(menu.option[2].text, fonts.option, 0, menu.option[2].y, screen_width, 'center' )
        love.graphics.printf(menu.option[3].text, fonts.option, 0, menu.option[3].y, screen_width, 'center' )
        love.graphics.printf(menu.option[4].text, fonts.option, 0, menu.option[4].y, screen_width, 'center' )


        --UNDERLINE
        
          
        for i, option in ipairs(menu.option) do
            love.graphics.setColor(.5,.5,1)
            love.graphics.rectangle('fill', screen_width/2 - menu.option.underlineWidth/2, option.y + 40, menu.option.underlineWidth, 3, 3)
            love.graphics.setColor(1, 1, 1)
        end
    elseif scene == "rules" then
        love.graphics.printf(rulesContent, fonts.rules, 30, 30, screen_width - 60, 'left')
        love.graphics.setColor(.5,.5,1)
        love.graphics.rectangle('line', 20, 20, screen_width - 40, screen_height - 40)
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Appuyez sur 'Echap' pour retourner au menu principal", fonts.author, 0, screen_height - 50, screen_width, 'center' )
    end


    
end

function love.keypressed(key)
    game.keypressed(key)
    if key == "escape" and isInRulesPage then
        scene = "menu"
        isInRulesPage = false
    end
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
            scene = 'rules'
            isInRulesPage = true
            love.mouse.setCursor(cursor.arrow)
        elseif mouseY >= menu.option[4].y and mouseY <= menu.option[4].y + 30 and mouseX > screen_width/2 - 150 and mouseX < screen_width/2 + 150 then
            love.event.quit()
        end
    end
end