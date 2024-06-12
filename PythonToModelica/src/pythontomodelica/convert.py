import numpy as np
from .numpy import numpy_to_modelica_declaration, numpy_to_modelica_array

def to_modelica(identifier: str, array) -> str:
  """
  Converts an array to a Modelica array declaration.

  Parameters:
    `identifier`: Name for array declaration.
    `array`:      Array.

  Returns:
    `str`: A string with Modelica code.
  """
  if isinstance(array, np.ndarray):
    return f"{numpy_to_modelica_declaration(identifier, array)} = {numpy_to_modelica_array(array)};"

  raise ValueError(f"Array type {type(array)} not supported")
