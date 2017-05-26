package csp595a1;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.*;

public class rhma {
	public static void main(String[] args){
        try {
		String realPath="D:/apache-tomcat-7.0.34/webapps/logintest/hashmap/items.txt";  
        File file=new File(realPath);  
        FileInputStream fis = null;
		ObjectInputStream ois = null;
		fis = new FileInputStream(file);
		ois = new ObjectInputStream(fis);
		HashMap<String, ArrayList<String>> userInfo = new HashMap<String, ArrayList<String>>();
		List<Map<String,ArrayList<String>>> list = (List<Map<String, ArrayList<String>>>) ois.readObject();
		for (Map<String, ArrayList<String>> item : list) {
			Iterator it = item.entrySet().iterator();
			while(it.hasNext()){
			Map.Entry entry = (Map.Entry)it.next();
			String info=entry.getValue().toString();
			info=info.substring(1,info.length()-1);
			System.out.println(info);
			String[] infoList=info.split(",");
			String kind=infoList[0];
			String manuf=infoList[1].substring(1, infoList[1].length());
			double price=Double.parseDouble(infoList[2].substring(1, infoList[2].length()));
			System.out.println(entry.getKey());
			System.out.println(Arrays.toString(infoList));
			if(kind.equals("console")&&manuf.equals("Sony")){
					//System.out.println(Arrays.toString(infoList));
					//System.out.println(kind);
			}
			} 
		}
		ois.close(); 
        }catch (Exception e) {
        e.printStackTrace();
    }
}
}
