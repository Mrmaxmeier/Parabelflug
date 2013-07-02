SIZEX = 800
SIZEY = 600

function love.conf(t)
    t.modules.graphics = true
    t.title = "Parabelflug"		-- Der Titel des Fensters in dem das Spiel läuft (string)
    t.author = "Mrmaxmeier"		-- Der Spielautor (string)
    t.identity = Parabelflug		-- Der Name des Spielverzeichnisses (string)
    t.version = "0.8.0"              -- Die LÖVE-Version, mit welcher das Spiel programmiert wurde (number)
    t.console = true           -- Startet mit dem Spiel auch eine Konsole (boolean, nur unter Windows)
    t.screen.width = SIZEX        -- Die Fensterbreite (number)
    t.screen.height = SIZEY       -- Die Fensterhöhe (number)
    t.screen.fullscreen = false -- Schaltet den Vollbildschirm-Modus ein (boolean)
    t.screen.vsync = true       -- Schaltet Vsync an (boolean)
    t.screen.fsaa = 0           -- Die Anzahl der FSAA-buffer (number)
    t.modules.joystick = true   -- Schaltet das Joystick-Modul ein (boolean)
    t.modules.audio = true      -- Schaltet das Audio-Modul ein (boolean)
    t.modules.keyboard = true   -- Schaltet das Tastatur-Modul ein (boolean)
    t.modules.event = true      -- Schaltet das Event-Modul ein (boolean)
    t.modules.image = true      -- Schaltet das Bilder-Modul ein(boolean)
    t.modules.graphics = true   -- Schaltet das Grafik-Modul ein (boolean)
    t.modules.timer = true      -- Schaltet das Timer-Modul ein (boolean)
    t.modules.mouse = true      -- Schaltet das Maus-Modul ein (boolean)
    t.modules.sound = true      -- Schaltet das Maus-Modul ein (boolean)
    t.modules.physics = true    -- Schaltet das Physik-Modul ein (boolean)
end
