local workspace = globals.data_model():FindChild('Workspace')
local localPlayer = workspace:FindChild(globals.localplayer():Name())
local hrp = localPlayer:FindChild('HumanoidRootPart')

local EnableCheckbox = ui.new_checkbox("Enable Waypoints")
local waypoint = nil

local a = ui.label("Set waypoint")
local waypointSet = ui.keybind("Set Waypoint")
local b = ui.label("TP to waypoint")
local waypointTeleport = ui.keybind("Teleport to Waypoint")


local function displayIcon(position)
    local screenPos = utils.world_to_screen(position)
    if screenPos and screenPos.x >= 0 and screenPos.y >= 0 then
        render.circle(screenPos.x, screenPos.y, 5, 143, 17, 240, 255, 4)
    end
end


cheat.set_callback("paint", function()
    local isEnabled = EnableCheckbox:get()
    if waypoint then
        displayIcon(waypoint)
    end

    if isEnabled then
        if waypointSet:get() then
            waypoint = hrp:Primitive():GetPartPosition()
        end

        if waypointTeleport:get() then
            hrp:Primitive():SetPartPosition(waypoint)
        end
    end
end)