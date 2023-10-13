local hallowBG

function create()
    hallowBG = Sprite(-200, -100)
    hallowBG:setFrames(paths.getSparrowAtlas(SCRIPT_PATH .. 'halloween_bg'))
    hallowBG:addAnimByPrefix('idle', 'halloweem bg0')
    hallowBG:addAnimByPrefix('lightning', 'halloweem bg lightning strike', 24,
                             false)
    hallowBG:play('idle')
    self:add(hallowBG)
end

local lightningStrikeBeat = 0
local lightningOffset = love.math.random(8, 24)
function beat(b)
    if love.math.randomBool(10) and b > lightningStrikeBeat + lightningOffset then
        game.sound.play(paths.getSound('gameplay/thunder_' ..
                                           love.math.random(1, 2)))
        hallowBG:play('lightning')

        state.camGame:shake(0.001, 1.4)
        state.camHUD:shake(0.001, 1.4)

        lightningStrikeBeat = b
        lightningOffset = love.math.random(8, 24)

        state.boyfriend:playAnim('scared', true)
        state.gf:playAnim('scared', true)

        state.boyfriend.lastHit = PlayState.inst.time
        state.gf.lastHit = PlayState.inst.time
    end
end