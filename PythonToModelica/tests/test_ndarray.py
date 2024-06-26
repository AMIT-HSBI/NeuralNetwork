import unittest
import numpy as np
from pythontomodelica.numpy import numpy_to_modelica_array, numpy_to_modelica_declaration

class TestArray(unittest.TestCase):
  def test_numpy_vector_to_modelica_array(self):
    vector = np.arange(start=1, stop=10).reshape(9)
    modelica_string = numpy_to_modelica_array(vector)
    expected_string = "{1, 2, 3, 4, 5, 6, 7, 8, 9}"
    self.assertEqual(modelica_string, expected_string)

  def test_numpy_matrix_to_modelica_array(self):
    matrix = np.arange(start=1, stop=10).reshape(3,3)
    modelica_string = numpy_to_modelica_array(matrix)
    expected_string = "{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}"
    self.assertEqual(modelica_string, expected_string)

  def test_numpy_tensor_to_modelica_array(self):
    tensor = np.arange(start=1, stop=28).reshape(3,3,3)
    modelica_string = numpy_to_modelica_array(tensor)
    expected_string = "{{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}, {{10, 11, 12}, {13, 14, 15}, {16, 17, 18}}, {{19, 20, 21}, {22, 23, 24}, {25, 26, 27}}}"
    self.assertEqual(modelica_string, expected_string)

class TestDeclaration(unittest.TestCase):
  def test_numpy_vector_declaration(self):
    vector = np.arange(start=1, stop=10).reshape(9)
    modelica_string = numpy_to_modelica_declaration('x', vector)
    expected_string = "Integer[9] x"
    self.assertEqual(modelica_string, expected_string)

  def test_numpy_matrix_declaration(self):
    matrix = np.arange(start=1.0, stop=10.0).reshape(3,3)
    modelica_string = numpy_to_modelica_declaration('x', matrix)
    expected_string = "Real[3,3] x"
    self.assertEqual(modelica_string, expected_string)

  def test_numpy_tensor_declaration(self):
    tensor = np.arange(start=1.0, stop=28.0).reshape(3,3,3)
    modelica_string = numpy_to_modelica_declaration('x', tensor)
    expected_string = "Real[3,3,3] x"
    self.assertEqual(modelica_string, expected_string)

if __name__ == "__main__":
  unittest.main()
