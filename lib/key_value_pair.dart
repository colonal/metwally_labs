class KeyValuePair<Tkey, Tvalue> {
  late Tkey _key;
  late Tvalue _value;

  KeyValuePair(Tkey key, Tvalue value) {
    this._key = key;
    this._value = value;
  }

  Tkey get key {
    return _key;
  }

  Tvalue get value {
    return _value;
  }

  set value(Tvalue value) {
    this._value = value;
  }
}
