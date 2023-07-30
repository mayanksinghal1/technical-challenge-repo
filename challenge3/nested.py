def get_value_from_nested_object(nested_object, key):
    keys = key.split('/')
    current_obj = nested_object

    try:
        for k in keys:
            current_obj = current_obj[k]
        return current_obj
    except (KeyError, TypeError):
        return None

# Example Inputs
object1 = {"a": {"b": {"c": "d"}}}
key1 = "a/b/c"
value1 = get_value_from_nested_object(object1, key1)
print(f"Value for key '{key1}': {value1}")

object2 = {"x": {"y": {"z": "a"}}}
key2 = "x/y/z"
value2 = get_value_from_nested_object(object2, key2)
print(f"Value for key '{key2}': {value2}")

# Example output

Outputs:

Value for key 'a/b/c': d
Value for key 'x/y/z': a