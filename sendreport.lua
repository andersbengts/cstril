
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

local titletext = display.newText( sceneGroup, "- Send Report -", 500, 80, native.systemFont, 100)
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


-- *********************************************************************
--     DISPLAY GPS LOCATION
-- *********************************************************************


local latitude = display.newText( "-", 100, 50, native.systemFont, 16 )
local longitude = display.newText( "-", 100, 100, native.systemFont, 16 )
local altitude = display.newText( "-", 100, 150, native.systemFont, 16 )
local accuracy = display.newText( "-", 100, 200, native.systemFont, 16 )
local speed = display.newText( "-", 100, 250, native.systemFont, 16 )
local direction = display.newText( "-", 100, 300, native.systemFont, 16 )
local time = display.newText( "-", 100, 350, native.systemFont, 16 )

local locationHandler = function( event )

    -- Check for error (user may have turned off location services)
    if ( event.errorCode ) then
        native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
        print( "Location error: " .. tostring( event.errorMessage ) )
    else
        local latitudeText = string.format( '%.4f', event.latitude )
        latitude.text = latitudeText


        local longitudeText = string.format( '%.4f', event.longitude )
        longitude.text = longitudeText

        local altitudeText = string.format( '%.3f', event.altitude )
        altitude.text = altitudeText

        local accuracyText = string.format( '%.3f', event.accuracy )
        accuracy.text = accuracyText

        local speedText = string.format( '%.3f', event.speed )
        speed.text = speedText

        local directionText = string.format( '%.3f', event.direction )
        direction.text = directionText

        -- Note that 'event.time' is a Unix-style timestamp, expressed in seconds since Jan. 1, 1970
        local timeText = string.format( '%.0f', event.time )
        time.text = timeText
    end
end

-- *********************************************************************
--     WHEEL
-- *********************************************************************

local widget = require( "widget" )

-- Set up the picker wheel columns
local columnData =
{
    {
        align = "center",
        width = 200,
        labelPadding = 20,
        startIndex = 1,
        labels = { "Less than 5", "5-10", "11-20", "21+", "1 vehicle", "2 vehicle","0" }
    },
    {
        align = "center",
        width = 200,
        labelPadding = 10,
        startIndex = 1,
        labels = { "Passning by", "Recon", "Fighting", "Base", "Dead","0" }
    },
    {
        align = "center",
        width = 200,
        labelPadding = 10,
        startIndex = 1,
        labels = { "1", "2", "3","0"}
    },
		{
				align = "center",
				width = 200,
				labelPadding = 10,
				startIndex = 1,
				labels = { "Need Rest", "0-1h","1-3h","3+ h","0"}
		},
		{
				align = "center",
				width = 200,
				labelPadding = 10,
				startIndex = 1,
				labels = { "All good", "Need ammo", "Need food","Need ammo and food","0"}
		}
}

-- Create the widget
local pickerWheel = widget.newPickerWheel(
{
    x = display.contentCenterX,
--    top = display.contentHeight - 160,
		y = 400,
    top = 300,
    fontSize = 22,
    columns = columnData

})

-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

-- Get the value for each column in the wheel, by column index
local enemy = values[1].value
local enemyoc = values[2].value
local enemyteam = values[3].value
local valuepe = values[4].value
local valueeq = values[5].value


-- *********************************************************************
--     COMMENT TEXTBOX
-- *********************************************************************

local defaultBox

local function textListener( event )

    if ( event.phase == "began" ) then
        -- User begins editing "defaultBox"

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultBox"
        print( event.target.text )

    elseif ( event.phase == "editing" ) then
        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )
    end
end

-- Create text box
defaultBox = native.newTextBox( 200, 200, 400, 250 )
defaultBox.text = "No additional comment"
defaultBox.isEditable = true
defaultBox.x = display.contentCenterX
defaultBox.y = 700
defaultBox.font = native.newFont( native.systemFontBold, 24 )

-- *********************************************************************
--      SEND REPORT BUTTON
-- *********************************************************************


						local widget = require( "widget" )

						-- Function to handle button events
						local function handleSettingsButtonEvent( event )

						    if ( "ended" == event.phase ) then
						        print( "Send Report Button was pressed" )


-- *********************************************************************
-- Submit to webservice
local json = require( "json" )
local mime = require( "mime" )
local function networkListener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end

local body = {}
body.resource = {}
body.resource.time = os.date( "%c" )
body.resource.gpslat = latitude.text
body.resource.gpslon = longitude.text
body.resource.gpsspeed 	= speed.text
body.resource.gpsalt 		= altitude.text
body.resource.alliance = system.getPreference( "app", "alliance", "string" )
body.resource.team = system.getPreference( "app", "team", "string" )
body.resource.nic = system.getPreference( "app", "nic", "string" )
body.resource.enemy = values[1].value
body.resource.enemyoc = values[2].value
body.resource.enemyteam = values[3].value
body.resource.comment = defaultBox.text
body.resource.valuepe = values[4].value
body.resource.valueeq = values[5].value

body = json.encode(body)

print("########################")
print( body )
print("########################")

local headers = {}

headers["X-DreamFactory-Api-Key"] = "36fda24fe5588fa4285ac6c6c2fdfbdb6b6bc9834699774c9bf777f706d05a88"
headers["Authorization"] = "Basic dXNlckBleGFtcGxlLmNvbTp5cHpBUWVtdjhtaXM="
headers["Content-Type"] = "application/json"

local params = {}
params.headers = headers
params.body = body

network.request( "http://104.46.61.88/api/v2/cstri-sitrap/_table/sitrap", "POST", networkListener, params )

-- *********************************************************************





-- Remove the wheel and textbox when changing scene

										pickerWheel:removeSelf()
										defaultBox:removeSelf()


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
						settingsbutton:setLabel( "Submit and return to menu" )
			 			settingsbutton._view._label.size = 45

						-- Adding the button to scene group
						sceneGroup:insert(settingsbutton)



-- *********************************************************************


-- Activate location listener
Runtime:addEventListener( "location", locationHandler )

-- *********************************************************************
-- *********************************************************************
-- *********************************************************************


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
