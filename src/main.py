import os
from locust.main import main


def RunLocust():
    os.environ['LOCUST_HOST'] = os.getenv('LOCUST_HOST', 'https://target-host.localhost')
    os.environ['LOCUST_RUN_TIME'] = os.getenv('LOCUST_RUN_TIME', '1m')
    os.environ['LOCUST_HEADLESS'] = str(os.getenv('LOCUST_HEADLESS', True))
    os.environ['LOCUST_LOCUSTFILE'] = os.getenv('LOCUST_LOCUSTFILE', 'locustfile.py')
    os.environ['LOCUST_CLIENTS'] = str(os.getenv('LOCUST_CLIENTS', 10))
    os.environ['LOCUST_SPAWN_RATE'] = str(os.getenv('LOCUST_SPAWN_RATE', 10))
    main()


if __name__ == '__main__':
    RunLocust()
