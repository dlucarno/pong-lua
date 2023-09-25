local bot = {}


function bot.update(dt, gamemode)
    dt = 1/100
    raket[1].speed = love.math.random(150, 250) -- Raquette 1
    raket[2].speed = love.math.random(150, 250) -- Raquette 2
    if ball.sticky then
        return
    end

    local ballCenterY = ball.y + ball.size/2

    if ball.x + ball.size/2 <= screen_width/2 then
        local raketCenterY = raket[1].y + raket.height/2

        local canMoveUp = raket[1].y + raket.height < screen_height
        local canMoveDown = raket[1].y > 0

        local speedFactor = raket[1].speed / 200 -- Ajuster le facteur de vitesse

        if raketCenterY < ballCenterY and canMoveUp then
            raket[1].y = raket[1].y + raket[1].speed * speedFactor * dt
        elseif raketCenterY > ballCenterY and canMoveDown then
            raket[1].y = raket[1].y - raket[1].speed * speedFactor * dt
        end
    elseif gamemode == 3 then
        local raketCenterY = raket[2].y + raket.height/2

        local canMoveUp = raket[2].y + raket.height < screen_height
        local canMoveDown = raket[2].y > 0

        local speedFactor = raket[2].speed / 200 -- Ajuster le facteur de vitesse

        if raketCenterY < ballCenterY and canMoveUp then
            raket[2].y = raket[2].y + raket[2].speed * speedFactor * dt
        elseif raketCenterY > ballCenterY and canMoveDown then
            raket[2].y = raket[2].y - raket[2].speed * speedFactor * dt
        end
    end
end




return bot