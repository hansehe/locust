import datetime


def DictToRestQuery(data: dict):
    query = ''
    for key in data:
        query += f'&{key}={data[key]}'
    return query.replace('&', '?', 1)


def GetNowStr():
    return datetime.datetime.now().isoformat()
