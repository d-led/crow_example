from locust import HttpLocust, TaskSet

def count(l):
    l.client.post("/count")

class UserBehavior(TaskSet):
    def on_start(self):
        count(self)

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait=5000
    max_wait=9000
