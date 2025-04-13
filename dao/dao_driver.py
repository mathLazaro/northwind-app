import psycopg2


class DaoDriver:
    def __init__(self, table, id_column):
        self.table = table
        self.id_column = id_column

    def _get_connection(self):
        try:
            northwind = psycopg2.connect(
                host='localhost',
                dbname='postgres',
                user='postgres',
                password='postgres'
            )
            return northwind
        except Exception as e:
            raise e

    def _get_col_len(self):
        query = "SELECT COUNT(*) AS total_colunas FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema = %s AND table_name = %s;"
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, ('northwind', self.table))
                    result = cursor.fetchone()
                    return result[0] if result else 0
        except Exception as e:
            raise e

    def select_all(self):
        query = f'SELECT * FROM northwind.{self.table}'
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query)
                    results = cursor.fetchall()
                    return [dict(zip([desc[0] for desc in cursor.description], row)) for row in results]
        except Exception as e:
            raise e

    def select_by_id(self, id):
        query = f'SELECT * FROM northwind.{self.table} WHERE {self.id_column} = %s'
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, (id,))
                    row = cursor.fetchone()
                    if row:
                        return dict(zip([desc[0] for desc in cursor.description], row))
                return None
        except Exception as e:
            raise e

    def select_by_multiple_ids(self, conditions: dict):
        c = 0
        query = f'SELECT * FROM northwind.{self.table} WHERE '
        for col, q in conditions.items():
            c += 1
            query += f'{col} = %s'
            if c != len(conditions):
                query += ' AND '
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, tuple(conditions.values()))
                    row = cursor.fetchone()
                    if row:
                        return dict(zip([desc[0] for desc in cursor.description], row))
                return None
        except Exception as e:
            raise e

    def insert(self, input: dict):
        cols = list(input.keys())
        values = list(input.values())
        
        col_names = ', '.join(cols)
        placeholders = ', '.join(['%s'] * len(cols))

        query = f'INSERT INTO northwind.{self.table} ({col_names}) VALUES ({placeholders})'
        print(query)
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, tuple(input.values()))
        except Exception as e:
            raise e
    
    def generate_id(self):
        query = f"SELECT MAX({self.id_column}) FROM northwind.{self.table}"
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query)
                    result = cursor.fetchone()
                    return (result[0] or 0) + 1
        except Exception as e:
            raise e
