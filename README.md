# AroundTheWorld_SQL
This SQL code defines the schema for a database named "AroundTheWorld" that is used for organizing tours for tourists visiting various countries and cities.

    Table: Employee
        Contains information about the employees involved in the organization.
        Fields: id (auto-incrementing primary key), Name, Surname, Sallary (misspelled, should be Salary), Phone, Email, DateEmployement.

    Table: Countries
        Contains a list of countries where tours are offered.
        Fields: id (auto-incrementing primary key), Country.

    Table: Cities
        Contains a list of cities in the different countries where tours are offered.
        Fields: id (auto-incrementing primary key), City, CountryID (foreign key referencing Countries table).

    Table: Transport
        Contains types of transportation used for the tours.
        Fields: id (auto-incrementing primary key), Transport.

    Table: Tours
        Represents the individual tours organized.
        Fields: id (auto-incrementing primary key), Name, Price, StartDate, EndDate, MaxTourists, TransportID (foreign key referencing Transport table).

    Table: Tourists
        Stores information about tourists.
        Fields: id (auto-incrementing primary key), Name, Surname, Phone, Email, BirthDate, FutureToursID (foreign key referencing Tours table), PastToursID (foreign key referencing PastTours table).

    Table: Hotels
        Contains information about hotels in different cities.
        Fields: id (auto-incrementing primary key), Name, CityID (foreign key referencing Cities table), Picture (possibly storing hotel pictures).

    Table: Sights
        Represents sights/attractions in various cities.
        Fields: id (auto-incrementing primary key), Name, SightForMoney, Payment, CityID (foreign key referencing Cities table), Picture (possibly storing sight pictures).

    Table: PastTours
        Similar to Tours table but represents past tours.
        Fields: id (auto-incrementing primary key), Name, Price, StartDate, EndDate, MaxTourists, TransportID (foreign key referencing Transport table).

    Table: ToursCities
        A mapping table for many-to-many relationship between Tours and Cities.

    Table: ToursHotels
        A mapping table for many-to-many relationship between Tours and Hotels.

    Table: ToursSight
        A mapping table for many-to-many relationship between Tours and Sights.

    Table: TouristTour
        A mapping table for many-to-many relationship between Tourists and Tours, storing information about whether a tourist has a ticket for a specific tour.

    Table: Responsible
        A mapping table for many-to-many relationship between Employees and Tours, indicating which employee is responsible for which tour.

    Table: TicketsBought
        Contains information about the number of tickets bought for each tour.

    Table: InteresteadInTour
        A mapping table for many-to-many relationship between Tourists and Tours, indicating which tourists are interested in which tours.

Finally, the code includes triggers to enforce certain constraints on the data:

    StarEnd trigger ensures that the EndDate of a tour is after the StartDate.
    PastStarEnd trigger ensures that the EndDate of a past tour is after the StartDate.
    SightsPayment trigger checks that if a sight is "SightForMoney," a payment value greater than 0 is provided.
    Tickets_Bought trigger updates the TicketsBought table when a tourist purchases a ticket for a tour.
