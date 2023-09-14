local SubState = State:extend()

function SubState:new() SubState.super.new(self) end

function SubState:update(dt)
    if self.__parentState.persistentUpdate then self.__parentState:update(dt) end
    SubState.super.update(self, dt)
end

function SubState:draw()
    if self.__parentState.persistentDraw then
        local oldCamera = Camera.oldCamera
        Camera.defaultCamera = self.__parentState.__defaultCamera
        self.__parentState:draw()
        Camera.defaultCamera = oldCamera
    end
    SubState.super.draw(self)
end

function SubState:close() self.__parentState:closeSubState() end

function SubState:leave() self.__parentState.subState = nil end

return SubState