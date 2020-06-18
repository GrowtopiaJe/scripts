UI = script.Parent
MaxNotifications = 5
NotificationDuration = 2

function createNotification(NotificationText)
	local Notifications = UI.Notifications:GetChildren()
	if #Notifications >= MaxNotifications then
		Notifications[1]:TweenPosition(UDim2.new(1.5, 0, Notifications[1].Position.Y.Scale, 0),"InOut","Linear",0.2,true);wait(0.2)
		Notifications[1]:Destroy()
		for i,v in pairs(Notifications) do if v ~= nil then
			v:TweenPosition(UDim2.new(0.97, 0, v.Position.Y.Scale - 0.12, 0),"InOut","Linear",0.2,true)
			end
		end
		local NewNotification = UI.NotificationTemplate:Clone()
		NewNotification.Name = tostring(#Notifications+1)
		NewNotification.Parent = UI.Notifications
		NewNotification.Text.Text = NotificationText
		NewNotification:TweenPosition(UDim2.new(0.97, 0, 0.85, 0),"InOut","Linear",0.2,true)
	else
		for i,v in pairs(Notifications) do
			v:TweenPosition(UDim2.new(0.97, 0, v.Position.Y.Scale - 0.12, 0),"InOut","Linear",0.2,true)
		end
		local NewNotification = UI.NotificationTemplate:Clone()
		NewNotification.Name = tostring(#Notifications+1)
		NewNotification.Parent = UI.Notifications
		NewNotification.Text.Text = NotificationText
		NewNotification:TweenPosition(UDim2.new(0.97, 0, 0.85, 0),"InOut","Linear",0.2,true)
		delay(NotificationDuration,function()
			NewNotification:TweenPosition(UDim2.new(1.5, 0, NewNotification.Position.Y.Scale, 0),"InOut","Linear",0.2,true);wait(0.2)
			NewNotification:Destroy()
		end)
	end
end
