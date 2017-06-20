local composer = require( "composer" )

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

-- Seed the random number generator
math.randomseed( os.time() )

--require the file with the save/load functions

-- Go to the menu screen
composer.gotoScene( "menu" )
