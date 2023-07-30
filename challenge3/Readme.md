The get_value_from_nested_object function takes two parameters: nested_object, which is the nested object (dictionary), and key, which is the path to the value you want to retrieve.
The function splits the input key by '/', creating a list of keys representing the path to the value in the nested object.
It then traverses the nested object using the keys from the list, until it reaches the final key.
If the value is found, it returns the value; otherwise, it returns None.


