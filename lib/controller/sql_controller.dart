import 'package:get/get.dart';
import 'package:grisoft_code_challange/controller/sql_helper.dart';

class SqlController extends GetxController {
  var _journals = [].obs;

  var _isLoading = true.obs;

  Future<void> addItem(String title, String text) async {
    await SQLHelper.createItem(title, text);
    _refreshJournals();
  }

  // Delete an item
  void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    print('Successfully deleted a journal!');
    _refreshJournals();
  }

  void _refreshJournals() async {
    _isLoading.value = true;
    final data = await SQLHelper.getItems();

    _journals.value = data;

    _isLoading.value = false;
  }

  int getLinkCount() => _journals.length;
  List getDatas() => _journals;
  bool getIsLoading() => _isLoading.value;

  @override
  void onInit() {
    _refreshJournals();
    super.onInit();
  }
}
