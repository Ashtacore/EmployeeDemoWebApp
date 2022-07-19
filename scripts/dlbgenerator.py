import names
import pyodbc
from datetime import datetime, timedelta
import random
from random_address import real_random_address

num_to_generate = 50

date_range_start = datetime.strptime('1/1/2008 1:30 PM', '%m/%d/%Y %I:%M %p')
date_range_end = datetime.strptime('1/1/2022 4:50 AM', '%m/%d/%Y %I:%M %p')

sql_connection_string = 'DRIVER={ODBC Driver 18 for SQL Server};SERVER=MSI-WIN\SQLEXPRESS;DATABASE=master;UID=sa;PWD=passwd;TrustServerCertificate=yes'
conn = pyodbc.connect(sql_connection_string)
cur = conn.cursor()

def random_date(start, end):
    delta = end - start
    int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
    random_second = random.randrange(int_delta)
    return start + timedelta(seconds=random_second)

if __name__ == '__main__':
    for loop in range(num_to_generate):
        employeeID = "%06d" % (loop + 1)
        lastName = names.get_last_name()
        firstName = names.get_first_name()
        middleName = names.get_first_name()
        hireDate = random_date(date_range_start, date_range_end)
        status = random.choice(['A', 'T'])
        typ = random.choice(['S', 'P'])
        org = random.choice(['Eng', 'Admin', 'Tech'])
        fullAddress = real_random_address()
        address1 = fullAddress['address1']
        address2 = fullAddress['address2']
        city = fullAddress['city']
        state = fullAddress['state']
        zip = fullAddress['postalCode']
        country = "US"
        phone = "%d-%d-%d" % (random.randint(100, 999), random.randint(100, 999), random.randint(1000, 9999))
        email = "%s%s@dlbassociates.com" % (firstName[0], lastName)
        title = random.choice(['Manager', 'Supervisor', 'Engineer', 'Administrator', 'Salesperson'])
        supervisor = "%06d" % (random.randint(1, num_to_generate))
        workPhone = "%d-%d-%d" % (random.randint(100, 999), random.randint(100, 999), random.randint(1000, 9999))
        workPhoneExt = "%d" % random.randint(100, 999)
        mobilePhone = random.choice(["%d-%d-%d" % (random.randint(100, 999), random.randint(100, 999), random.randint(1000, 9999)), None, None, None])
        createUser = "%06d" % random.randint(1, 4)
        modUser = createUser

        custService = random.choice(['MSI', 'Design', 'PMO', 'CX'])
        custTier = random.choice(['1', '2', '3', '4', '5', '6', '7'])
        custTechnical = random.choice(['Y', 'N'])

        cur.execute("INSERT INTO master.dbo.EM (Employee, LastName, FirstName, MiddleName, HireDate, Status, [Type], Org, Address1, Address2, City, State, ZIP, Country, HomePhone, EMail, Title, Supervisor, WorkPhone, WorkPhoneExt, MobilePhone, CreateUser, ModUser) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", 
                                               (employeeID, lastName, firstName, middleName, hireDate, status, typ, org, address1, address2, city, state, zip, country, phone, email, title, supervisor, workPhone, workPhoneExt, mobilePhone, createUser, modUser))

        cur.execute("INSERT INTO master.dbo.EmployeeCustomTabFields (Employee, CustService, CustTier, CustTechnical, CreateUser, ModUser) VALUES (?,?,?,?,?,?)", (employeeID, custService, custTier, custTechnical, createUser, modUser))

    cur.commit()
    cur.close()
    conn.close()