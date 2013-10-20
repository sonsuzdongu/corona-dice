-- Basit Zar Uygulamasi
-- Statü Bar'ý kaldýrma
display.setStatusBar( display.HiddenStatusBar )

-- Ekrana "background" adýnda yeni bir resim yerleþtirme
local background = display.newImage( "images/iphone4-wallpaper7s.jpg" )

-- dice adýnda yeni bir resim yerleþtirme ve ekrandaki yerini belirleme
local dice = display.newImage( "images/Dice-1.png" )
dice.x = display.contentWidth/2; dice.y = display.contentHeight/2
 
-- Ses dosyasýný yukleme. (Çalma deðil)
local diceSound = audio.loadSound("diceroll.wav")

--Yeni bir "text" ekleme ve yerini belirleme
myText = display.newText("", display.contentWidth/2, 100, native.systemFont, 40)

-- accelerometer Event'lerini dinleyen fonksiyonu
local function listener( event )
    -- Cihazýn "shake" edildiðini kontrol eden if
    if event.isShake then
        
        -- Daha önce yüklediðimiz ses dosyasýný oynatma
        audio.play( diceSound )
        
        -- Konsola cihazýn "shake" edildiðini yazdýrma
        print( "The device is being shaken!" )
		
		-- timerE fonksiyonu
		local function timerE(ev)
			-- 1-6 arasý rastgele bir sayý belirleme
			x=math.random(6)
			-- dice resmini silme
			dice:removeSelf()
			-- x deðiþkenine gore yeni bir resim ekleme (..x.. ya dikkat)
			dice = display.newImage( "images/Dice-"..x..".png" ) 
			dice.x = display.contentWidth/2 dice.y = display.contentHeight/2 	
      
			-- konsola x'i yazdýrma
			print("Rolled"..x)
			
			-- Onceden bos olan text içerigini x deðiþkenine gore deðiþtirmek
			myText.text = "Rolled "..x
		end
    
		--timerE fonksiyonunun özellikleri, 100ms, 10 kere
		timer.performWithDelay( 100, timerE, 10 )
		
    end
 
    return true
end

-- cihazýn shake özelligini dinleyen listener
Runtime:addEventListener("accelerometer", listener )