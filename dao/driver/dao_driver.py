
from .dao_driver_generic import DaoDriverGeneric


class DaoDriver(DaoDriverGeneric):

    def __init__(self):
        super().__init__()

    def select_by_id(self, table, id_col, id):
        query = f'SELECT * FROM northwind.{table} WHERE {id_col} = %s'
        print(query)
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, (id, ))
                    row = cursor.fetchone()
                    if row:
                        return dict(zip([desc[0] for desc in cursor.description], row))
            return None
        except Exception as e:
            raise e

    def select_by(self, table,  parameters: dict):
        conditions = ' AND '.join([f'{col} = %s' for col in parameters])
        query = f'SELECT * FROM northwind.{table} WHERE {conditions}'
        print(query)

        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, tuple(parameters.values()))
                    row = cursor.fetchone()
                    if row:
                        return dict(zip([desc[0] for desc in cursor.description], row))
            return None
        except Exception as e:
            raise e

    def insert(self, table, input: dict):
        cols = list(input.keys())
        values = list(input.values())

        col_names = ', '.join(cols)
        placeholders = ', '.join(['%s'] * len(cols))

        query = f'INSERT INTO northwind.{table} ({col_names}) VALUES ({placeholders})'
        print(query)
        
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, tuple(values))
        except Exception as e:
            raise e

    
