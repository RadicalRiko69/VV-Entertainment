return Def.ActorFrame {
    InitCommand = function(self)
        -- adjust lifebar position here
    end,
    -- this will be the black quad background
    Def.Quad {
        InitCommand = function(self)
            self:diffuse(0, 0, 0, 1)
            self:zoomy(30)
            self:zoomx(230)
        end
    },
    -- this will be the colored quad lifebar thingy
    Def.Quad {
        InitCommand = function(self)
            self:diffuse(0, 1, 0, 1)
            self:zoomy(30)
            self:zoomx(230)
        end,
        LifeChangedMessageCommand = function(self, params)
            local life = params.LifeMeter:GetLife();
            self:cropright(1 - life)
            if life < 0.21 then
                self:diffuse(1, 0, 0, 1)
            elseif life == 1.0 then
                self:diffuse(0, 1, 0, 1)
            else
                self:diffuse(1, 1, 1, 1)
            end
        end,
    },
    -- this will be the overlay battery image
    Def.Sprite {
        Texture = 'battery.png'
    }
}
