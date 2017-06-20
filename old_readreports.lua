
local composer = require( "composer" )
local widget = require( "widget" )
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

	local titletext = display.newText( sceneGroup, "- Read Report -", 500, 80, native.systemFont, 100)
	titletext.x = display.contentCenterX
	titletext.y = 200
	titletext:setFillColor( black, black, black )

	end


	-- show()
	function scene:show( event )

		local sceneGroup = self.view
		local phase = event.phase




end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen







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


		--- WebService

		local json = require( "json" )
		local mime = require( "mime" )

		local function handleResponse( event )
		    if not event.isError then
		        local response = json.decode( event.response )
		        print( event.response )
		        defaultBox.text = event.response

						print ("******************")
						local t = json.encode( event.response )
						print ( t )
						print ( t.resources.id )


		    else
		        print( "######## Error ############" )
		        defaultBox.text = "Cant contact CSTRIL central database..."
		    end
		    return
		end

		local headers = {}

		---- headers["Authentication"] = mime.b64("app@contoso.se:3cz42gjSUz[H@!bG")
		headers["X-DreamFactory-Api-Key"] = "36fda24fe5588fa4285ac6c6c2fdfbdb6b6bc9834699774c9bf777f706d05a88"
		headers["Authorization"] = "Basic dXNlckBleGFtcGxlLmNvbTp5cHpBUWVtdjhtaXM="

		local params = {}
		params.headers = headers

local team = system.getPreference( "app", "team", "string" )
local url = "http://cstril.westeurope.cloudapp.azure.com/api/v2/cstri-sitrap/_table/sitrap?filter=team%20%3D%20" .. team

		network.request( url, "GET", handleResponse, params )


		-- Create text box
defaultBox = native.newTextBox( 200, 200, 600, 1000 )
defaultBox.isEditable = false
defaultBox.font = native.newFont( native.systemFont, 30 )
defaultBox.x = display.contentCenterX
defaultBox.y = 800




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
