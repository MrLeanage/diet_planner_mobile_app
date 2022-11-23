#importing required libraries
import json
import numpy as np
from tensorflow import keras
import pickle
import pandas as pd
from sklearn.cluster import KMeans
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

#defining constants
project_name = "dietplanner"
data_folder_path = '/home/'+ project_name + '/mysite/data/'


def welcome_chat_user():
    code_status = ""
    chat_response = {}
    try:
        with open('/home/'+ project_name + '/mysite/indents.json') as file:
            data = json.load(file)

        np_greeting = ""
        np_welcome_note_1 = ""
        np_welcome_note_2 = ""
        np_sentence_connector = ""

        for i in data['intents']:
            if i['tag'] == "greeting":
                np_greeting = str( np.random.choice(i['responses']))
            if i['tag'] == "welcome-note-1":
                np_welcome_note_1 = str(np.random.choice(i['responses']))
            if i['tag'] == "welcome-note-2":
                np_welcome_note_2 = str(np.random.choice(i['responses']))
            if i['tag'] == "sentence-connector":
                np_sentence_connector = str(np.random.choice(i['responses']))
        code_status = "success"
        chat_response = {
            "greeting" : np_greeting,
            "welcome-note-1" : np_welcome_note_1,
            "sentence-connector" : np_sentence_connector
        }

    except Exception as exp1:
        code_status = "failed : " + str(exp1)
    response = {
      "response" : chat_response,
      "code_status" : code_status
      }

    return response


def analyse_user_input(input_data):
    bot_response = ""
    try:
        # load intend data
        with open('/home/'+ project_name + '/mysite/indents.json') as file:
            data = json.load(file)
         # load trained model
        model = keras.models.load_model('/home/'+ project_name + '/mysite/model/chatbot-model')

        # load tokenizer object

        with open('/home/'+ project_name + '/mysite/model/chatbot-model/tokenizer.pickle', 'rb') as handle:
            tokenizer = pickle.load(handle)

        # load label encoder object
        with open('/home/'+ project_name + '/mysite/model/chatbot-model/label_encoder.pickle', 'rb') as enc:
            lbl_encoder = pickle.load(enc)

        # parameters
        max_len = 20

        result = model.predict(keras.preprocessing.sequence.pad_sequences(tokenizer.texts_to_sequences([input_data]),
                                             truncating='post', maxlen=max_len))
        tag = lbl_encoder.inverse_transform([np.argmax(result)])

        for i in data['intents']:
            if i['tag'] == tag:
                bot_response = str( np.random.choice(i['responses']))
                #print(Fore.GREEN + "Happy Pet ChatBot:" + Style.RESET_ALL , np.random.choice(i['responses']))
        code_status = "success"
    except Exception as exp1:
        code_status = "failed : " + exp1

    response = {
      "response" : bot_response,
      "code_status" : code_status
      }

    return response

