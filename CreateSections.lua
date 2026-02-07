    function Tab:CreateSection(title)
        local Section = {}

        local SectionFrame = Create("Frame", {
            Parent = TabFrame,
            BackgroundColor3 = VentoUI.Theme.Secondary,
            Size = UDim2.new(1, 0, 0, 40),
            AutomaticSize = Enum.AutomaticSize.Y
        })

        Create("UICorner", {
            CornerRadius = UDim.new(0, 12),
            Parent = SectionFrame
        })

        -- Título
        local Title = Create("TextLabel", {
            Parent = SectionFrame,
            Text = title,
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            TextColor3 = VentoUI.Theme.Text,
            Size = UDim2.new(1, -20, 0, 32),
            Position = UDim2.new(0, 10, 0, 6)
        })

        -- Conteúdo da Section
        local Content = Create("Frame", {
            Parent = SectionFrame,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 10, 0, 40),
            Size = UDim2.new(1, -20, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        })

        local ContentLayout = Create("UIListLayout", {
            Parent = Content,
            Padding = UDim.new(0, 8)
        })
