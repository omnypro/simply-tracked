local function SimplyTracked()
  local self = {}
  self.version = "0.1"
  self.name = "Simply Tracked"
  self.author = "Omnyist Production"
  self.description = "Simply tracks checkpoints reached in a given IronMON run."
  self.github = "omnypro/simply-tracked"
  self.url = string.format("https://github.com/%s", self.github or "")

  --------------------------------------
  -- HEADERS

  -- Checkpoints recorded in the CSV file:
  ---- [id: 326, 327, 328]  Lab (Rival 1)
  ---- [id: 102, 115]       First Trainer
  ---- [id: 329, 330, 331]  Rival 2
  ---- [id: 414]            Brock
  ---- [id: 332, 333, 334]  Rival 3
  ---- [id: 426, 427, 428]  Rival 4
  ---- [id: 415]            Misty
  ---- [id: 416]            Surge
  ---- [id: 429, 430, 431]  Rival 5
  ---- [id: 348]            Rocket Hideout
  ---- [id: 417]            Erika
  ---- [id: 418]            Koga
  ---- [id: 432, 433, 434]  Rival 6
  ---- [id: 349]            Silph Co.
  ---- [id: 420]            Sabrina
  ---- [id: 419]            Blaine
  ---- [id: 350]            Giovanni
  ---- [id: 435, 436, 437]  Rival 7
  ---- [id: 410, 735]       Lorelai
  ---- [id: 411, 736]       Bruno
  ---- [id: 412, 737]       Agatha
  ---- [id: 413, 738]       Lance
  ---- [id: 438, 439, 440]  Champ  
  --------------------------------------
  self.HEADERS = "Seed Number,Beat Lab,Beat First Trainer,Beat Rival 2,Beat Brock,Beat Misty,Beat Surge,Beat Erika,Beat Koga,Beat Sabrina,Beat Blaine,Beat Giovanni,Beat Lorelai,Beat Bruno,Beat Agatha,Beat Lance,Beat Champ"

	--------------------------------------
	-- INTENRAL TRACKER FUNCTIONS BELOW
	--------------------------------------

	-- Executed when the user clicks the "Check for Updates" button while viewing the extension details within the Tracker's UI
	function self.checkForUpdates()
		-- Update the pattern below to match your version. You can check what this looks like by visiting the latest release url on your repo
		local versionResponsePattern = '"tag_name":%s+"%w+(%d+%.%d+)"' -- matches "1.0" in "tag_name": "v1.0"
		local versionCheckUrl = string.format("https://api.github.com/repos/%s/releases/latest", self.github or "")
		local downloadUrl = string.format("%s/releases/latest", self.url or "")
		local compareFunc = function(a, b) return a ~= b and not Utils.isNewerVersion(a, b) end -- if current version is *older* than online version
		local isUpdateAvailable = Utils.checkForVersionUpdate(versionCheckUrl, self.version, versionResponsePattern, compareFunc)
		return isUpdateAvailable, downloadUrl
	end

  return self
end
return SimplyTracked
