--Flee the Facility Computer ESP
local workspace = globals.data_model():FindChild('Workspace')

cheat.set_callback("paint", function()
    local children = workspace and workspace:Children()
    if not workspace or not children or #children == 0 then
        return
    end

    local map = {}
    local computerTables = {}
    
    for _, child in ipairs(children) do
        if child:FindChild("ComputerTable") then
            map = child:Children()
        end
    end

    for _, mapChild in ipairs(map) do
        if mapChild:Name() == "ComputerTable" then
            table.insert(computerTables, mapChild:FindChild("BasePart"))
        end
    end

    for _, computer in ipairs(computerTables) do
        local primitive = computer:Primitive()
        if primitive then
            local position = primitive:GetPartPosition()
            if position then
                local screenPos = utils.world_to_screen(position)
                if screenPos and screenPos.x >= 0 and screenPos.y >= 0 then
                    render.circle(screenPos.x, screenPos.y, 10, 255, 0, 0, 255, 4)
                end
            end
        end
    end

end)
