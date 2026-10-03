// Paste into Developer Console > Debug > Open Execute Anonymous Apex, tick "Open Log", click Execute.
List<Customer__c> customers = new List<Customer__c>{
    new Customer__c(Name='Arun Kumar',  Email__c='arun.kumar@example.com',  Phone__c='9876543210', Address__c='12 Anna Salai',   City__c='Chennai',   State__c='Tamil Nadu', Customer_Type__c='Individual'),
    new Customer__c(Name='Priya Nair',  Email__c='priya.nair@example.com',  Phone__c='9845012345', Address__c='45 MG Road',      City__c='Bengaluru', State__c='Karnataka',  Customer_Type__c='Individual'),
    new Customer__c(Name='Sri Traders', Email__c='orders@sritraders.com',   Phone__c='9000012345', Address__c='7 Hitech City',   City__c='Hyderabad', State__c='Telangana',  Customer_Type__c='Business')
};
insert customers;

List<Branch__c> branches = new List<Branch__c>{
    new Branch__c(Name='Chennai Central',  Branch_Code__c='CHN001', City__c='Chennai',   Phone__c='4412345678', Manager_Name__c='Ravi Shankar'),
    new Branch__c(Name='Bengaluru South',  Branch_Code__c='BLR001', City__c='Bengaluru', Phone__c='8012345678', Manager_Name__c='Meena Iyer'),
    new Branch__c(Name='Hyderabad Hub',    Branch_Code__c='HYD001', City__c='Hyderabad', Phone__c='4012345678', Manager_Name__c='Imran Khan')
};
insert branches;

List<Delivery_Agent__c> agents = new List<Delivery_Agent__c>{
    new Delivery_Agent__c(Name='Karthik R',  Phone__c='9111122222', Email__c='karthik@cms.example.com', Vehicle_Number__c='TN01AB1234', Availability__c='Available',   Branch__c=branches[0].Id),
    new Delivery_Agent__c(Name='Divya S',    Phone__c='9222233333', Email__c='divya@cms.example.com',   Vehicle_Number__c='KA05CD5678', Availability__c='On Delivery', Branch__c=branches[1].Id),
    new Delivery_Agent__c(Name='Suresh M',   Phone__c='9333344444', Email__c='suresh@cms.example.com',  Vehicle_Number__c='TS09EF9012', Availability__c='Available',   Branch__c=branches[2].Id)
};
insert agents;

List<Shipment__c> shipments = new List<Shipment__c>{
    new Shipment__c(Customer__c=customers[0].Id, Branch__c=branches[0].Id, Delivery_Agent__c=agents[0].Id, Pickup_Address__c='12 Anna Salai, Chennai',   Delivery_Address__c='45 MG Road, Bengaluru',   Weight__c=2.5,  Shipping_Cost__c=250, Shipment_Type__c='Express',  Expected_Delivery_Date__c=Date.today().addDays(3)),
    new Shipment__c(Customer__c=customers[1].Id, Branch__c=branches[1].Id, Delivery_Agent__c=agents[1].Id, Pickup_Address__c='45 MG Road, Bengaluru',    Delivery_Address__c='7 Hitech City, Hyderabad', Weight__c=5.0,  Shipping_Cost__c=480, Shipment_Type__c='Standard', Expected_Delivery_Date__c=Date.today().addDays(5)),
    new Shipment__c(Customer__c=customers[2].Id, Branch__c=branches[2].Id, Delivery_Agent__c=agents[2].Id, Pickup_Address__c='7 Hitech City, Hyderabad',  Delivery_Address__c='12 Anna Salai, Chennai',   Weight__c=12.0, Shipping_Cost__c=900, Shipment_Type__c='Standard', Shipment_Date__c=Date.today().addDays(-10), Expected_Delivery_Date__c=Date.today().addDays(-5))
};
insert shipments;   // flow "Create Invoice For Shipment" creates one invoice per shipment

// Tracking history: the flow "Auto Update Shipment Status" copies each status to the shipment
insert new List<Delivery_Update__c>{
    new Delivery_Update__c(Shipment__c=shipments[0].Id, Update_Status__c='Picked Up',  Location__c='Chennai Central Hub', Remarks__c='Picked up from sender'),
    new Delivery_Update__c(Shipment__c=shipments[1].Id, Update_Status__c='In Transit', Location__c='Bengaluru Sorting Centre', Remarks__c='Left the branch')
};
insert new List<Delivery_Update__c>{
    new Delivery_Update__c(Shipment__c=shipments[1].Id, Update_Status__c='Delivered',  Location__c='Hyderabad', Remarks__c='Delivered and signed')
};
System.debug('Sample data loaded');
