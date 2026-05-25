require "import"
import "cjson"
import "android.widget.*"
import "android.os.*"
import "android.view.*"
import "android.content.Context"
import "android.graphics.Color"
import "android.content.Intent"
import "android.net.Uri"
import "android.provider.MediaStore"
import "java.io.File"
import "android.text.InputType"
import "android.widget.LinearLayout$LayoutParams"
import "android.graphics.Typeface"
import "java.net.URLEncoder"
import "java.lang.System"
import "com.androlua.Http"
import "android.graphics.Bitmap"
import "android.graphics.BitmapFactory"
import "android.util.Base64"
import "java.io.ByteArrayOutputStream"
import "android.graphics.Rect"
import "android.view.accessibility.AccessibilityNodeInfo"
-- Service mode
local ctx = service
local File_CLASS = luajava.bindClass("java.io.File")
-- ==================== AUTO UPDATE CONFIGURATION ====================
local CURRENT_VERSION = "1.1"
local VERSION_URL = "https://raw.githubusercontent.com/nch77500-pixel/CSR-AI-Vision-Assistant/main/version.txt"
local UPDATE_CODE_URL = "https://raw.githubusercontent.com/nch77500-pixel/CSR-AI-Vision-Assistant/main/main.lua"
local PLUGIN_PATH = "/storage/emulated/0/解说/Plugins/CSR AI Vision Assistant/main.lua"
local updateInProgress = false
function trim(s)    
if s == nil then return "" end    
return tostring(s):gsub("^%s*(.-)%s*$", "%1")
end
function showUpdateErrorDialog(title, message)    
local errorDialog = LuaDialog(ctx)
    errorDialog.setTitle(title)
    errorDialog.setMessage(message)
    errorDialog.setButton("OK", function() errorDialog.dismiss() end)
    errorDialog.show()
end
function checkUpdate()    
if updateInProgress then
        showUpdateErrorDialog("Update In Progress", "An update is already in progress. Please wait.")        
return
