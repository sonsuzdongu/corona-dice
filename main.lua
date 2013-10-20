-- Basit Zar Uygulamasi
-- Stat� Bar'� kald�rma
display.setStatusBar( display.HiddenStatusBar )

-- Ekrana "background" ad�nda yeni bir resim yerle�tirme
local background = display.newImage( "images/iphone4-wallpaper7s.jpg" )

-- dice ad�nda yeni bir resim yerle�tirme ve ekrandaki yerini belirleme
local dice = display.newImage( "images/Dice-1.png" )
dice.x = display.contentWidth/2; dice.y = display.contentHeight/2
 
-- Ses dosyas�n� yukleme. (�alma de�il)
local diceSound = audio.loadSound("diceroll.wav")

--Yeni bir "text" ekleme ve yerini belirleme
myText = display.newText("", display.contentWidth/2, 100, native.systemFont, 40)

-- accelerometer Event'lerini dinleyen fonksiyonu
local function listener( event )
    -- Cihaz�n "shake" edildi�ini kontrol eden if
    if event.isShake then
        
        -- Daha �nce y�kledi�imiz ses dosyas�n� oynatma
        audio.play( diceSound )
        
        -- Konsola cihaz�n "shake" edildi�ini yazd�rma
        print( "The device is being shaken!" )
		
		-- timerE fonksiyonu
		local function timerE(ev)
			-- 1-6 aras� rastgele bir say� belirleme
			x=math.random(6)
			-- dice resmini silme
			dice:removeSelf()
			-- x de�i�kenine gore yeni bir resim ekleme (..x.. ya dikkat)
			dice = display.newImage( "images/Dice-"..x..".png" ) 
			dice.x = display.contentWidth/2 dice.y = display.contentHeight/2 	
      
			-- konsola x'i yazd�rma
			print("Rolled"..x)
			
			-- Onceden bos olan text i�erigini x de�i�kenine gore de�i�tirmek
			myText.text = "Rolled "..x
		end
    
		--timerE fonksiyonunun �zellikleri, 100ms, 10 kere
		timer.performWithDelay( 100, timerE, 10 )
		
    end
 
    return true
end

-- cihaz�n shake �zelligini dinleyen listener
Runtime:addEventListener("accelerometer", listener )