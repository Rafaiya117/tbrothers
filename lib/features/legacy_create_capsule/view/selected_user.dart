import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/components/prograssbar_indigator.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/legacy_create_capsule/controller/legacy_create_capsule_controller.dart';
import 'package:appsoleum/features/legacy_create_capsule/controller/selected_user_controller.dart';
import 'package:appsoleum/features/legacy_create_capsule/custom_widget/custom_searchbar.dart';
import 'package:appsoleum/features/legacy_create_capsule/model/selected_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class SelectRecipientScreen extends StatelessWidget {
  const SelectRecipientScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
   int _currentPage = 2;
   int _totalPages = 7;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xFF017FDC),
        leading: IconButton(
          onPressed: (){
            context.pop();
          }, 
          icon: SvgPicture.asset(
          'assets/icons/arrow_back.svg',
          width: 16,
          height: 16,
        ),
      ),
      title: Text(
        'Appso Message',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          color: FontColors.text_colors,
          fontSize: 20,
          ),
        ),
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradientColors.background_color,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recipients',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: FontColors.text_colors,
                    ),
                  ),
                  SizedBox(width: 100.h,),
                  Expanded(
                    child: CustomSearchBar(
                      controller: TextEditingController(),
                      hintText: 'Search Recipients',
                      onSearchPressed: () {},
                    ),
                  ),
                  
                ],
              ),
            ),
            Divider(color: Colors.grey, thickness: 1,),
            Expanded(
              child: Consumer<AccountViewModel>(
                builder: (context, viewModel, child) {
                  final accountsData = viewModel.accounts;
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 120.0),
                    itemCount: accountsData.length,
                    itemBuilder: (context, index) {
                      final account = accountsData[index];
                      return GestureDetector(
                        onTap: () {
                          viewModel.toggleAccountSelection(account);
                        },
                        child: AccountListItem(account: account),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ProgressIndicatorWidget(
                currentPage: _currentPage,
                totalPages: _totalPages,
                barHeight: 2.0.h,
                progressGradient: AppGradientColors.linear_button,
                //backgroundColor: Colors.grey[300]!,
              ),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Step: $_currentPage of $_totalPages",
                    style: GoogleFonts.inter(
                      color: Color(0xFFFFFFFF),
                      fontSize: 14.sp,
                      fontWeight:FontWeight.w400,
                    ),
                  ),
                  SizedBox(width:20.w),
                  Consumer<LegacyCreateCapsuleController>(
                    builder: (context, controller, _) {
                      return Consumer<AccountViewModel>(
                        builder: (context, accountVM, _) {
                          final isEnabled =accountVM.selectedAccounts.isNotEmpty;
                          return SizedBox(
                            width: 130.w,
                            height: 48.h,
                            child: CustomRoundedButton(
                              text: "Next",
                              backgroundColor: isEnabled
                                ? FontColors.button_color
                                : Colors.grey,
                              textColor: Colors.white,
                              onPressed: isEnabled
                                ? () {
                                context.push('/legacy_capsule_date');
                                }: null,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ), 
    );
  }
}

// --- Custom Widget for a Single Account List Item ---
class AccountListItem extends StatelessWidget {
  final Account account;
  const AccountListItem({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AccountViewModel>(context);
    final bool isSelected = viewModel.isSelected(account);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.greenAccent : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        color: isSelected
            ? Colors.white.withOpacity(0.05)
            : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(account.imageUrl),
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    account.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    account.accountType,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 80,
              height: 30,
              child: OutlinedButton(
                onPressed: () {
                  viewModel.toggleAccountSelection(account);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor:
                      isSelected ? Colors.white : Colors.greenAccent,
                  backgroundColor:
                      isSelected ? Colors.greenAccent : Colors.transparent,
                  side: const BorderSide(
                    color: Colors.greenAccent,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  isSelected ? 'Selected' : 'Select',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
