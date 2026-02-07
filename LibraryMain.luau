local VentoUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Arthur508555/VentoUIBeta/refs/heads/main/Library.lua"
))()

local files = {
    "Window.lua",
    "Tabs.lua",
    "CreateSections.lua",
    "Button.lua",
    "Toggle.lua",
    "Slider.lua"
}

for _, file in ipairs(files) do
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/Arthur508555/VentoUIBeta/refs/heads/main/" .. file
    ))(VentoUI)
end

return VentoUI

