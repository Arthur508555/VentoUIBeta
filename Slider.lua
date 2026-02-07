function Section:CreateSlider(text, min, max, default, callback)
    local value = default or min
    callback = callback or function() end

    local Holder = Create("Frame", {
        Parent = Content,
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundTransparency = 1
    })

    local Label = Create("TextLabel", {
        Parent = Holder,
        Text = text .. ": " .. value,
        BackgroundTransparency = 1,
        TextColor3 = VentoUI.Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        Size = UDim2.new(1, 0, 0, 18)
    })

    local Bar = Create("Frame", {
        Parent = Holder,
        Position = UDim2.new(0, 0, 0, 24),
        Size = UDim2.new(1, 0, 0, 6),
        BackgroundColor3 = VentoUI.Theme.Muted
    })

    Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Bar })

    local Fill = Create("Frame", {
        Parent = Bar,
        Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = VentoUI.Theme.Accent
    })

    Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Fill })

    -- Atualiza valor
    local function SetValue(pos)
        pos = math.clamp(pos, 0, 1)
        value = math.floor(min + (max - min) * pos)
        Fill.Size = UDim2.new(pos, 0, 1, 0)
        Label.Text = text .. ": " .. value
        pcall(callback, value)
    end

    -- Valor inicial
    SetValue((value - min) / (max - min))

    local dragging = false

    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            SetValue((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X)
        end
    end)

    Bar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        ) then
            SetValue((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X)
        end
    end)
end
