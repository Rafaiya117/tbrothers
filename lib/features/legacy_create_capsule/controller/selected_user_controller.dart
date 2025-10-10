import 'package:appsoleum/features/legacy_create_capsule/model/selected_user.dart';
import 'package:flutter/material.dart';

class AccountViewModel extends ChangeNotifier {
  static final List<Account> _dummyAccounts = [
    Account('Cody Fisher', 'Primary Earo Account', 'https://i.pravatar.cc/150?img=1'),
    Account('Cody Fisher', 'Primary Earo Account', 'https://i.pravatar.cc/150?img=2'),
    Account('Cody Fisher', 'Primary Earo Account', 'https://i.pravatar.cc/150?img=3'),
    Account('Cody Fisher', 'Primary Earo Account', 'https://i.pravatar.cc/150?img=4'),
    Account('Cody Fisher', 'Primary Earo Account', 'https://i.pravatar.cc/150?img=5'),
    Account('Cody Fisher', 'Primary Earo Account', 'https://i.pravatar.cc/150?img=6'),
    Account('Cody Fisher', 'Primary Earo Account', 'https://i.pravatar.cc/150?img=7'),
    Account('Cody Fisher', 'Primary Earo Account', 'https://i.pravatar.cc/150?img=8'),
  ];
  
  List<Account> get accounts => _dummyAccounts;

  /// ✅ Multiple selection support
  final List<Account> _selectedAccounts = [];
  List<Account> get selectedAccounts => _selectedAccounts;

  bool isSelected(Account account) => _selectedAccounts.contains(account);

  void toggleAccountSelection(Account account) {
    if (_selectedAccounts.contains(account)) {
      _selectedAccounts.remove(account);
    } else {
      _selectedAccounts.add(account);
    }
    notifyListeners();
  }

  void clearSelections() {
    _selectedAccounts.clear();
    notifyListeners();
  }
}
