1 CUSTOMER = {CustomerNumber, FirstName, LastName, PostalCode, City, Phone, Email}
   with KCUSTOMER = {{CustomerNumber}}

2 ASSIGNEE = {AssigneeID, FirstName, LastName, PostalCode, City, Phone, Email, BankAccount}
   with KASSIGNEE = {{AssigneeID}}

3 POLICY = {ContractNumber, InsuranceNumber, StartDate, EndDate, Subject, DueDate, Status, CustomerNumber}
   with KPOLICY = {{ContractNumber}}, FKPOLICY = {CustomerNumber → CUSTOMER}

4 POLICYASSIGNEE = {ContractNumber, AssigneeID, Portion, PaymentDate}
   with KPA = {{ContractNumber, AssigneeID}}, FKPA = {ContractNumber → POLICY, AssigneeID → ASSIGNEE}
