import 'package:dorun_app_flutter/common/component/custom_button.dart';
import 'package:dorun_app_flutter/common/component/custom_icon.dart';
import 'package:dorun_app_flutter/common/component/gap_column.dart';
import 'package:dorun_app_flutter/common/component/gap_row.dart';
import 'package:dorun_app_flutter/common/component/list_item.dart';
import 'package:dorun_app_flutter/common/component/padding_container.dart';
import 'package:dorun_app_flutter/common/constant/colors.dart';
import 'package:dorun_app_flutter/common/constant/fonts.dart';
import 'package:dorun_app_flutter/common/constant/spacing.dart';
import 'package:dorun_app_flutter/features/statistics/model/weekly_model.dart';
import 'package:dorun_app_flutter/features/statistics/view/statistics_screen.dart';
import 'package:flutter/material.dart';

class WeeklyRoutine extends StatelessWidget {
  final String routineId;

  const WeeklyRoutine({
    super.key,
    required this.routineId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.BACKGROUND_SUB,
        borderRadius: AppRadius.ROUNDED_16,
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: GapColumn(
          gap: 16,
          children: [
            Text(
              "아침 조깅하기",
              style: AppTextStyles.BOLD_14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GapColumn(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      text: "07",
                      primaryColor: Colors.transparent,
                      secondaryColor: Colors.black,
                      size: 28,
                      progress: .4,
                    ),
                    Text(
                      "월",
                      style: AppTextStyles.REGULAR_12,
                    )
                  ],
                ),
                GapColumn(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      icon: Icons.check,
                      primaryColor: AppColors.BRAND,
                      size: 28,
                    ),
                    Text(
                      "화",
                      style: AppTextStyles.REGULAR_12,
                    )
                  ],
                ),
                GapColumn(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      icon: Icons.close,
                      primaryColor: AppColors.BRAND_SUB,
                      size: 28,
                    ),
                    Text(
                      "수",
                      style: AppTextStyles.REGULAR_12,
                    )
                  ],
                ),
                GapColumn(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      icon: Icons.check,
                      primaryColor: AppColors.BRAND,
                      size: 28,
                    ),
                    Text(
                      "월",
                      style: AppTextStyles.REGULAR_12,
                    )
                  ],
                ),
                GapColumn(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      text: "11",
                      primaryColor: AppColors.TEXT_INVERT,
                      size: 28,
                    ),
                    Text(
                      "목",
                      style: AppTextStyles.REGULAR_12,
                    )
                  ],
                ),
                GapColumn(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      text: "12",
                      primaryColor: AppColors.TEXT_INVERT,
                      size: 28,
                    ),
                    Text(
                      "금",
                      style: AppTextStyles.REGULAR_12,
                    )
                  ],
                ),
                GapColumn(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      text: "13",
                      primaryColor: AppColors.TEXT_INVERT,
                      size: 28,
                    ),
                    Text(
                      "토",
                      style: AppTextStyles.REGULAR_12,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconListView extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  const IconListView({
    super.key,
    required this.text,
    required this.icon,
    this.color = AppColors.BRAND,
  });

  @override
  Widget build(BuildContext context) {
    return GapRow(
      gap: 8,
      children: [
        CustomIcon(
          icon: icon,
          primaryColor: color,
        ),
        Text(
          text,
          style: AppTextStyles.REGULAR_14,
        )
      ],
    );
  }
}

class CircularProgress extends StatelessWidget {
  final double outerThickness;
  final double innerThickness;
  final double progressNow;
  final double progressBefore;
  final double size;

