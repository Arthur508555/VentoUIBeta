        function Section:CreateToggle(text, default, callback)
            local state = default or false

            local Toggle = Create("TextButton", {
                Parent = Content,
                Text = text,
                Size = UDim2.new(1, 0, 0, 34),
                BackgroundColor3 = state and VentoUI.Theme.Accent or VentoUI.Theme.Background,
                TextColor3 = VentoUI.Theme.Text,
                Font = Enum.Font.Gotham,
                TextSize = 13
            })

            Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = Toggle })

            Toggle.MouseButton1Click:Connect(function()
                state = not state
                Toggle.BackgroundColor3 = state and VentoUI.Theme.Accent or VentoUI.Theme.Background
                pcall(callback, state)
            end)
        end
