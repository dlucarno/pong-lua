local bot = {}

function bot.update(dt, gamemode)
    dt = 1/150
    if ball.sticky == false then
        if ball.x + ball.size/2 <= screen_width/2 then
            if raket[1].y+raket.height/2 < ball.y+ball.size/2 then
                if raket[1].y + raket.height < screen_height then
                    raket[1].y = raket[1].y + raket.speed*dt 
                end
            else
                if raket[1].y > 0 then
                    raket[1].y = raket[1].y - raket.speed*dt 
                end
            end

        elseif  ball.x+ball.size/2 > screen_width/2 and gamemode == 3 then
            if raket[2].y+raket.height/2 < ball.y+ball.size/2 then
                if raket[2].y + raket.height < screen_height then
                    raket[2].y = raket[2].y + raket.speed*dt 
                end
            else
                if raket[2].y > 0 then
                    raket[2].y = raket[2].y - raket.speed*dt 
                end
            end
        end
    end
end

return bot