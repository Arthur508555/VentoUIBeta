function Window:CreateTab(name, icon)
    local Tab = {}
    Tab.Sections = {}

    -- Container da Tab
    local TabFrame = Create("ScrollingFrame", {
        Parent = Main,
        Size = UDim2.new(1, -20, 1, -20),
        Position = UDim2.new(0, 10, 0, 10),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarImageTransparency = 1,
        Visible = false
    })

    local Layout = Create("UIListLayout", {
        Parent = TabFrame,
        Padding = UDim.new(0, 12)
    })

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabFrame.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
    end)
