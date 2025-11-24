import unittest

class TestVPC(unittest.TestCase):
    def test_vpc_cidr(self):
        cidr = "10.0.0.0/16"
        self.assertEqual(cidr, "10.0.0.0/16")

if __name__ == '__main__':
    unittest.main()
