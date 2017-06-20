-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )


local background = display.newImageRect( "greenleaderbe.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY


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
    else
        print( "######## Error ############" )
        defaultBox.text = "NEJ NEJ"
    end
    return
end

local headers = {}

---- headers["Authentication"] = mime.b64("app@contoso.se:3cz42gjSUz[H@!bG")
headers["X-DreamFactory-Api-Key"] = "36fda24fe5588fa4285ac6c6c2fdfbdb6b6bc9834699774c9bf777f706d05a88"
headers["Authorization"] = "Basic dXNlckBleGFtcGxlLmNvbTp5cHpBUWVtdjhtaXM="

local params = {}
params.headers = headers

--- network.request( "http://52.174.239.146/api/v2/cstri-sitrap/_table/cstri.sitrap", "GET", handleResponse, params )


network.request( "http://52.174.239.146/api/v2/cstri-sitrap/_table/cstri.sitrap?filter=alliance%20%3D%20NAF", "GET", handleResponse, params )


-- Create text box
defaultBox = native.newTextBox( 200, 200, 280, 140 )
defaultBox.isEditable = true
defaultBox.font = native.newFont( "Helvetica-Bold", 16 )
defaultBox:addEventListener( "userInput", textListener )


 composer.gotoScene( "menu" )
