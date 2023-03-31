import 'package:asbeza_1/model/food.dart';
import 'localdb.dart';

class Service {
  Repo? _repo;

  Service() {
    _repo = Repo();
  }

  saveItem(Item item) async {
    return await _repo!.insertData('history', item.toJson());
  }

  readItem() async {
    return await _repo!.readData('history');
  }

  updateItem(Item item) async {
    return await _repo!.updateData('history', item.toJson());
  }

  deleteItem(dispatchId) async {
    return await _repo!.deleteData('history', dispatchId);
  }

  wipeData() async {
    await _repo!.deleteAllData('history');
  }
}