def getBMIAnalysis(ageData, heightData, weightData, preferenceData):
    age_class = ''
    bmi_msg = ''
    bmi_status = ''
    suggested_food_list = []
    thank_note = ''
    accuracy = ''
    code_status = 'failed'

    try :
        USER =  2

        if preferenceData.lower() == 'breakfast':
            USER = 1
        elif preferenceData.lower() == 'lunch':
            USER = 2
        elif preferenceData.lower() == 'dinner':
            USER = 3

        df_food = pd.read_csv(data_folder_path + 'food.csv')

        Breakfast_food = df_food['Breakfast']
        Breakfast_food_Numpy = Breakfast_food.to_numpy()

        Lunch_food = df_food['Lunch']
        Lunch_food_Numpy = Lunch_food.to_numpy()

        Dinner_food = df_food['Dinner']
        Dinner_food_Numpy = Dinner_food.to_numpy()

        Food_items = df_food['Food_items']

        breakfast_food_separated=[]
        Lunch_food_separated=[]
        Dinner_food_separated=[]

        breakfast_food_separated_ID=[]
        Lunch_food_separated_ID=[]
        Dinner_food_separated_ID=[]

        for i in range(len(Breakfast_food)):
            if Breakfast_food_Numpy[i]==1:
                breakfast_food_separated.append( Food_items[i] )
                breakfast_food_separated_ID.append(i)
            if Lunch_food_Numpy[i]==1:
                Lunch_food_separated.append(Food_items[i])
                Lunch_food_separated_ID.append(i)
            if Dinner_food_Numpy[i]==1:
                Dinner_food_separated.append(Food_items[i])
                Dinner_food_separated_ID.append(i)

        # retrieving Breafast data rows by loc method
        breakfast_food_separated_ID_data = df_food.iloc[breakfast_food_separated_ID]
        breakfast_food_separated_ID_data = breakfast_food_separated_ID_data.T
        val = list(np.arange(5,15))
        Val_apnd = [0]+val
        break_fast_food_separated_ID_data = breakfast_food_separated_ID_data.iloc[Val_apnd]
        breakfast_food_separated_ID_data = breakfast_food_separated_ID_data.T

        # retrieving Lunch data rows by loc method
        Lunch_food_separated_ID_data = df_food.iloc[Lunch_food_separated_ID]
        Lunch_food_separated_ID_data = Lunch_food_separated_ID_data.T
        val = list(np.arange(5,15))
        Val_apnd = [0]+val
        Lunch_food_separated_ID_data = Lunch_food_separated_ID_data.iloc[Val_apnd]
        Lunch_food_separated_ID_data = Lunch_food_separated_ID_data.T

        # retrieving Dinner Data rows by loc method
        Dinner_food_separated_ID_data = df_food.iloc[Dinner_food_separated_ID]
        Dinner_food_separated_ID_data = Dinner_food_separated_ID_data.T
        val = list(np.arange(5,15))
        Val_apnd = [0]+val
        Dinner_food_separated_ID_data = Dinner_food_separated_ID_data.iloc[Val_apnd]
        Dinner_food_separated_ID_data = Dinner_food_separated_ID_data.T

        #calculating BMI
        age = int(ageData)
        weight = float(weightData)
        height = float(heightData)
        # age = int(26)
        # weight = float(75)
        # height = float(184)
        bmi = weight/((height/100)**2)
        agewiseinp = 0


        for lp in range (0,80,20):
            test_list = np.arange(lp,lp+20)
            for i in test_list:
                if(i == age):
                    age_class = 'age is between ' + str(lp) + ' & ' + str(lp+10)
                    # print('age is between',str(lp),str(lp+10))
                    tr = round(lp/20)
                    agecal = round(lp/20)

         #conditions
        bmi_msg = "Your body mass index is: " + str(bmi)
        # print("Your body mass index is: ", bmi)
        if ( bmi < 16):
            bmi_status = "Acoording to your BMI, you are Severely Underweight"
            # print("Acoording to your BMI, you are Severely Underweight")
            calbmi=4
        elif ( bmi >= 16 and bmi < 18.5):
            bmi_status = "Acoording to your BMI, you are Underweight"
            # print("Acoording to your BMI, you are Underweight")
            calbmi=3
        elif ( bmi >= 18.5 and bmi < 25):
            bmi_status = "Acoording to your BMI, you are Healthy"
            # print("Acoording to your BMI, you are Healthy")
            calbmi=2
        elif ( bmi >= 25 and bmi < 30):
            bmi_status = "Acoording to your BMI, you are Overweight"
            # print("Acoording to your BMI, you are Overweight")
            calbmi=1
        elif ( bmi >=30):
            bmi_status = "Acoording to your BMI, you are Severely Overweight"
            # print("Acoording to your BMI, you are Severely Overweight")
            calbmi=0

        #converting into numpy array
        val1 = Dinner_food_separated_ID_data.describe()
        valTog = val1.T

        breakfast_food_separated_ID_data = breakfast_food_separated_ID_data.to_numpy()

        Lunch_food_separated_ID_data = Lunch_food_separated_ID_data.to_numpy()

        Dinner_food_separated_ID_data = Dinner_food_separated_ID_data.to_numpy()

        ti = (calbmi+agecal)/2

        ## K-Means Based breakfast Food
        calorie = breakfast_food_separated_ID_data[1:,1:len(breakfast_food_separated_ID_data)]

        X = np.array(calorie)
        kmeans = KMeans(n_clusters=3, random_state=0).fit(X)

        XVal = np.arange(0,len(kmeans.labels_))

        # retrieving the labels for breakfast food
        brklbl = kmeans.labels_

        #K-Means Based  lunch Food
        calorie = Lunch_food_separated_ID_data[1:,1:len(Lunch_food_separated_ID_data)]

        X = np.array(calorie)
        kmeans = KMeans(n_clusters=3, random_state=0).fit(X)

        XVal = np.arange(0,len(kmeans.labels_))

        # retrieving the labels for lunch food
        lnchlbl = kmeans.labels_

        #K-Means Based  Dinner Food
        calorie = Dinner_food_separated_ID_data[1:,1:len(Dinner_food_separated_ID_data)]

        X = np.array(calorie)
        kmeans = KMeans(n_clusters=3, random_state=0).fit(X)

        XVal = np.arange(0,len(kmeans.labels_))

        # retrieving the labels for dinner food
        dnrlbl = kmeans.labels_

        inp=[]
        ## Reading of the Dataet
        datafin = pd.read_csv(data_folder_path + 'nutrition_distriution.csv')
        datafin.head(5)

        ## train set
        dataTog = datafin.T
        bmicals = [0,1,2,3,4]
        agecals = [0,1,2,3,4]
        healthy_cat = dataTog.iloc[[1,2,3,4,6,7,9]]
        healthy_cat = healthy_cat.T
        healthy_cat_Ddata = healthy_cat.to_numpy()
        healthy_cat = healthy_cat_Ddata[1:,0:len(healthy_cat_Ddata)]


        healthy_cat_fin = np.zeros((len(healthy_cat)*5,9),dtype=np.float32)
        t=0
        r=0
        s=0
        yt=[]
        yr=[]
        ys=[]

        for zz in range(5):

            for jj in range(len(healthy_cat)):
                valloc = list(healthy_cat[jj])
                valloc.append(bmicals[zz])
                valloc.append(agecals[zz])
                healthy_cat_fin[t] = np.array(valloc)
                yt.append(brklbl[jj])
                t+=1

            for jj in range(len(healthy_cat)):
                valloc = list(healthy_cat[jj])
                valloc.append(bmicals[zz])
                valloc.append(agecals[zz])
                healthy_cat_fin[r] = np.array(valloc)
                yr.append(lnchlbl[jj])
                r+=1

            for jj in range(len(healthy_cat)):
                valloc = list(healthy_cat[jj])
                valloc.append(bmicals[zz])
                valloc.append(agecals[zz])
                healthy_cat_fin[s] = np.array(valloc)
                ys.append(dnrlbl[jj])
                s+=1

        X_test = np.zeros((len(healthy_cat)*5,9),dtype=np.float32)

        # print('\n')

        for jj in range(len(healthy_cat)):
            valloc = list(healthy_cat[jj])
            valloc.append(agecal)
            valloc.append(calbmi)
            X_test[jj] = np.array(valloc)*ti

        val=int(USER)

        if val==1:
            X_train = healthy_cat_fin
            y_train = yt

        elif val==2:
            X_train = healthy_cat_fin
            y_train = yr

        elif val==3:
            X_train = healthy_cat_fin
            y_train = ys

        #Create a Gaussian Classifier
        clf = RandomForestClassifier(n_estimators=100)

        #Train the model using the training sets y_pred=clf.predict(X_test)
        clf.fit(X_train,y_train)

        #X_test2=X_test
        y_pred = clf.predict(X_test)

        # print ('SUGGESTED FOOD ITEMS ::')
        for ii in range(len(y_pred)):
            if y_pred[ii]==2:
                suggested_food_list.append(Food_items[ii])
                # print (Food_items[ii])

        # print('\n Thank You for taking our recommendations. :)')
        thank_note = 'Thank You for taking our recommendations'
        accuracy = str(clf.score(X_train,y_train))
        # print('Accuracy:',clf.score(X_train,y_train))

        code_status = 'success'
        response = {
            'input-age' : ageData,
            'input-height' : heightData,
            'input-weight' : weightData,
            'input-preference' : preferenceData,
            'age-class' : age_class,
            'bmi-message' : bmi_msg,
            'bmi-status' : bmi_status,
            'suggested-food-list' : suggested_food_list,
            'thank-note' : thank_note,
            'accuracy' : accuracy,
            'code-status' : code_status
            }

    except Exception as exp1:
        response = {
            'input-age' : ageData,
            'input-height' : heightData,
            'input-weight' : weightData,
            'input-preference' : preferenceData,
            'code-status' : code_status,
            'error-code' : str(exp1)
        }

    return response