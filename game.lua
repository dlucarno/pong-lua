local game = {}
game.start = true
 raket = {}
 raket.width = 20
 raket.height = 120
 raket.speed = 205

 raket[1] = {}
 raket[1].x = 0
 raket[1].y = 0
 raket[1].score = 0

 raket[2] = {}
 raket[2].x = 0
 raket[2].y = 0
 raket[2].score = 0


 ball = {}
 --Position de la balle
 ball.x = 0
 ball.y = 0
 ball.size = 20

 -- Vélocité de la balle 
 ball.vx = 0
 ball.vy = 0

 -- Mobile ou immobile
 ball.sticky = true
 function reset()
    raket[1].x = 0
    raket[1].y = 0

    raket[2].x = screen_width - raket.width
    raket[2].y = screen_height - raket.height
    resetBall()
 end

 function resetBall()
    ball.x = screen_width/2
    ball.y = screen_height/2 
    ball.sticky = true
 end

function game.load()
    reset()
end

function game.update(dt)
    dt = 1/100
    if game.start == true and scene == 'game' then
        if love.keyboard.isDown('z') and raket[1].y > 0 then
            raket[1].y = raket[1].y - raket.speed*dt
        elseif love.keyboard.isDown('s') and raket[1].y+raket.height < screen_height then
            raket[1].y = raket[1].y + raket.speed*dt
        end

        if love.keyboard.isDown('up') and raket[2].y > 0 then
            raket[2].y = raket[2].y - raket.speed*dt
        elseif love.keyboard.isDown('down') and raket[2].y+raket.height < screen_height then
            raket[2].y = raket[2].y + raket.speed*dt
        end
    end
end

function game.draw()
    -- la balle

    love.graphics.rectangle('fill', ball.x - ball.size/2, ball.y - ball.size/2, ball.size, ball.size, 4)

    -- rakets

    love.graphics.rectangle('fill', raket[1].x, raket[1].y, raket.width, raket.height, 4)
    love.graphics.rectangle('fill', raket[2].x, raket[2].y, raket.width, raket.height, 4)


    --line
    love.graphics.line(screen_width/2, 0, screen_width/2, screen_height)
end

function game.keypressed(key)
end

return game

