

import 'dart:collection';

import 'base_model.dart';

class InMemoryRepository<Search extends BaseModel,Data extends BaseModel> {

  HashMap<String, Data> _memory = new HashMap();

  @override
  Future<Data> add(Data data) async {
    print("adding");
    _memory.putIfAbsent(data.id, () => data);
    print("repos:" + _memory.toString());
    return data;
  }

  @override
  Future<Data> delete(Data data) async {
    _memory.remove(data.id);
    return data;
  }

  @override
  Future<Data> findOne(Search search) async {
    print("repo lookup id=" + search.id);
    print("repos:" + _memory.toString());

    return _memory[search.id];
  }

  @override
  Future<Iterable<Data>> findMany(Search search) async {
    return _memory.values;
  }

  @override
  Future<Data> update(Data data) async {
    return _memory.update(data.id, (t) => data);
  }


}
