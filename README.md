# Parking Management System
   \
The application boasts immense potential that could revolutionize parking space management. It allows users to intuitively reserve spots, make payments, and cancel reservations. Employees have the capability to book spaces on behalf of clients and search the database for specific reservations. A key feature is the administrative dashboard, providing essential tools for application administrators.

![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/b8285a2b-c3a3-456f-8c40-da54cad04423)

The application includes:
* Login and registration 
  \
   When logging in, users need to enter their email and password. If the provided data is incorrect, a relevant message is displayed. If the user doesn't have an account, they must register. Creating user accounts in the system aims to automate the parking space management process. As a result, the system becomes more transparent and efficient, eliminating human errors and speeding up the reservation process. To ensure security, all data is properly protected and encrypted. In the application, there are 3 user roles: Client, Employee, and Administrator.
\
  ![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/0142a828-4ba5-4b0c-99e6-e068db5da691)
  ![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/1440e884-7de9-440d-9fa5-5bbedabd62ce)


* Users with the "client" role can:
  * Make parking space reservations:
    Users can reserve a specific parking spot of their choice. The reservation fee can be paid via bank transfer, BLIK, or in cash at the reception desk. Every reservation made sends an email to the user's address with detailed information and a link that allows for the activation of the reservation.
    \
    ![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/ddd084b9-effa-437c-b850-4322f2ee7fe1)
    ![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/2afe9292-85a3-48d0-87b8-f0741e881bbe)
    It's worth noting that the reservation form includes validation that takes into account the vehicle's license plate number, ensures the reservation date is not earlier than the current date, and checks that no fields are left empty. If incorrect data is provided, appropriate error messages are displayed within the form. Additionally, the form incorporates a reCAPTCHA security measure to protect against unauthorized access attempts.
    \
    ![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/b14c4744-ef5c-4cad-a621-c1666b53fe35)
  * Edit and delete reservations
    \
    In case of an erroneous reservation, the user can cancel or edit it.
    ![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/8fb511c5-ae8f-4dd9-9060-d802825305f1)
  * Browse the history of archived reservations.
    \
    Users have the ability to browse the history of their reservations, allowing them to track previous dates and parking spots, as well as any associated reservation fees.
    ![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/00999ed0-5c43-4451-a650-d600c9d3f623)
 
  * Contact form
    \
    Users also have the option to send email inquiries to the customer support department when in need of assistance or clarification.
    ![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/9900195a-2605-4baa-8587-38503aba151c)

* Users with the "employee" role can:
  * Make reservations on behalf of a client
  * Browse the list of all reservations in the system
![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/b03e7b6b-dc91-4264-8093-4bf0012800ca)

* Admin Dashboard
  \
  Using the ActiveAdmin gem, a dashboard for application administrators has been developed. The default dashboard homepage has been enriched with two charts. The first displays a pie chart showing the percentage of occupied parking spaces, while the second is a bar chart presenting the number of system users with a breakdown into roles, namely clients and employees registered in the system.

  ![image](https://github.com/Michal0002/ParkingManagementSystem/assets/44274110/b7eefd4f-a57f-42d2-85b7-244b2e65fa95)

  The dashboard also features various tabs. Administrators have insights into aspects such as user reservations, user list, list of parking regions, and the list of all parking spaces, etc.

STACK: 
* Ruby with Rails
	* gems used:
      * activeadmin
      * annotate
      * devise
      * chartkick
      * faker
      * recaptcha
      * rspec
* JavaScript
* Bootstrap
* SQLite
