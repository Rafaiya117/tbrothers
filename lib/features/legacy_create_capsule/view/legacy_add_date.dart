import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/components/custom_input_field.dart';
import 'package:appsoleum/core/components/prograssbar_indigator.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/create_capsule/controller/capsule_controller.dart';
import 'package:appsoleum/features/legacy_create_capsule/controller/selected_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class LegacyAddDate extends StatelessWidget {
  const LegacyAddDate({super.key});

  @override
  Widget build(BuildContext context) {
   int _currentPage = 3;
   int _totalPages = 7;
    return Scaffold(
      body: Container(
        width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color
          ),
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.h),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child:SvgPicture.asset(
                            'assets/icons/arrow_back.svg',
                            width: 16.w,
                            height: 10.h,
                          ),
                        ),
                        SizedBox(width:100.w),
                        Align(
                          alignment: Alignment.center,
                            child: Text(
                            "Cerate Capsule",
                            style: GoogleFonts.inter(
                              color: FontColors.text_colors,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 50.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Set releasse date",
                      style: GoogleFonts.inter(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp
                      ),
                    ),
                  ), 
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text(
                        "Your time capsule will be sealed until this date",
                          style: GoogleFonts.inter(
                          color: FontColors.disable_text,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp
                        ),
                      ),
                    ), 
                  SizedBox(height:5.h),
                  Consumer<CapsuleController>(
                    builder: (context, controller, _) {
                      return Column(
                        children: [
                          CustomTextField(
                            label: "",
                            hintText: "DD/MM/YYYY",
                            controller: controller.dateController,
                            input_text_color: Colors.white,
                            isPassword: false,
                            height: 50,
                            width: 390,
                            borderRadius: 16,
                            backgroundColor: Color(0xFF2A2E52),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            width: 350.w,
                            height: 328.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Color(0xFF2A2E52),
                            ),
                            child: TableCalendar(
                              firstDay: DateTime.utc(2000, 1, 1),
                              lastDay: DateTime.utc(2100, 12, 31),
                              focusedDay: controller.focusedDay,
                              selectedDayPredicate: (day) =>isSameDay(controller.selectedDay, day),
                              onDaySelected: (selectedDay, focusedDay) {
                                controller.updateDate(
                                  selectedDay,focusedDay,
                                );
                              },
                              calendarStyle: CalendarStyle(
                                todayDecoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  shape: BoxShape.circle,
                                ),
                                defaultTextStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                weekendTextStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                outsideDaysVisible: false,
                              ),
                              headerStyle: HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true,
                                titleTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                leftChevronIcon: Icon(
                                  Icons.arrow_left,
                                  color: Colors.white,
                                ),
                                rightChevronIcon: Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                              daysOfWeekStyle: DaysOfWeekStyle(
                                weekdayStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                                weekendStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            Consumer<AccountViewModel>(
              builder: (context, accountViewModel, _) {
                final selectedAccounts = accountViewModel.selectedAccounts;
                if (selectedAccounts.isEmpty) return const SizedBox.shrink();

                final displayCount = selectedAccounts.length > 5
                  ? 5 : selectedAccounts.length;
                final remainingCount = selectedAccounts.length - 5;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Beneficiaries:",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 38.h,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              for (int i = 0; i < displayCount; i++)
                                Positioned(
                                  right: i * 28.w,
                                  child: Container(
                                    width: 38.w,
                                    height: 38.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          selectedAccounts[i].imageUrl ??
                                          'https://via.placeholder.com/150',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                        
                              // ➕ Show "+N" if more than 5
                              if (remainingCount > 0)
                                Positioned(
                                  right: displayCount * 28.w,
                                  child: Container(
                                    width: 38.w,
                                    height: 38.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xFFFF8C42,), 
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Text(
                                      '+$remainingCount',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 40.h),
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
            SizedBox(height: 20.h),
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
                  Consumer<CapsuleController>(
                    builder: (context, controller, _) {
                      return SizedBox(
                        width: 130.w,
                        height: 48.h,
                        child: CustomRoundedButton(
                          text: "Next",
                          backgroundColor: controller.dateController.text.isEmpty? FontColors.disabled_buttonColor: FontColors.button_color,
                          textColor:controller.dateController.text.isEmpty?FontColors.disable_text: Colors.white,
                          onPressed: controller.dateController.text.isEmpty
                            ? null: () {
                            context.push('/legacy_capsule_finalview');
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
