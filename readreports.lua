
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

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

-- DISPLAY MAP view

--  Create a native map view
-- local myMap = native.newMapView( 20, 20, 280, 360 )
-- myMap.x = display.contentCenterX
-- myMap.y = display.contentCenterY
-- myMap.width = display.contentWidth
-- myMap.height = display.contentHeight
-- Display map as vector drawings of streets (other options are "satellite" and "hybrid")
-- myMap.mapType = "standard"
-- Initialize map to a real location
-- myMap:setCenter( 37.331692, -122.030456 )

-- WEBSERVICE MECK

local json = require( "json" )
local mime = require( "mime" )

local headers = {}

---- headers["Authentication"] = mime.b64("app@contoso.se:3cz42gjSUz[H@!bG")
headers["X-DreamFactory-Api-Key"] = "36fda24fe5588fa4285ac6c6c2fdfbdb6b6bc9834699774c9bf777f706d05a88"
headers["Authorization"] = "Basic dXNlckBleGFtcGxlLmNvbTp5cHpBUWVtdjhtaXM="

local params = {}
params.headers = headers




local function networkListener( event )
	if ( event.isError ) then
	 print( "Network error: ", event.response )
	else
		print ( "*****************************************")
		print ( "RESPONSE: " .. event.response )
		print ( "*****************************************")


	end
end



local query = network.request( "http://cstril.westeurope.cloudapp.azure.com/api/v2/cstri-sitrap/_table/sitrap", "GET", networkListener, params )















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
