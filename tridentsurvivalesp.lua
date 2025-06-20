local workspace = globals.data_model():FindChild('Workspace')
    if not workspace then
    return
    end

cheat.set_callback("paint", function()
    local children = workspace:Children()
    if not children or #children == 0 then
        return
    end

    local playerModels = {}
    for _, child in ipairs(children) do
        if child:Name() == "Model" then
            if child:FindChild("HumanoidRootPart") then
            table.insert(playerModels, child:FindChild("HumanoidRootPart"))
            end
        end
    end

if globals.is_focused() then
    for _, player in ipairs(playerModels) do
        local primitive = player:Primitive()
            if primitive then
                local position = primitive:GetPartPosition()
                if position then
                    local screenPos = utils.world_to_screen(position)
                    if screenPos and screenPos.x >= 0 and screenPos.y >= 0 then
                        render.circle(screenPos.x, screenPos.y, 10, 255, 0, 0, 255, 32)
                    end
                end
            end
        end
    end
end)