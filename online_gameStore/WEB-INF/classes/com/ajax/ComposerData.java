package com.ajax;

import java.util.HashMap;

/**
 *
 * @author nbuser
 */
public class ComposerData {
    
    private HashMap composers = new HashMap();
    

    public HashMap getComposers() {
        return composers;
    }
    
    public ComposerData() {
        
        composers.put("1", new Composer("1", "XBOX 360", "MicroSoft", "GamingConsole"));
        composers.put("2", new Composer("2", "XBOX One", "MicroSoft", "GamingConsole"));
        composers.put("3", new Composer("3", "PlayStation 3", "Sony", "GamingConsole"));
        composers.put("4", new Composer("4", "PlayStation 4", "Sony", "GamingConsole"));
        composers.put("5", new Composer("5", "Wii", "Nintendo", "GamingConsole"));
        composers.put("6", new Composer("6", "WiiU", "Nintendo", "GamingConsole"));
        composers.put("7", new Composer("7", "GTA5", "MicroSoft", "Game"));
        composers.put("8", new Composer("8", "SuperMario", "Nintendo", "Game"));
        composers.put("9", new Composer("9", "MineCraft", "MicroSoft", "Game"));
        composers.put("10", new Composer("10", "Warrenty For XBOX 360", "MicroSoft", "Warrenty"));
        composers.put("11", new Composer("11", "Warrenty For XBOX ONE", "MicroSoft", "Warrenty"));
        composers.put("12", new Composer("12", "Warrenty For PlayStation 3", "Sony", "Warrenty"));
        composers.put("13", new Composer("13", "Warrenty For PlayStation 4", "Sony", "Warrenty"));
        composers.put("14", new Composer("14", "Warrenty For Wii", "Nintendo", "Warrenty"));
        composers.put("15", new Composer("15", "Warrenty For WiiU", "Nintendo", "Warrenty"));
               
    }

}
