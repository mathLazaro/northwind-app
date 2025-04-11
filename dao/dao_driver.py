import psycopg2

def _get_connection():
    try:
        northwind = psycopg2.connect(
            host='localhost',
            dbname='postgres', 
            user = 'postgres', 
            password = 'postgres'
        )
        return northwind
    except Exception as e:
        raise e

def select_all(table):
    query = f'SELECT * FROM northwind.{table}'
    try:
        with _get_connection() as conn:
            with conn.cursor() as cursor:
                cursor.execute(query)
                results = cursor.fetchall()
                return [dict(zip([desc[0] for desc in cursor.description], row)) for row in results]
    except Exception as e:
        raise e