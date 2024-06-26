import numpy as np

def numpy_to_modelica_array(array: np.ndarray) -> str:
  """
  Converts a NumPy array to a Modelica-compatible string.

  Parameters:
    `array`: NumPy array.

  Returns:
    `str`: A string representation of the array in Modelica format.
  """
  if not isinstance(array, np.ndarray):
    raise ValueError("Input must be a NumPy ndarray")

  def to_modelica(arr):
      if arr.ndim == 1:
          return "{" + ", ".join(f"{x:.6g}" for x in arr) + "}"
      else:
          return "{" + ", ".join(to_modelica(subarr) for subarr in arr) + "}"

  return to_modelica(array)

def numpy_to_modelica_declaration(identifier: str, array: np.ndarray) -> str:
  """
  Generates Modelica style declaration for numpy array.

  Parameters:
    `identifier`: Name for Modelica declaration.
    `array`:      NumPy array.

  Returns:
    `str`: A string representation of the array declaration in Modelica format.
  """
  if not isinstance(array, np.ndarray):
    raise ValueError("Input `array` must be a NumPy ndarray")
  if not isinstance(identifier, str):
    raise ValueError("Input `identifier` must be a string")

  modelica_string = ndtype_to_modelica_type(array.dtype)
  shape = np.shape(array)
  modelica_string += "[" + ",".join(f"{d}" for d in shape) + "]"
  modelica_string += f" {identifier}"

  return modelica_string

def ndtype_to_modelica_type(dtype: np.dtype) -> str:
  if np.issubdtype(dtype, np.floating):
    return "Real"
  if np.issubdtype(dtype, np.integer):
    return "Integer"

  raise ValueError("Unknown dtype, can't convert to Modelica type")
