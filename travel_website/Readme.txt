						*****************************************************************************    
							         Hotel Reservation User Document 
						*****************************************************************************

Deployment and Run Information:

 	1. Deploy "project" folder on to the tomcat webapp folder.
		project folder contains source code and byte code which is generated using javac compiler
	
	2. "env-setup-for-tomcat.bat", Initially we should run this batch file. Here all the required environmental variables are set.

	3. Once all the ENV variables are set, Start the mongoDB server and tomcat server.

	4. After all the initial setup, type the following URL in browser.

	   http://localhost:8080/project/

----------------------------------------------------
Steps to Restore the Database file to MongoDB:
----------------------------------------------------
The database folder name is "HotelReservation"

To restore the database files to mongoDB server use:

Go to the bin directory of MongoDB server and run the following command,

mongorestore.exe --db HotelReservation /path/to/DBfolder/

---------------------------------------------------
Number of lines of code for each technology used
---------------------------------------------------
JSP: 4185

Servlet: 1000

Javascript: 26

Total number of Lines: 5211 lines

----------------------------------------------------
System Requirements:
----------------------------------------------------
Mongo DB
Apache Tomcat-7.0.34
jdk 1.7
Browsers like Chrome, Firefox which are compatible.

-----------------------------------------------------
Application Overview:
-----------------------------------------------------
There are two users:

  	1. Admin

	2. Customer

---------------------------------------------------
Admin User:
---------------------------------------------------

    User Name: admin

    Password: admin

Note: These values are hardcoded in the code

    
Admin user can add/update/delete hotel, hotel amenities, hotel rooms, special offers and things to do.

Note: Room discount and coupons could be added by admin user can be viewed and used only by logging in as customer.

---------------------------------------------------
Customer:
---------------------------------------------------
Note:
* User needs to create an account first and login in order to book a room, write review and view their reservations.
* While creating an account users will provide their credit card details inorder to make the booking easier.
* Users can search for hotels based on hotel name and city where it is located using the search bar provided.
* While searching city name will be appended with hotel names being suggested.

Customer can,

	1. View hotels based on location.

	2. View Review

	3. Write a review

	4. Book an hotel room by selecting their desired room type.
	
	5. Cancel the booking

	6. View the reservations and also cancel it.

	6. Customers can view party halls for events like Birthday, Marriages and conference.

	7. Customer can view things to do in their respective location.






  

