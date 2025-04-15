
from .dao_driver_generic import DaoDriverGeneric


class DaoDriverInjecion(DaoDriverGeneric):

    def __init__(self):
        super().__init__()

    # vulnerável a sql injection
    def select_by_id(self, table, id_col, id):
        query = f'SELECT * FROM northwind.{table} WHERE {id_col} = {id}'
        print(query)
        
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query)
                    row = cursor.fetchone()
                    if row:
                        return dict(zip([desc[0] for desc in cursor.description], row))
                return None
        except Exception as e:
            raise e

    # vulnerável a sql injection
    def select_by(self, parameters: dict):
        cols = ' , '.join([f"{col}" for col in parameters.keys()])
        condition = ' AND '.join(
            [f"{col} = '{par}'" for col, par in parameters.items()])
        query = f'SELECT * FROM northwind.{self.table} ({cols}) WHERE {condition}'
        print(query)

        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query)
                    row = cursor.fetchone()
                    if row:
                        return dict(zip([desc[0] for desc in cursor.description], row))
                return None
        except Exception as e:
            raise e

    # vulnerável a sql injection
    def insert(self, table, input: dict):
        cols = list(input.keys())
        values = list(input.values())

        col_names = ', '.join(cols)
        value_strings = ', '.join([f"'{v}'" for v in values])

        query = f"INSERT INTO northwind.{table} ({col_names}) VALUES ({value_strings})"
        print(query)

        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query)
        except Exception as e:
            raise e