  const CircularProgress({
    super.key,
    this.outerThickness = 10,
    this.innerThickness = 10,
    required this.progressNow,
    required this.progressBefore,
    this.size = 154.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: CirclePainter(
              progress: progressNow,
              thickness: outerThickness,
              color: AppColors.BRAND,
            ),
          ),
          SizedBox(
            width: size - outerThickness * 2,
            height: size - outerThickness * 2,
            child: CustomPaint(
              size: Size(size - outerThickness * 2, size - outerThickness * 2),
              painter: CirclePainter(
                progress: progressBefore,
                thickness: innerThickness,
                color: AppColors.TEXT_INVERT,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(progressNow * 100).toInt()}%',
                  style: AppTextStyles.BOLD_20.copyWith(
                    fontSize: 32,
                    color: AppColors.TEXT_BRAND,
                  ),
                ),
                Text(
                  '지난 주 ${(progressBefore * 100).toInt()}%',
                  style: AppTextStyles.REGULAR_12.copyWith(
                    color: AppColors.TEXT_SUB,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double progress;
  final double thickness;
  final Color color;

  CirclePainter({
    required this.progress,
    required this.thickness,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = (size.width / 2) - thickness / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint baseCircle = Paint()
      ..color = color.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;

    Paint progressCircle = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, baseCircle);

    double sweepAngle = 2 * 3.141592653589793 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2,
      sweepAngle,
      false,
      progressCircle,
    );
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class RoutineFeedbackContainer extends StatelessWidget {
  final WeeklyModel periodStatData;

  const RoutineFeedbackContainer({
    super.key,
    required this.periodStatData,
  });

  @override
  Widget build(BuildContext context) {
    return PaddingContainer(
      child: GapColumn(
        gap: 24,
        children: [
          GapColumn(
            gap: 8,
            children: [
              Text(periodStatData.feedBackRoutineTitle,
                  style: AppTextStyles.BOLD_20),
              Text(
                periodStatData.feedBackRoutineDetail,
                style: AppTextStyles.REGULAR_14
                    .copyWith(color: AppColors.TEXT_SUB),
              ),
            ],
          ),
          WeeklyRoutine(
            routineId: periodStatData.feedBackRoutineId,
          )
        ],
      ),
    );
  }
}

class WeeklyRoutineReportContainer extends StatelessWidget {
  final WeeklyModel periodStatData;

  const WeeklyRoutineReportContainer({
    super.key,
    required this.periodStatData,
  });

  @override
  Widget build(BuildContext context) {
    int difference = (periodStatData.currentWeeklyProgress * 100).toInt() -
        (periodStatData.pastWeeklyProgress * 100).toInt();

    return PaddingContainer(
      child: GapColumn(
        gap: 24,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GapColumn(
                gap: 8,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "지난 주에 비해\n",
                      style: AppTextStyles.BOLD_20,
                      children: <TextSpan>[
                        TextSpan(
                          text: '$difference% 더 \n달성했어요',
                          style: const TextStyle(color: AppColors.TEXT_BRAND),
                        )
                      ],
                    ),
                  ),
                  const Text("04.21 ~ 04.27", style: AppTextStyles.REGULAR_14)
                ],
              ),
              CircularProgress(
                progressNow: periodStatData.currentWeeklyProgress,
                progressBefore: periodStatData.pastWeeklyProgress,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconListView(
                text: '달성 루틴',
                icon: Icons.check,
                color: AppColors.BRAND,
              ),
              Text('${periodStatData.sucessRoutine}개',
                  style: AppTextStyles.BOLD_16)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconListView(
                text: '실패 루틴',
                icon: Icons.close,
                color: AppColors.BRAND_SUB,
              ),
              Text('${periodStatData.failedRoutine}개',
                  style: AppTextStyles.BOLD_16)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconListView(
                text: '건너뛴 루틴',
                icon: Icons.keyboard_double_arrow_right,
                color: AppColors.TEXT_SECONDARY,
              ),
              Text('${periodStatData.passedRoutine}개',
                  style: AppTextStyles.BOLD_16)
            ],
          ),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StatisticsWeeklyDetail()),
              );
            },
            title: '자세히 보기',
            align: TextAlign.center,
            backgroundColor: AppColors.BRAND_SUB,
            foregroundColor: AppColors.TEXT_BRAND,
          )
        ],
      ),
    );
  }
}

class DailyRoutineReportContainer extends StatefulWidget {
  const DailyRoutineReportContainer({super.key});

  @override
  DailyRoutineReportContainerState createState() =>
      DailyRoutineReportContainerState();
}

