function VentoUI:CreateWindow(config)
    local Window = {}
    Window.Tabs = {}

    local ScreenGui = Create("ScreenGui", {
        Name = "VentoUI",
        ResetOnSpawn = false,
        Parent = PlayerGui
    })

    local Main = Create("Frame", {
        Parent = ScreenGui,
        Size = UDim2.fromScale(0.5, 0.6),
        Position = UDim2.fromScale(0.25, 0.2),
        BackgroundColor3 = self.Theme.Background
    })

    Create("UICorner", { CornerRadius = UDim.new(0, 14), Parent = Main })

    -- Drag
    local dragging, dragStart, startPos
    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
        end
    end)

    Main.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Main.Position = startPos + UDim2.fromOffset(delta.X, delta.Y)
        end
    end)
