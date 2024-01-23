from Database_related.queries import FossilQueries

queries = FossilQueries()


def input_fossil():
    data_fossils = queries.fetch_fossil_data()
    for info in data_fossils:
        fossil_id, fossil_name, location, description, date = info
        print(fossil_id)
        print(fossil_name)
        print(location)
        print(description)
        print(f"{date}\n")
    
    queries.fossil_id = input("Input a fossil ID")
    queries.fossil_name = input("Input a fossil name")
    queries.location = input("Input a fossil location")
    queries.description = input("Input a fossil description")
    queries.date = input("Input a date (YYYY-MM-DD")
    queries.insert_fossil()
    queries.close_database()


input_fossil()
