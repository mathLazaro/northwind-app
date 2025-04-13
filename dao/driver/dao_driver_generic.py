import psycopg2


class DaoDriverGeneric:

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

    def _get_col_len(self, table):
        query = "SELECT COUNT(*) AS total_colunas FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema = %s AND table_name = %s;"
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, ('northwind', table))
                    result = cursor.fetchone()
                    return result[0] if result else 0
        except Exception as e:
            raise e

    def select_all(self, table):
        query = f'SELECT * FROM northwind.{table}'
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, (table,))
                    results = cursor.fetchall()
                    return [dict(zip([desc[0] for desc in cursor.description], row)) for row in results]
        except Exception as e:
            raise e

    def generate_id(self, table, id_col) -> int:
        query = f"SELECT MAX({id_col}) FROM northwind.{table}"
        try:
            with self._get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query)
                    result = cursor.fetchone()
                    return (result[0] or 0) + 1
        except Exception as e:
            raise e

    def insert(self, table, input: dict):
        pass

    def select_by_id(self, table, id_col, id):
        pass

    def select_by(self, parameters: dict):
        pass
