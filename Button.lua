        function Section:CreateButton(text, callback)
            local Button = Create("TextButton", {
                Parent = Content,
                Text = text,
                Size = UDim2.new(1, 0, 0, 34),
                BackgroundColor3 = VentoUI.Theme.Background,
                TextColor3 = VentoUI.Theme.Text,
                Font = Enum.Font.Gotham,
                TextSize = 13
            })

            Create("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = Button
            })

            Button.MouseButton1Click:Connect(function()
                pcall(callback)
            end)
        end
