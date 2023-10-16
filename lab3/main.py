from swiplserver import PrologMQI, PrologThread, create_posix_path
import re

BZ_PATH = r'C:\Users\11\Desktop\AISystems\lab1\main.pl'


class QueryProcessor:
    def run(self, prolog: PrologThread):
        res = prolog.query(self.form_query())
        if res:
            self.handle_success(res)
        else:
            self.handle_failure(res)

    def form_query(self):
        pass

    def handle_success(self, res):
        pass

    def handle_failure(self, res):
        pass


class FindTroopWithTypeAndFraction(QueryProcessor):
    def __init__(self, type, fraction):
        self.type = type
        self.fraction = fraction
    
    def form_query(self):
        return f"findTroopWithTypeInFraction(X, {self.type}, {self.fraction})"
    
    def handle_success(self, res):
        print(f'Found {len(res)} troops with fraction - "{self.fraction}" and type - "{self.type}"')
        for x in res:
            print(f'- {x["X"]}')
    
    def handle_failure(self, res):  
        print(print(f'No troops found with fraction - "{self.fraction}" and type - "{self.type}"'))

class IsAllTypesInFraction(QueryProcessor):
    def __init__(self, fraction):
        self.fraction = fraction

    def form_query(self):
        return f"isAllTypesInFraction({self.fraction})"
    
    def handle_success(self, res):
        print("YES")
    
    def handle_failure(self, res):
        print("NO")

class FindChildWithType(QueryProcessor):
    def __init__(self, troop, type):
        self.troop = troop
        self.type = type
    
    def form_query(self):
        return f"findChildWithType({self.troop}, X, {self.type})"
    
    def handle_success(self, res):
        print(f'Found {len(res)} troops to which can evolve {self.troop} with type - "{self.type}"')
        for x in res:
            print(f'- {x["X"]}')

class FindPredessor(QueryProcessor):
    def __init__(self, troop):
        self.troop = troop
    
    def form_query(self):
        return f"findPredessor({self.troop}, X)"
    
    def handle_success(self, res):
        print(f'Found {len(res)} troops which can evolve to troop - "{self.troop}"')
        for x in res:
            print(f'- {x["X"]}')


patterns = {
    r"What troop have type (.+) and fraction (.+)\?": FindTroopWithTypeAndFraction,
    r"Is there all types of troops in fraction (.+)\?": IsAllTypesInFraction,
    r"To which troop can evolve (.+) to have type (.+)\?": FindChildWithType,
    r"Which troop can evolve to troop (.+)\?": FindPredessor

}

with PrologMQI() as mqi:
    with mqi.create_thread() as pl:
        path = create_posix_path(BZ_PATH)
        print(pl.query(f'consult("{path}")'))

        while True:
            query = input('?- ')
            if query.lower() == 'exit':
                break

            for pattern in patterns:
                match = re.match(pattern, query, re.IGNORECASE)
                if match is None:
                    continue
                processor = patterns[pattern](*match.groups())
                processor.run(pl)
                break
            else:
                print("Invalid query!")