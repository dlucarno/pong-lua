local bot = {}

function bot.update(dt, gamemode)
    dt = 1/100

    if ball.sticky then
        return
    end

    local ballCenterY = ball.y + ball.size/2

    local speedFactor = love.math.random(50, 150) / 100 -- Génère un facteur de vitesse entre 0.5 et 1.5

    if ball.x + ball.size/2 <= screen_width/2 then
        local raketCenterY = raket[1].y + raket.height/2

        local canMoveUp = raket[1].y + raket.height < screen_height
        local canMoveDown = raket[1].y > 0

        if raketCenterY < ballCenterY and canMoveUp then
            raket[1].y = raket[1].y + raket.speed * speedFactor * dt
        elseif raketCenterY > ballCenterY and canMoveDown then
            raket[1].y = raket[1].y - raket.speed * speedFactor * dt
        end
    elseif gamemode == 3 then
        local raketCenterY = raket[2].y + raket.height/2

        local canMoveUp = raket[2].y + raket.height < screen_height
        local canMoveDown = raket[2].y > 0

        if raketCenterY < ballCenterY and canMoveUp then
            raket[2].y = raket[2].y + raket.speed * speedFactor * dt
        elseif raketCenterY > ballCenterY and canMoveDown then
            raket[2].y = raket[2].y - raket.speed * speedFactor * dt
        end
    end
end



return bot