from django.test import Client, TestCase


class HomeTestCase(TestCase):

    def test_home_page_returns_200(self):
        c = Client()
        response = c.get("/home/")
        self.assertEqual(response.status_code, 200)