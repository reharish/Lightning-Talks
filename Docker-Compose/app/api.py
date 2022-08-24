from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class Asgard(Resource):
    def get(self):
        return { "people": ['Thor',
                            'Odin',
                            'Loki',
                            'Hela'] }


api.add_resource(Asgard, "/people")

if __name__ == '__main__':
    app.run("0.0.0.0", port=80, debug=False)