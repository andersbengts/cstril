
local composer = require( "composer" )

local scene = composer.newScene()


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

	local titletext = display.newText( sceneGroup, "- cSTRIL -", 500, 80, native.systemFont, 100)
	titletext.x = display.contentCenterX
	titletext.y = 200
	titletext:setFillColor(0, 1, 0)

	local titletext2 = display.newText( sceneGroup, "- Field Communication -", 500, 80, native.systemFont, 60)
	titletext2.x = display.contentCenterX
	titletext2.y = 300
	titletext2:setFillColor(0, 1, 0 )




-- ********************************************************
-- ********************************************************
--
--  SEND REPORT BUTTON
--
-- ********************************************************
-- ********************************************************



	local widget = require( "widget" )

	-- Function to handle button events
	local function handleReportInButtonEvent( event )

	    if ( "ended" == event.phase ) then
	        print( "Button was pressed and released" )

					composer.gotoScene( "sendreport" )
	    end
	end

	-- Create the widget
	local reportinbutton = widget.newButton(
	    {
	        label = "button",
	        onEvent = handleReportInButtonEvent,
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
	reportinbutton.x = display.contentCenterX
	reportinbutton.y = 1000

	-- Change the button's label text
	reportinbutton:setLabel( "Send Report" )
	reportinbutton._view._label.size = 50

	-- Adding the button to scene group
	sceneGroup:insert(reportinbutton)



	-- ********************************************************
	-- ********************************************************
	--
	--  READ REPORTS BUTTON
	--
	-- ********************************************************
	-- ********************************************************



		local widget = require( "widget" )

		-- Function to handle button events
		local function handleReadReportButtonEvent( event )

		    if ( "ended" == event.phase ) then
		        print( "Button was pressed and released" )
						composer.gotoScene( "readreports" )
		    end
		end

		-- Create the widget
		local reportreadbutton = widget.newButton(
		    {
		        label = "button",
		        onEvent = handleReadReportButtonEvent,
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
		reportreadbutton.x = display.contentCenterX
		reportreadbutton.y = 1200

		-- Change the button's label text
		reportreadbutton:setLabel( "Map View" )
		reportreadbutton._view._label.size = 50

		-- Adding the button to scene group
		sceneGroup:insert(reportreadbutton)


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
				        print( "Button was pressed and released" )
-- 								reportinbutton:removeSelf( )

								composer.gotoScene( "appsettings" )
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
				settingsbutton:setLabel( "Settings" )
	 			settingsbutton._view._label.size = 50

				-- Adding the button to scene group
				sceneGroup:insert(settingsbutton)


end



-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase



	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

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
