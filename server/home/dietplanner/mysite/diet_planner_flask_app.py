
# A very simple Flask Hello World app for you to get started with...

from flask import Flask
from flask import request
import json
import time

from diet_planner_utility import analyse_user_input
from diet_planner_utility import welcome_chat_user
from diet_planner_utility import getBMIAnalysis

app = Flask(__name__)

@app.route('/getBMIAnalysis/', methods = ['GET', 'POST'])
def get_bmi_analysis_api():
    content = request.get_json(silent=True)
   #input json should array of diseases
    '''
        {
            "age" : "20",
            "weight" : "50",
            "height" : "170".
            "preference" : "Breakfast"
        }

    '''
    response = {}
    try:
        response = {
                "response" : getBMIAnalysis(content['age'], content['height'], content['weight'], content['preference']),
                "status" : 200,
                "timestamp" : time.time()
            }
    except Exception as exp1:
        response = {
                "status" : "400 : " + str(exp1),
                "timestamp" : time.time()
            }

    return json.dumps(response)

@app.route('/welcome_chat_user/', methods = ['GET', 'POST'])
def welcome_chat_user_api():
    #content = request.get_json(silent=True)
    #input json should array of diseases
    '''
        No input

    '''
    response = {}
    try:
        response = {
                "response" : welcome_chat_user(),
                "status" : 200,
                "timestamp" : time.time()
            }
    except Exception as exp1:
        response = {
                "status" : "400 : " + str(exp1),
                "timestamp" : time.time()
            }

    return json.dumps(response)

@app.route('/analyse_user_input/', methods = ['GET', 'POST'])
def analyse_user_input_api():
    content = request.get_json(silent=True)
    #input json should array of diseases
    '''
        {
            "user-input" : "Hello How are your"
        }

    '''
    response = {}
    try:
        response = {
                "response" : analyse_user_input(content['user-input']),
                "status" : 200,
                "timestamp" : time.time()
            }
    except:
        response = {
                "status" : 400,
                "timestamp" : time.time()
            }

    return json.dumps(response)
