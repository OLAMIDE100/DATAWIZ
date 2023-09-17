select * 
from {{ source('source_data','WEATHERDATARAW')}}