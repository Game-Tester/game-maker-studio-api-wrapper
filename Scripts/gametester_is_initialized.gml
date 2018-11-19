///gametester_is_initialized(scriptName)
var scriptName = argument0;

with gametester_get() {        
    if not self.initialized 
        then show_debug_message("Game Tester is not initialized! [" + scriptName + "]");
    
    return self.initialized;
}
