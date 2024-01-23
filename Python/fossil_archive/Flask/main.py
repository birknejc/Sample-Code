from flask import *
from Database_related.queries import FossilQueries


app = Flask(__name__, template_folder='../templates')


@app.route('/')
def landing_page():
    return render_template('index.html')


@app.route('/add_fossil', methods=['POST', 'GET'])
def add_fossil():
    queries = FossilQueries()
    if request.method == 'POST':
        # use name from add_fossil.html
        queries = FossilQueries(request.form['fossil_id'],
                                request.form['fossil_name'],
                                request.form['location'],
                                request.form['desc'],
                                request.form['date'])
        queries.insert_fossil()
    query_data = queries.fetch_fossil_data()
    queries.close_database()

    return render_template('add_fossil.html', fossildata=query_data)


if __name__ == "__main__":
    app.run()
