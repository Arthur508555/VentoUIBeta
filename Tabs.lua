    function Window:CreateTab(name, icon)
        local Tab = {}
        Tab.Sections = {}

        local Button = Create("TextButton", {
            Text = name,
            BackgroundTransparency = 1,
            TextColor3 = VentoUI.Theme.Text,
            Parent = Main
        })

        function Tab:CreateSection(title)
            local Section = {}

            local Frame = Create("Frame", {
                BackgroundColor3 = VentoUI.Theme.Secondary,
                Size = UDim2.new(1, -20, 0, 40),
                Parent = Main
            })

            Create("UICorner", { CornerRadius = UDim.new(0, 10), Parent = Frame })

            function Section:CreateButton(text, callback)
                local Btn = Create("TextButton", {
                    Text = text,
                    Parent = Frame,
                    BackgroundColor3 = VentoUI.Theme.Accent
                })

                Btn.MouseButton1Click:Connect(function()
                    pcall(callback)
                end)
            end
