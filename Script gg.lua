-- ANW®©™ Script by Abg & Mi 💥 (v3 - Safe Android ID)

local info = gg.getTargetInfo()
local android_id = info and info.androidId or "CHIK"

gg.alert("📱 Android ID anda: " .. android_id)

local key = gg.prompt({"🔑 Masukkan KEY anda:"})[1]

if key == nil or key == "" then
    gg.alert("❌ KEY tidak dimasukkan!")
    os.exit()
end

local url = "https://raw.githubusercontent.com/ayobanw/All_in_script/refs/heads/main/SC%20ALL%20MENU%20NEW%204.9.2.lua"

local response = gg.makeRequest(url)
local body = response.content

if response.code ~= 200 then
    gg.alert("❌ Gagal hubung ke GitHub (kod " .. tostring(response.code) .. ").")
    os.exit()
end

if string.find(body, key .. ":" .. android_id) then
    gg.alert("✔ Key sah & ID sepadan. Selamat datang ke ☣️ⲀⲚⲰ ®©™☣️ Script!")

    

else
    gg.alert("❌ Key tidak sah atau bukan untuk device ini.")
    os.exit()
end

--masuk script 
local github_user = "ayobanw"
local repo_name = "All_in_script"
local script_file = "SC ALL MENU NEW 4.9.2.lua"

local script_url = "https://raw.githubusercontent.com/" .. github_user .. "/" .. repo_name .. "/main/" .. script_file

local function trim(s)
  return s:match("^%s*(.-)%s*$")
end

local scriptRequest = gg.makeRequest(script_url)
if not scriptRequest or not scriptRequest.content then
  gg.alert("❌ Gagal memuat skrip utama dari GitHub. Semak sambungan internet atau URL.")
  os.exit()
end

local func, err = load(scriptRequest.content)
if not func then
  gg.alert("❌ Ralat muat skrip utama: " .. tostring(err))
  os.exit()
end

func()
