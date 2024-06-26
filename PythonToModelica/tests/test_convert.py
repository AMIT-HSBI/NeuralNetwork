import unittest
import numpy as np
from pythontomodelica.convert import to_modelica

class TestArray(unittest.TestCase):
  def test_numpy_vector_to_modelica(self):
    vector = np.arange(start=1.0, stop=4.0).reshape(3)
    modelica_string = to_modelica('x', vector)
    expected_string = "Real[3] x = {1, 2, 3};"
    self.assertEqual(modelica_string, expected_string)

  def test_numpy_matrix_to_modelica(self):
    matrix = np.arange(start=1, stop=7).reshape(2,3)
    modelica_string = to_modelica('x', matrix)
    expected_string = "Integer[2,3] x = {{1, 2, 3}, {4, 5, 6}};"
    self.assertEqual(modelica_string, expected_string)

  def test_numpy_tensor_to_modelica(self):
    tensor = np.arange(start=1.0, stop=28.0).reshape(3,3,3)
    modelica_string = to_modelica('x', tensor)
    expected_string = "Real[3,3,3] x = {{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}, {{10, 11, 12}, {13, 14, 15}, {16, 17, 18}}, {{19, 20, 21}, {22, 23, 24}, {25, 26, 27}}};"
    self.assertEqual(modelica_string, expected_string)

if __name__ == "__main__":
  unittest.main()