class DailyRoutineReportContainerState
    extends State<DailyRoutineReportContainer> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PaddingContainer(
      child: GapColumn(
        gap: 24,
        children: [
          GestureDetector(
            onTap: _toggleExpand,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                      style: AppTextStyles.REGULAR_16,
                      children: [
                        TextSpan(
                          text: "완료1   ",
                          style: TextStyle(
                            color: AppColors.TEXT_BRAND,
                          ),
                        ),
                        TextSpan(text: "실패2   "),
                        TextSpan(
                          text: "건너뜀1",
                          style: TextStyle(color: AppColors.TEXT_SUB),
                        )
                      ]),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ],
            ),
          ),
          if (_isExpanded)
            const GapColumn(
              gap: 24,
              children: [
                IconListView(
                  text: '아침 조깅하기',
                  icon: Icons.check,
                ),
                IconListView(
                  text: '아침 조깅하기',
                  icon: Icons.close,
                  color: AppColors.BRAND_SUB,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class StreakContainer extends StatelessWidget {
  final WeeklyModel periodStatData;

  const StreakContainer({
    super.key,
    required this.periodStatData,
  });

  @override
  Widget build(BuildContext context) {
    return PaddingContainer(
      child: GapColumn(
        gap: 24,
        children: [
          RichText(
            text: TextSpan(
              text: '지금까지 ',
              style: AppTextStyles.BOLD_20,
              children: <TextSpan>[
                TextSpan(
                  text: '연속 ${periodStatData.currentStreak}일 ',
                  style: AppTextStyles.BOLD_20
                      .copyWith(color: AppColors.TEXT_BRAND),
                ),
                TextSpan(
                    text:
                        '동안 \n루틴을 ${(periodStatData.currentStreakProgress * 100).toInt()}% 달성했어요'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('최고 연속 달성', style: AppTextStyles.REGULAR_14),
              Text('${periodStatData.longestStreakCount}일',
                  style: AppTextStyles.BOLD_16),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('누적 달성', style: AppTextStyles.REGULAR_14),
              Text('${periodStatData.totalStreak}일',
                  style: AppTextStyles.BOLD_16),
            ],
          ),
        ],
      ),
    );
  }
}

class ConductRoutineHistory extends StatefulWidget {
  const ConductRoutineHistory({super.key});

  @override
  ConductRoutineHistoryState createState() => ConductRoutineHistoryState();
}

class ConductRoutineHistoryState extends State<ConductRoutineHistory> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PaddingContainer(
      child: GapColumn(
        gap: 24,
        children: [
          GestureDetector(
            onTap: _toggleExpand,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "수행시간: ",
                      style: AppTextStyles.REGULAR_16,
                    ),
                    Text(
                      "82분 41초",
                      style: AppTextStyles.BOLD_16.copyWith(
                        color: AppColors.TEXT_BRAND,
                      ),
                    ),
                  ],
                ),
                Icon(_isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ),
          if (_isExpanded)
            const GapColumn(
              gap: 24,
              children: [
                ListItem(id: 0, title: "창문열기"),
                ListItem(id: 0, title: "창문열기"),
                ListItem(id: 0, title: "창문열기"),
                ListItem(id: 0, title: "창문열기"),
              ],
            ),
        ],
      ),
    );
  }
}

class RoutineReview extends StatelessWidget {
  const RoutineReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PaddingContainer(
      child: GapColumn(
        gap: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GapColumn(
                gap: 2,
                children: [
                  Text("루틴 회고", style: AppTextStyles.BOLD_20),
                  Text("2024. 04. 22", style: AppTextStyles.REGULAR_12),
                ],
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
          Text(
            "루틴 회고 텍스트가 들어가는 공간입니다. 루틴 회고 텍스트가 들어가는 공간입니다. 루틴 회고 텍스트가 들어가는 공간입니다. 루틴 회고 텍스트가 들어가는 공간입니다. 루틴 회고 텍스트가 들어가는 공간입니다. 루틴 회고 텍스트가 들어가는 공간입니다. 루틴 회고 텍스트가 들어가는 공간입니다. 루틴 회고 텍스트가 들어가는 공간입니다. ",
            style: AppTextStyles.REGULAR_12,
          )
        ],
      ),
    );
  }
}
