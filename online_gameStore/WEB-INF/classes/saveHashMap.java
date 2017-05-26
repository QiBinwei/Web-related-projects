package BinweiQi;

import java.util.*;
import java.io.*;

public class saveHashMap {
	public static void main(String[] args){
		FileInputStream fos;
		int i=0;
		try{
			//fos = new FileInputStream("D:/apache-tomcat-7.0.34/webapps/logintest/hashmap/customerInfo.txt");
			//ObjectInputStream ois=new ObjectInputStream(fos);
			//HashMap<String,Object> userInfo=new HashMap<String,Object>();
			List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
			//List<Map<String, Object>> list=(List<Map<String, Object>>) ois.readObject();
			Map<String, Object> userInfo1 = new HashMap<String, Object>();
			userInfo1.put("admin","cxing");
			/*for (Map<String, Object> item : list) {
				if(item.keySet().equals(userInfo1.keySet())){
					System.out.println("your userID already exists.");
					i=1;
					break;
				}
			}
			if(i!=1){*/
				list.add(userInfo1); 
				FileOutputStream fos1 = new FileOutputStream("C:/Program Files/Apache Software Foundation/Tomcat 7.0/webapps/BinweiQi/hashmap/customerInfo.txt");
				ObjectOutputStream oos = new ObjectOutputStream(fos1);
				oos.writeObject(list);
				fos1.close();
				System.out.print("<font size='2'>"+"register success!"+"</font>");
			//}
		
		}catch (Exception e) {
            e.printStackTrace();
        }
	}
}