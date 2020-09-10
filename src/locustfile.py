from locust import HttpLocust, between
from tasks.ApiTasks import ApiTasks
import os

class ApiUser(HttpLocust):
    task_set = ApiTasks
    wait_time = between(1, 5)
    host = os.getenv('TARGET_HOST', 'target-host.localhost')
