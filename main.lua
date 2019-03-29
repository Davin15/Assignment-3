-----------------------------------------------------------------------------------------
--
-- main.lua
-- 
--By:Davin Rousseau
--
--made on march 25th/2019

-- This program is Assignment #3
-----------------------------------------------------------------------------------------
local numberOfToppingsTextField = native.newTextField( display.contentCenterX, display.contentCenterY - 195, 100, 50 )
numberOfToppingsTextField.id = "Number textField"

local toppingsTextField = display.newText( "Enter # of Toppings here", display.contentCenterX, display.contentCenterY - 240, native.systemFont, 20 )
toppingsTextField.id = "toppings textField"
toppingsTextField:setFillColor( 0, 0, 255 )

local LargeTextField = display.newText( "Large", display.contentCenterX -90, display.contentCenterY + 60, native.systemFont, 20 )
LargeTextField.id = "Large textField"
LargeTextField:setFillColor( 0, 0, 255 )

local ExtraLargeTextField = display.newText( "Extra Large", display.contentCenterX +90, display.contentCenterY +60, native.systemFont, 20 )
ExtraLargeTextField.id = "toppings textField"
ExtraLargeTextField:setFillColor( 0, 0, 255 )

local pizzasizeTextField = display.newText( "What Size Would You Like?", display.contentCenterX, display.contentCenterY - 50, native.systemFont, 20 )
pizzasizeTextField.id = "pizza size textField"
pizzasizeTextField:setFillColor( 0, 255, 0 )

local LargeButton = display.newImageRect( "assets/LargeButton.png", 60, 60 )
LargeButton.x = 75
LargeButton.y = 250
LargeButton.id = "Large button"

local ExtraLargeButton = display.newImageRect( "assets/ExtraLargeButton.png", 100, 100 )
ExtraLargeButton.x = 230
ExtraLargeButton.y = 250
ExtraLargeButton.id = "Extra Large button"

display.setDefault("background", 255, 0, 0)

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 2)
  return math.floor(num * mult + 0.5) / mult
end

local function calculatePrice( event )

	local Tax = subtotal * 0.13
	
	local Total = subtotal + Tax
	
	local showSubtotal = display.newText( 'Subtotal: $' .. string.format("%.2f", subtotal), display.contentCenterX + 10, display.contentCenterY  +170, native.systemFont, 20 )
	showSubtotal:setTextColor( 0, 0, 255)
	
	local showTax = display.newText( 'Tax: $' .. string.format("%.2f", Tax), display.contentCenterX + 10, display.contentCenterY  +200, native.systemFont, 20 )
	showTax:setTextColor( 0, 0, 255 )
	
	local showTotal = display.newText( 'Total: $' .. string.format("%.2f", Total), display.contentCenterX + 10, display.contentCenterY  +220, native.systemFont, 20 )
	showTotal:setTextColor( 0, 0, 255 )
end

local function onLargeTouch( event )

	toppings = tonumber( numberOfToppingsTextField.text )

	if toppings == 1 then
		subtotal = 6 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 6 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 6 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 6 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'no more than 4 toppings allowed', display.contentCenterX + 20, display.contentCenterY  -80, native.systemFont, 20 )
		errorText:setTextColor( 0, 0, 255 )
	end	
end

local function onExtraLargeTouch( event )
	
	toppings = tonumber( numberOfToppingsTextField.text )
	
	if toppings == 1 then
		subtotal = 10 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 10 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 10 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 10 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Too many toppings', display.contentCenterX + 20, display.contentCenterY + -10, native.systemFont, 20 )
		errorText:setTextColor( 0, 0, 255 )
	end	
end

LargeButton:addEventListener( 'touch', onLargeTouch)
ExtraLargeButton:addEventListener( 'touch', onExtraLargeTouch)
