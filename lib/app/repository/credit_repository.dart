import 'package:ja_paguei_meus_boletos/app/database/dao/credit_dao.dart';
import 'package:ja_paguei_meus_boletos/app/model/credit.dart';

class CreditRepository {
  final CreditDao _dao = CreditDao();

  Future<int> save(Credit credit) {
    return _dao.save(credit);
  }

  Future<List<Credit>> findAll() async {
    return _dao.findAll();
  }

  Future<int> update(Credit credit) {
    return _dao.update(credit);
  }
}