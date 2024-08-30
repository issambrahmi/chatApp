import 'package:chat_app/Constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDownSection extends StatelessWidget {
  const HomeDownSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 6,
        separatorBuilder: (context, index) => Divider(
          height: 0.h,
          thickness: 1.5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const CustumListTile();
        },
      ),
    );
  }
}

class CustumListTile extends StatelessWidget {
  const CustumListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SizedBox(
          width: 30.sp,
          height: 30.sp,
          child: Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/person.png',
                )),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 10.sp,
                height: 10.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.green),
              ),
            ),
          ])),
      title: Text(
        'Brahmi issam',
        style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Padding(
        padding:  EdgeInsets.only(right: 70.w),
        child: Text(
          'i was there in the house',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: MyColors.greyColor.shade600,
          ),
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '12PM',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.greyColor.shade600,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 18.sp,
            height: 18.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: MyColors.appColor,
            ),
            child: Center(
              child: Text(
                '2',
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
