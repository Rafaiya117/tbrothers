import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/components/custom_input_field.dart';
import 'package:appsoleum/core/components/prograssbar_indigator.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/create_capsule/controller/capsule_controller.dart';
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
                        SvgPicture.asset(
                          'assets/icons/arrow_back.svg',
                          width: 16.w,
                          height: 10.h,
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
            SizedBox(height: 100.h),
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
