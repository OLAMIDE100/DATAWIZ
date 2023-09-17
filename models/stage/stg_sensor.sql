select * 
from {{ source('source_data','SENSORDATARAW')}}