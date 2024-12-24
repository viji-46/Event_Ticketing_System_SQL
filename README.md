
## Event Ticketing System In SQL

The Event Ticketing System is designed to simplify the process of event management and ticket booking. It allows event organizers to create and manage events, track ticket inventory, and provide seamless booking experiences for users.



## Features

Event Management:
     Create, update, and delete events with detailed descriptions.

User Management:
     Secure user registration and login.
     
Ticket Booking:
     Real-time ticket reservation and purchase.

Payment Processing:
     Secure payment handling with detailed transaction records.

Reports and Analytics:
     Generate reports for sales, revenue, and popular events.
     
Admin Controls:
     Manage users, events, and bookings via an admin dashboard.
   


## Tool Used

Database: MYSQL
## Table Used:

Events:
   Manages event details.

Ticket: 
  Handles ticket types and pricing for events.

Customers: 
  Stores customer data.

Reservations: 
  Tracks reservations of customers for specific events.

Sales:
  Logs ticket sales transactions.

## Functional Coverage
Event Management: Tracks event-specific details like date, location, and seating capacity.

Customer Management: Handles customer registration with unique email constraints.

Reservations and Sales: Tracks reserved seats and sales with detailed transactional data.

 Advanced Querying Subqueries:
Efficient data retrieval (e.g., maximum/minimum event ID).

Joins: Enable complex queries linking customers, reservations, and events.

Views: Abstract commonly queried data (ReservationDetails).

Stored Procedure:The procedure GetTotalSales simplifies revenue calculations for specific ticket.

## Query Insights

Efficient Retrieval:Queries like sorting tickets by price, retrieving customer reservation details, or calculating total sales demonstrate robust querying capabilities.

Aggregations:The use of SUM() for ticket pricing and subqueries for fetching event details adds depth to analysis.

Data Representation:String functions (UCASE, LCASE) and concatenations provide flexibility in presenting data.


## Conclusion

The database design is robust and supports core functionalities for managing events, tickets, customers, reservations, and sales. With minor improvements, such as dynamic seat tracking, cancellation handling, and enhanced analytics, it can serve as a comprehensive solution for event ticketing.