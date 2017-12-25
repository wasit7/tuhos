import os 
import pandas as pd
from django.conf import settings

# datapath = os.path.join('..', '..', 'zeppelin', 'data', 'poc')
datapath = settings.DATAPATH
def _read_csv(table):
    path = os.path.join(datapath, '{}.csv'.format(table))
    return pd.read_csv(path)

arinv = _read_csv('ARINV')[['invno','dbtno','invamt','rcptamt','argrp']]
arpt = _read_csv('ARPT')[['arno','hn','ardate']]
argrp = _read_csv('ARGRP')[['argrp','name']]
pt = _read_csv('PT')
occptn = _read_csv('OCCPTN')[['occptn','name']]
ptaddr = _read_csv('PTADDR')[['hn','changwat']]
changwat = _read_csv('CHANGWAT')[['changwat','name']]
provience = _read_csv('provience')

def get_debt_by_latlng():
    df = _read_csv('AR')[['arno', 'invno', 'invamt']]\
            .rename(columns={'invamt': 'ar_invamt'})\
            .merge(arinv, on='invno')\
            .drop_duplicates()\
            .rename(columns={'invamt': 'arinv_invamt'})\
            .rename(columns={'rcptamt': 'arinv_rcptamt'})\
            .merge(arpt, on='arno')\
            .merge(argrp, on='argrp')\
            .rename(columns={'name': 'argrp_name'})\
            .merge(pt, on='hn')\
            .merge(occptn, on='occptn')\
            .rename(columns={'name': 'occptn_name'})\
            .merge(ptaddr, on='hn')\
            .merge(changwat, on='changwat')\
            .drop(['changwat'], axis=1)\
            .rename(columns={'name': 'changwat_name'})
    basedf = df.merge(provience, left_on='changwat_name', right_on='CHANGWAT_T')\
                .drop(['CHANGWAT_T'], axis=1)
    invsum = basedf.groupby(['changwat_name'])['ar_invamt'].sum().to_dict()
    target_df = basedf[['changwat_name', 'LAT', 'LONG']].drop_duplicates()
    target_df['invsum'] = target_df['changwat_name'].map(invsum)
    return target_df.to_json(orient='records')
    

if __name__ == '__main__':
    print(get_debt_by_latlng())