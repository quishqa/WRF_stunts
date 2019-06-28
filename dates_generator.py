
import pandas as pd
from datetime import timedelta

# Simulation start date
date_start = '1/1/2018'

# Simulation end date
date_end = '30/1/2018'

# Days to do the reinitialising
days_reini = 5

# Creating a dataframe with dates
df = pd.DataFrame({'date1': pd.date_range(date_start, 
                                          date_end, 
                                          freq = str(days_reini) + 'D')})
df['date2'] = df['date1'] + timedelta(days = days_reini)
df['date2'].iloc[-1] = pd.to_datetime(date_end, format='%d/%m/%Y')  # This is to ensure that 
                                                                    # the last day of simulation

df['yi']  = df['date1'].dt.strftime('%Y')
df['mi']  = df['date1'].dt.strftime('%m')
df['di']  = df['date1'].dt.strftime('%d')

df['yf']  = df['date2'].dt.strftime('%Y')
df['mf']  = df['date2'].dt.strftime('%m')
df['df']  = df['date2'].dt.strftime('%d')


df.to_csv('dates.csv',sep=',', header=False, index=False)


