import random

# Seed for reproducibility
random.seed(42)

# Common Indian/International Names, Nationalities, Cities, Airlines, Genders
first_names = ["Amit", "Rajesh", "Priya", "Rahul", "Anjali", "Suresh", "Vikram", "Neha", "Sunita", "Deepak",
               "John", "Mary", "David", "James", "Sarah", "Michael", "Emily", "Robert", "Jessica", "William",
               "Arjun", "Karan", "Kunal", "Sneha", "Aditya", "Rohan", "Pooja", "Siddharth", "Aisha", "Kabir",
               "Ravi", "Sanjay", "Vijay", "Anita", "Geeta", "Kiran", "Madhav", "Manish", "Divya", "Harish"]
last_names = ["Sharma", "Patel", "Singh", "Kumar", "Gupta", "Mehta", "Joshi", "Verma", "Rao", "Nair",
              "Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Garcia", "Rodriguez", "Wilson",
              "Choudhury", "Bose", "Sen", "Das", "Reddy", "Rao", "Kulkarni", "Deshmukh", "Pillai", "Menon",
              "Kapoor", "Khan", "Malhotra", "Sethi", "Bahl", "Grover", "Anand", "Bansal", "Goel", "Mittal"]

# Added Patna to the list of cities
cities = ["Delhi", "Mumbai", "Bangalore", "Chennai", "Kolkata", "Goa", "Hyderabad", "Pune", "Ahmedabad", "Jaipur", "Patna"]
airlines = ["Air India", "IndiGo", "SpiceJet", "Vistara", "Akasa Air"]
genders = ["Male", "Female"]
nationalities = ["Indian", "American", "British", "Canadian", "Australian"]

# Helper to generate unique codes
def generate_unique_pnr(index):
    return f"PNR-{100000 + index}"

def generate_unique_ticket(index):
    return f"TIC-{1000 + index}"

def generate_unique_cancel(index):
    return f"CAN-{2000 + index}"

# 1. Generate 100 flights
flights = []
flight_codes = set()

# Explicit connections requested by the user:
explicit_connections = []
other_cities = [c for c in cities if c != "Delhi"]

# Connect Delhi to all other cities (both ways)
for city in other_cities:
    explicit_connections.append(("Delhi", city))
    explicit_connections.append((city, "Delhi"))

# Add Bangalore to Delhi explicitly (guaranteed to be in list, but let's be safe)
if ("Bangalore", "Delhi") not in explicit_connections:
    explicit_connections.append(("Bangalore", "Delhi"))

# Add explicit connection flights first
for src, dest in explicit_connections:
    airline = random.choice(airlines)
    prefix = "AI" if airline == "Air India" else ("6E" if airline == "IndiGo" else ("SG" if airline == "SpiceJet" else ("UK" if airline == "Vistara" else "QP")))
    code = f"{prefix}-{random.randint(100, 999)}"
    while code in flight_codes:
        code = f"{prefix}-{random.randint(100, 999)}"
    flight_codes.add(code)
    flights.append({
        "f_code": code,
        "f_name": airline,
        "source": src,
        "destination": dest
    })

# Add random flights until we reach 100
while len(flights) < 100:
    airline = random.choice(airlines)
    prefix = "AI" if airline == "Air India" else ("6E" if airline == "IndiGo" else ("SG" if airline == "SpiceJet" else ("UK" if airline == "Vistara" else "QP")))
    code = f"{prefix}-{random.randint(100, 999)}"
    if code not in flight_codes:
        src, dest = random.sample(cities, 2)
        flight_codes.add(code)
        flights.append({
            "f_code": code,
            "f_name": airline,
            "source": src,
            "destination": dest
        })

# 2. Generate 100 passengers
passengers = []
aadhar_set = set()
while len(passengers) < 100:
    name = f"{random.choice(first_names)} {random.choice(last_names)}"
    nationality = random.choice(nationalities)
    phone = "".join([str(random.randint(0, 9)) for _ in range(10)])
    if phone.startswith("0"):
        phone = str(random.randint(7, 9)) + phone[1:]
    address = f"{random.randint(1, 999)}, Lane {random.randint(1, 20)}, {random.choice(cities)}"
    aadhar = "".join([str(random.randint(0, 9)) for _ in range(12)])
    if aadhar not in aadhar_set and not aadhar.startswith("0"):
        aadhar_set.add(aadhar)
        passengers.append({
            "name": name,
            "nationality": nationality,
            "phone": phone,
            "address": address,
            "aadhar": aadhar,
            "gender": random.choice(genders)
        })

# 3. Generate 100 reservations (using the generated passengers and flights)
reservations = []
for i in range(100):
    passenger = passengers[i]
    flight = random.choice(flights)
    pnr = generate_unique_pnr(i)
    ticket = generate_unique_ticket(i)
    date = f"2026-06-{random.randint(10, 30):02d}"
    reservations.append({
        "pnr": pnr,
        "ticket": ticket,
        "aadhar": passenger["aadhar"],
        "name": passenger["name"],
        "nationality": passenger["nationality"],
        "flightname": flight["f_name"],
        "flightcode": flight["f_code"],
        "src": flight["source"],
        "des": flight["destination"],
        "date": date
    })

# 4. Generate 30 cancellations
cancels = []
canceled_reservations = random.sample(reservations, 30)
for idx, res in enumerate(canceled_reservations):
    cancel_no = generate_unique_cancel(idx)
    cancels.append({
        "pnr": res["pnr"],
        "name": res["name"],
        "cancelno": cancel_no,
        "fcode": res["flightcode"],
        "date": res["date"]
    })

# Generate SQL Output
sql_content = []
sql_content.append("USE airlinemanagementsystem;\n")
sql_content.append("-- Disable checks temporarily to load data quickly\n")
sql_content.append("SET FOREIGN_KEY_CHECKS = 0;\n")
sql_content.append("TRUNCATE TABLE flight;\n")
sql_content.append("TRUNCATE TABLE passenger;\n")
sql_content.append("TRUNCATE TABLE reservation;\n")
sql_content.append("TRUNCATE TABLE cancel;\n\n")

sql_content.append("-- 1. Insert flights\n")
for f in flights:
    sql_content.append(f"INSERT INTO flight (f_code, f_name, source, destination) VALUES ('{f['f_code']}', '{f['f_name']}', '{f['source']}', '{f['destination']}');\n")

sql_content.append("\n-- 2. Insert passengers\n")
for p in passengers:
    sql_content.append(f"INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('{p['name']}', '{p['nationality']}', '{p['phone']}', '{p['address']}', '{p['aadhar']}', '{p['gender']}');\n")

sql_content.append("\n-- 3. Insert reservations\n")
for r in reservations:
    sql_content.append(f"INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('{r['pnr']}', '{r['ticket']}', '{r['aadhar']}', '{r['name']}', '{r['nationality']}', '{r['flightname']}', '{r['flightcode']}', '{r['src']}', '{r['des']}', '{r['date']}');\n")

sql_content.append("\n-- 4. Insert cancellations\n")
for c in cancels:
    sql_content.append(f"INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('{c['pnr']}', '{c['name']}', '{c['cancelno']}', '{c['fcode']}', '{c['date']}');\n")

sql_content.append("\nSET FOREIGN_KEY_CHECKS = 1;\n")

# Write to file
with open("populate_data.sql", "w", encoding="utf-8") as f:
    f.writelines(sql_content)

print("Generated populate_data.sql successfully with Patna included and Delhi connected to all cities.")
