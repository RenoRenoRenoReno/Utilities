--< Revamped ESP Script for frontlines >--

if (game.PlaceId == not 5938036553) then
	game.Players.LocalPlayer:Kick("This script only supports Frontlines")
end

_G.CheckTeams = true
_G.TeamColor = Color3.fromRGB(111, 0, 255)
_G.EnemyColor = Color3.fromRGB(255,0,0)

--< Ui Libary >--
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "Frontlines",
   LoadingTitle = "Frontlines Hub",
   LoadingSubtitle = "by Reno#0943",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "SIRIUS", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sirius Hub",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/sirius)",
      FileName = "SiriusKey",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "Hello"
   }
})

Rayfield:Notify({
   Title = "Thanks!",
   Content = "Thank you for using my script, if you have any issues feel free to DM Me: Reno#0943",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

for _,player in pairs(game.workspace:GetChildren()) do
	if (player:FindFirstChild("Highlight")) then
		player.Highlight:Destroy()
	end
end

local config = {
  CheckTeams = _G.CheckTeams,
  EnemyColor = _G.EnemyColor,
  TeamColor = _G.TeamColor
}

local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

local EnableEsp = MainTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "ESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   	  if (Value == false) then
   	  	  for _,idk in pairs(game.workspace:GetChildren()) do
		       if (idk:FindFirstChild("HumanoidRootPart") or idk.Name == 'soldier_model') then
		       	   if (idk:FindFirstChild("Highlight")) then
		       	      idk.Highlight:Destroy()	
				   end
				end	
			end	
	   end
      if (Value == true) then
         for _,idk in pairs(game.workspace:GetChildren()) do
            if (idk:FindFirstChild("HumanoidRootPart")) then
               local highlight = Instance.new("Highlight", idk)
                if (config.CheckTeams == true) then
               	  if (idk:FindFirstChild('friendly_marker')) then
               	     highlight.FillColor = config.TeamColor
               	  else
               	     highlight.FillColor = config.EnemyColor	
				  end
                end
		    if (game.Players.LocalPlayer.Character:FindFirstChild("Highlight")) then
		        game.Players.LocalPlayer.Character.Highlight:Destroy()
		        end
			end	
		 end
      	 end
      	 end
})
