import 'package:mobx/mobx.dart';
import '../../home/repositories/local_storage_repository.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryController with _$HistoryController;

abstract class _HistoryController with Store {
  final LocalStorageRepository localStorageRepository;

  _HistoryController(this.localStorageRepository);

  @observable
  ObservableList<String> historicalAddresses = ObservableList<String>();

  @action
  Future<void> fetchHistoricalAddresses() async {
    historicalAddresses.addAll(await localStorageRepository.getAddresses());
  }
}
