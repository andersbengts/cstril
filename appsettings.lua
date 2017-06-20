
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	-- local background = display.newImageRect( sceneGroup, "background.png", 800, 1400 )
local background = display.newImageRect( sceneGroup, "background.PNG", display.contentWidth, display.contentHeight )
background.x = display.contentCenterX
background.y = display.contentCenterY

local titletext = display.newText( sceneGroup, "- Settings -", 500, 80, native.systemFont, 100)
titletext.x = display.contentCenterX
titletext.y = 200
titletext:setFillColor( black, black, black )

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

		local nicTextFieldtext = display.newText( sceneGroup, "Nickname", 700, 730, native.systemFont, 40)
		nicTextFieldtext.x = display.contentCenterX
		nicTextFieldtext:setFillColor( black, black, black )

		nicTextField = native.newTextField( 500, 800, 180, 100 )
		nicTextField.x = display.contentCenterX
		nicTextField.text = system.getPreference( "app", "nic", "string" )
		nicTextField.isEditable = true
		nicTextField.font = native.newFont( native.systemFontBold, 24 )
		nicTextField:resizeHeightToFitFont()

		local teamTextFieldtext = display.newText( sceneGroup, "Team code", 700, 930, native.systemFont, 40)
		teamTextFieldtext.x = display.contentCenterX
		teamTextFieldtext:setFillColor( black, black, black )

		teamTextField = native.newTextField( 500, 1000, 180, 100 )
		teamTextField.x = display.contentCenterX
		teamTextField.text = system.getPreference( "app", "team", "string" )
		teamTextField.isEditable = true
		teamTextField.inputType = "number"
		teamTextField.font = native.newFont( native.systemFontBold, 24 )
		teamTextField:resizeHeightToFitFont()

		local allianceTextFieldtext = display.newText( sceneGroup, "Alliance code", 700, 1130, native.systemFont, 40)
		allianceTextFieldtext.x = display.contentCenterX
		allianceTextFieldtext:setFillColor( black, black, black )

		allianceTextField = native.newTextField( 500, 1200, 180, 100 )
		allianceTextField.x = display.contentCenterX
		allianceTextField.text = system.getPreference( "app", "alliance", "string" )
		allianceTextField.isEditable = true
		allianceTextField.inputType = "number"
		allianceTextField.font = native.newFont( native.systemFontBold, 24 )
		allianceTextField:resizeHeightToFitFont()


					-- ********************************************************
					-- ********************************************************
					--
					--  SETTINGS BUTTON
					--
					-- ********************************************************
					-- ********************************************************



						local widget = require( "widget" )

						-- Function to handle button events
						local function handleSettingsButtonEvent( event )

						    if ( "ended" == event.phase ) then
						        print( "Appsettings Button was pressed and released" )

										local appPreferences =
										{
    									team = teamTextField.text,
											nic = nicTextField.text,
											alliance = allianceTextField.text
										}
										system.setPreferences( "app", appPreferences )

										nicTextField:removeSelf()
										teamTextField:removeSelf()
										allianceTextField:removeSelf()

										composer.gotoScene( "menu" )
						    end
						end

						-- Create the widget
						local settingsbutton = widget.newButton(
						    {
										label = "button",
						        onEvent = handleSettingsButtonEvent,
						        emboss = false,
						        -- Properties for a rounded rectangle button
						        shape = "roundedRect",
						        width = 600,
						        height = 100,
						        cornerRadius = 2,
										fillColor = { default={0, 0.50196078431373, 0, 1}, over={1,0.1,0.7,0.4} },
						        strokeColor = { default={0, 1, 0, 10}, over={0.8,0.8,1,1} },
										labelColor = { default={ 0, 0, 0 }, over={ 1, 1, 0.87843137254902, 0.5 } },
						        strokeWidth = 4
						    }
						)

						-- Center the button
						settingsbutton.x = display.contentCenterX
						settingsbutton.y = 1400

						-- Change the button's label text
						settingsbutton:setLabel( "Save and return to menu" )
			 			settingsbutton._view._label.size = 50

						-- Adding the button to scene group
						sceneGroup:insert(settingsbutton)





	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
