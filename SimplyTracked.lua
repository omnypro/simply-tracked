--------------------------------------
-- Checkpoints recorded in the CSV file:
---- [id: 326, 327, 328]  Rival 1 / Lab
---- [id: 102, 115]       First Trainer
---- [id: 329, 330, 331]  Rival 2 / Route 22
---- [id: 414]            Brock
---- [id: 332, 333, 334]  Rival 3 / Nugget Bridge
---- [id: 426, 427, 428]  Rival 4 / St. Anne
---- [id: 415]            Misty
---- [id: 416]            Surge
---- [id: 429, 430, 431]  Rival 5 / Pokemon Tower
---- [id: 348]            Rocket Hideout
---- [id: 417]            Erika
---- [id: 418]            Koga
---- [id: 432, 433, 434]  Rival 6 / Silph Co.
---- [id: 349]            Silph Co.
---- [id: 420]            Sabrina
---- [id: 419]            Blaine
---- [id: 350]            Giovanni
---- [id: 435, 436, 437]  Rival 7 / Route 22
---- [id: 410, 735]       Lorelai
---- [id: 411, 736]       Bruno
---- [id: 412, 737]       Agatha
---- [id: 413, 738]       Lance
---- [id: 438, 439, 440]  Champ
--------------------------------------

local function SimplyTracked()
  local self = {}
  self.version = "0.2"
  self.name = "Simply Tracked"
  self.author = "Omnyist Production"
  self.description = "Simply tracks checkpoints reached in a given IronMON run."
  self.github = "omnypro/simply-tracked"
  self.url = string.format("https://github.com/%s", self.github or "")

  self.FilesAndFolders = {
    Folder = "SimplyTracked",
    File = "simply-tracked.csv"
  }
  self.Paths = {
    DataCSV = ""
  }

  self.HEADERS =
    "Seed Number,Beat Lab,Beat First Trainer,Beat Rival 2,Beat Brock,Beat Rival 3,Beat Rival 4,Beat Misty,Beat Surge,Beat Rival 5,Beat Rocket Hideout,Beat Erika,Beat Koga,Beat Rival 6,Beat Silph,Beat Sabrina,Beat Blaine,Beat Giovanni,Beat Rival 7,Beat Lorelai,Beat Bruno,Beat Agatha,Beat Lance,Beat Champ"

  self.PerSeedVars = {
    PokemonDead = false
  }

  local function boolToInteger(input)
    return input and 1 or 0
  end

  -- Sets up the data which will be saved into the CSV.
  -- Inspired by SmackerTracker's pokemonInfoToTable function.
  -- https://github.com/WaffleSmacker/SmackerTracker-IronmonExtension/blob/main/SmackerTrackerFiles/SmackerTracker.lua
  local function pokemonInfoToTable(pokemon, labMon)
    print("pokemonInfoToTable")

    local info = {}
    if not PokemonData.isValid(pokemon.pokemonID) then
      return info
    end

    local seedNumber = Main.currentSeed

    -- Location Checkpoints
    local beat_first_trainer = boolToInteger(Program.hasDefeatedTrainer(102) or Program.hasDefeatedTrainer(115))
    local beat_rocket_hideout = boolToInteger(Program.hasDefeatedTrainer(348))
    local beat_silph = boolToInteger(Program.hasDefeatedTrainer(349))

    -- Rival Checkpoints
    local beat_rival_1 = boolToInteger(Program.hasDefeatedTrainer(326) or Program.hasDefeatedTrainer(327) or Program.hasDefeatedTrainer(328))
    local beat_rival_2 = boolToInteger(Program.hasDefeatedTrainer(329) or Program.hasDefeatedTrainer(330) or Program.hasDefeatedTrainer(331))
    local beat_rival_3 = boolToInteger(Program.hasDefeatedTrainer(332) or Program.hasDefeatedTrainer(333) or Program.hasDefeatedTrainer(334))
    local beat_rival_4 = boolToInteger(Program.hasDefeatedTrainer(426) or Program.hasDefeatedTrainer(427) or Program.hasDefeatedTrainer(428))
    local beat_rival_5 = boolToInteger(Program.hasDefeatedTrainer(429) or Program.hasDefeatedTrainer(430) or Program.hasDefeatedTrainer(431))
    local beat_rival_6 = boolToInteger(Program.hasDefeatedTrainer(432) or Program.hasDefeatedTrainer(433) or Program.hasDefeatedTrainer(434))
    local beat_rival_7 = boolToInteger(Program.hasDefeatedTrainer(435) or Program.hasDefeatedTrainer(436) or Program.hasDefeatedTrainer(437))
    local beat_champ = boolToInteger(Program.hasDefeatedTrainer(438) or Program.hasDefeatedTrainer(439) or Program.hasDefeatedTrainer(440))

    -- Gym Checkpoints
    local beat_brock = boolToInteger(Program.hasDefeatedTrainer(414))
    local beat_misty = boolToInteger(Program.hasDefeatedTrainer(415))
    local beat_surge = boolToInteger(Program.hasDefeatedTrainer(416))
    local beat_erika = boolToInteger(Program.hasDefeatedTrainer(417))
    local beat_koga = boolToInteger(Program.hasDefeatedTrainer(418))
    local beat_sabrina = boolToInteger(Program.hasDefeatedTrainer(420))
    local beat_blaine = boolToInteger(Program.hasDefeatedTrainer(419))
    local beat_giovanni = boolToInteger(Program.hasDefeatedTrainer(350))

    -- Elite 4 Checkpoints
    local beat_lorelai = boolToInteger(Program.hasDefeatedTrainer(410) or Program.hasDefeatedTrainer(735))
    local beat_bruno = boolToInteger(Program.hasDefeatedTrainer(411) or Program.hasDefeatedTrainer(736))
    local beat_agatha = boolToInteger(Program.hasDefeatedTrainer(412) or Program.hasDefeatedTrainer(737))
    local beat_lance = boolToInteger(Program.hasDefeatedTrainer(413) or Program.hasDefeatedTrainer(738))

    table.insert(info, tostring(seedNumber))
    table.insert(info, tostring(beat_rival_1))
    table.insert(info, tostring(beat_first_trainer))
    table.insert(info, tostring(beat_rival_2))
    table.insert(info, tostring(beat_brock))
    table.insert(info, tostring(beat_rival_3))
    table.insert(info, tostring(beat_rival_4))
    table.insert(info, tostring(beat_misty))
    table.insert(info, tostring(beat_surge))
    table.insert(info, tostring(beat_rival_5))
    table.insert(info, tostring(beat_rocket_hideout))
    table.insert(info, tostring(beat_erika))
    table.insert(info, tostring(beat_koga))
    table.insert(info, tostring(beat_rival_6))
    table.insert(info, tostring(beat_silph))
    table.insert(info, tostring(beat_sabrina))
    table.insert(info, tostring(beat_blaine))
    table.insert(info, tostring(beat_giovanni))
    table.insert(info, tostring(beat_rival_7))
    table.insert(info, tostring(beat_lorelai))
    table.insert(info, tostring(beat_bruno))
    table.insert(info, tostring(beat_agatha))
    table.insert(info, tostring(beat_lance))
    table.insert(info, tostring(beat_champ))
    return info
  end

  local loadedVarsThisSeed
  local function isPlayingFRLG()
    return GameSettings.game == 3
  end
  local function isPlayingE()
    return GameSettings.game == 2
  end
  local function isPlayingFRorE()
    return isPlayingFRLG() or isPlayingE()
  end

  local function valueExistsInFirstColumn(filepath, checkValue)
    local file = io.open(filepath, "r")
    if not file then
      return false, "Could not open file " .. filepath
    end

    for line in file:lines() do
      local firstField = line:match("([^,]+)")
      if firstField == checkValue then
        file:close()
        return true
      end
    end

    file:close()
    return false
  end

  local function outputStatsToFile(pokemon, labMon, filepath)
    if not PokemonData.isValid(pokemon.pokemonID) then
      return false
    end

    print("outputStatsToFile")

    -- Check if the file exists.
    local fileExists = io.open(filepath, "r")
    print(filepath)
    if not fileExists then
      -- If the file does not exist, create it and write the headers.
      fileExists = io.open(filepath, "w")
      if fileExists then
        fileExists:write(self.HEADERS .. "\n")
        fileExists:close()
      end
    else
      -- If the file exists, close it.
      fileExists:close()
    end

    -- Append the data to the file.
    local file = io.open(filepath, "a")
    if file then
      local linesToWrite = pokemonInfoToTable(pokemon, labMon) or {}
      local csvLine = table.concat(linesToWrite, ",") .. "\n" -- Add a newline character to the end of the line.
      file:write(csvLine)
      file:close()
    end

    return true
  end

  --------------------------------------
  -- INTENRAL TRACKER FUNCTIONS BELOW
  --------------------------------------

  -- Executed when the user clicks the "Check for Updates" button while viewing the extension details within the Tracker's UI
  function self.checkForUpdates()
    -- Update the pattern below to match your version. You can check what this looks like by visiting the latest release url on your repo
    local versionResponsePattern = '"tag_name":%s+"%w+(%d+%.%d+)"' -- matches "1.0" in "tag_name": "v1.0"
    local versionCheckUrl = string.format("https://api.github.com/repos/%s/releases/latest", self.github or "")
    local downloadUrl = string.format("%s/releases/latest", self.url or "")
    local compareFunc = function(a, b)
      return a ~= b and not Utils.isNewerVersion(a, b)
    end -- if current version is *older* than online version
    local isUpdateAvailable =
      Utils.checkForVersionUpdate(versionCheckUrl, self.version, versionResponsePattern, compareFunc)
    return isUpdateAvailable, downloadUrl
  end

	function self.getHpPercent()
		local leadPokemon = Tracker.getPokemon(1, true) or Tracker.getDefaultPokemon()
		if PokemonData.isValid(leadPokemon.pokemonID) then
			local hpPercentage = (leadPokemon.curHP or 0) / (leadPokemon.stats.hp or 100)
			if hpPercentage >= 0 then
				return hpPercentage
			end
		end
	end

  function self.resetSeedVars()
    local V = self.PerSeedVars
    V.PokemonDead = false
    V.WonKaizo = false
    V.FirstPokemon = false
    V.FirstPokemonId = ""
  end

  -- Executed once every 30 frames, after most data from game memory is read in
  function self.afterProgramDataUpdate()
    -- Once per seed, when the player is able to move their character, initialize the seed variables
    if not isPlayingFRLG() or not Program.isValidMapLocation() then
      return
    elseif not loadedVarsThisSeed then
      self.resetSeedVars()
      loadedVarsThisSeed = true
    end
    local V = self.PerSeedVars
    local leadPokemon = Tracker.getPokemon(1, true) or Tracker.getDefaultPokemon()
    local alreadyExists = false
    if isPlayingFRorE() and leadPokemon.pokemonID ~= nil and leadPokemon.pokemonID ~= 0 and not V.FirstPokemon then
      V.FirstPokemonId = leadPokemon.pokemonID
      V.FirstPokemon = true
      local seedNumber = Main.currentSeed
      alreadyExists = valueExistsInFirstColumn(self.Paths.DataCsv, tostring(seedNumber))
    end
    -- Set up variable to use in the following checks.
    local hpPercentage = self.getHpPercent()
    -- Lead Pokemon Died
    if hpPercentage ~= nil and hpPercentage == 0 and V.PokemonDead == false and not alreadyExists then
      print("Pokemon Died")
      V.PokemonDead = true
      outputStatsToFile(leadPokemon, V.FirstPokemonId, self.Paths.DataCsv)
    end
    if
      (Program.hasDefeatedTrainer(438) or Program.hasDefeatedTrainer(439) or Program.hasDefeatedTrainer(440)) and
        not V.WonKaizo and
        not alreadyExists
     then
      print("Won Kaizo")
      V.WonKaizo = true
      outputStatsToFile(leadPokemon, V.FirstPokemonId, self.Paths.DataCsv)
    end
  end

  -- Executed only once: When the extension is enabled by the user, and/or when the Tracker first starts up, after it loads all other required files and code
  function self.startup()
    -- Build the path to the files within the extension's folder.
    local extFolderPath = FileManager.getCustomFolderPath() .. self.FilesAndFolders.Folder .. FileManager.slash
    self.Paths.DataCsv = extFolderPath .. self.FilesAndFolders.File
  end

  return self
end
return SimplyTracked
