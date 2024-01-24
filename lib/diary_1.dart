import 'package:flutter/material.dart';

class diary1 extends StatelessWidget {
  const diary1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFFFF5DE)),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 44,
                child: Container(
                  width: 390,
                  height: 447,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF5DE),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 156,
                top: 262,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '09',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 156,
                top: 366,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '23',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 258,
                top: 418,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '01',
                    style: TextStyle(
                      color: Color(0xFF6C6C6C),
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 360,
                top: 418,
                child: Text(
                  '03',
                  style: TextStyle(
                    color: Color(0xFF6C6C6C),
                    fontSize: 10,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 156,
                top: 418,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '30',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 105,
                top: 418,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '29',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 54,
                top: 418,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '28',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 105,
                top: 366,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '22',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 54,
                top: 366,
                child: SizedBox(
                  width: 11,
                  height: 13,
                  child: Text(
                    '21',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 207,
                top: 366,
                child: SizedBox(
                  width: 14,
                  height: 13,
                  child: Text(
                    '24',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 360,
                top: 314,
                child: SizedBox(
                  width: 14,
                  height: 13,
                  child: Text(
                    '20',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 156,
                top: 314,
                child: SizedBox(
                  width: 12,
                  height: 13,
                  child: Text(
                    '16',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 105,
                top: 314,
                child: SizedBox(
                  width: 11,
                  height: 13,
                  child: Text(
                    '15',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 54,
                top: 314,
                child: SizedBox(
                  width: 12,
                  height: 13,
                  child: Text(
                    '14',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 105,
                top: 262,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '08',
                    style: TextStyle(
                      color: Color(0xFFFF7A41),
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 54,
                top: 262,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '07',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 54,
                top: 210,
                child: SizedBox(
                  width: 11,
                  height: 13,
                  child: Text(
                    '31',
                    style: TextStyle(
                      color: Color(0xFF6C6C6C),
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 138,
                top: 125,
                child: Text(
                  'In January 2024',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 73,
                top: 146,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-1.57),
                  child: Container(
                    width: 20,
                    height: 15,
                    decoration: const ShapeDecoration(
                      color: Colors.black,
                      shape: StarBorder.polygon(sides: 3),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 316,
                top: 126,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(1.57),
                  child: Container(
                    width: 20,
                    height: 15,
                    decoration: const ShapeDecoration(
                      color: Colors.black,
                      shape: StarBorder.polygon(sides: 3),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 23,
                top: 174,
                child: Text(
                  'SUN',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 77,
                top: 174,
                child: Text(
                  'MON',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 135,
                top: 174,
                child: Text(
                  'TUE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 187,
                top: 174,
                child: Text(
                  'WED',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 244,
                top: 174,
                child: Text(
                  'THU',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 298,
                top: 174,
                child: Text(
                  'FRI',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 343,
                top: 174,
                child: Text(
                  'SAT',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 360,
                top: 210,
                child: Text(
                  '06',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 105,
                top: 210,
                child: SizedBox(
                  width: 12,
                  height: 13,
                  child: Text(
                    '01',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 207,
                top: 210,
                child: SizedBox(
                  width: 14,
                  height: 13,
                  child: Text(
                    '03',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 156,
                top: 210,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '02',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 309,
                top: 210,
                child: SizedBox(
                  width: 14,
                  height: 13,
                  child: Text(
                    '05',
                    style: TextStyle(
                      color: Color(0xFFFF7A41),
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 258,
                top: 210,
                child: SizedBox(
                  width: 15,
                  height: 13,
                  child: Text(
                    '04',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 206,
                child: Container(
                  width: 358,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 260,
                child: Container(
                  width: 358,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 309,
                top: 366,
                child: SizedBox(
                  width: 14,
                  height: 13,
                  child: Text(
                    '26',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 258,
                top: 366,
                child: SizedBox(
                  width: 14,
                  height: 13,
                  child: Text(
                    '25',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 360,
                top: 366,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '27',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 362,
                child: Container(
                  width: 358,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 207,
                top: 418,
                child: SizedBox(
                  width: 12,
                  height: 13,
                  child: Text(
                    '31',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 309,
                top: 418,
                child: SizedBox(
                  width: 14,
                  height: 13,
                  child: Text(
                    '02',
                    style: TextStyle(
                      color: Color(0xFF6C6C6C),
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 415,
                child: Container(
                  width: 358,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 207,
                top: 314,
                child: SizedBox(
                  width: 12,
                  height: 13,
                  child: Text(
                    '17',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 309,
                top: 314,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '19',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 258,
                top: 314,
                child: SizedBox(
                  width: 12,
                  height: 13,
                  child: Text(
                    '18',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 310,
                child: Container(
                  width: 358,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 207,
                top: 262,
                child: SizedBox(
                  width: 13,
                  height: 13,
                  child: Text(
                    '10',
                    style: TextStyle(
                      color: Color(0xFFFF7A41),
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 309,
                top: 262,
                child: SizedBox(
                  width: 12,
                  height: 13,
                  child: Text(
                    '12',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 258,
                top: 262,
                child: SizedBox(
                  width: 11,
                  height: 13,
                  child: Text(
                    '11',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 360,
                top: 262,
                child: SizedBox(
                  width: 12,
                  height: 13,
                  child: Text(
                    '13',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 520,
                child: Container(
                  width: 164,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 210,
                top: 520,
                child: Container(
                  width: 164,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 532,
                child: Container(
                  width: 145,
                  height: 145,
                  decoration: const BoxDecoration(color: Color(0xFF232323)),
                ),
              ),
              Positioned(
                left: 220,
                top: 532,
                child: Container(
                  width: 145,
                  height: 145,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF232323),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFFFB495)),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 26,
                top: 681,
                child: SizedBox(
                  width: 17,
                  height: 16,
                  child: Text(
                    '05',
                    style: TextStyle(
                      color: Color(0xFF6C6C6C),
                      fontSize: 13,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 220,
                top: 681,
                child: SizedBox(
                  width: 18,
                  height: 16,
                  child: Text(
                    '08',
                    style: TextStyle(
                      color: Color(0xFF6C6C6C),
                      fontSize: 13,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 759,
                child: Container(
                  width: 164,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 210,
                top: 759,
                child: Container(
                  width: 164,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 771,
                child: Container(
                  width: 145,
                  height: 145,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF232323),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFFFB495)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 220,
                top: 771,
                child: Container(
                  width: 145,
                  height: 145,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF232323),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFFFB495)),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 33,
                top: 935,
                child: Text(
                  '05',
                  style: TextStyle(
                    color: Color(0xFF6C6C6C),
                    fontSize: 13,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 217,
                top: 935,
                child: Text(
                  '08',
                  style: TextStyle(
                    color: Color(0xFF6C6C6C),
                    fontSize: 13,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 348,
                top: 121,
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.only(
                    top: 2.50,
                    left: 1.56,
                    right: 3.75,
                    bottom: 2.50,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 44,
                child: Container(
                  width: 390,
                  height: 50,
                  decoration: const BoxDecoration(color: Color(0xFFFFF5DE)),
                ),
              ),
              const Positioned(
                left: 136,
                top: 59,
                child: SizedBox(
                  width: 118,
                  child: Text(
                    'Farming Diary',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 54,
                child: Container(
                  width: 28,
                  height: 30,
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 8,
                    right: 7.81,
                    bottom: 3.30,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 390,
                  height: 44,
                  decoration: const BoxDecoration(color: Color(0xFFFFF5DE)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
