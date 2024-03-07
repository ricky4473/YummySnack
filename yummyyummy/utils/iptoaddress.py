from geoip2 import database

def iptoaddress(ip):
    reader=database.Reader('GeoLite2-City.mmdb')
    try:
        response=reader.city(ip)
        country=response.country.names.get('en','')
        city=response.city.names.get('en','')
    except:
        country='Private'
        city="IP"

    return {"country":country,"city":city}
