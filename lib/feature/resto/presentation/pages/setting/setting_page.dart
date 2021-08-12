import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resto/core/utils/shared_pref_util.dart';
import 'package:resto/feature/resto/presentation/bloc/setting/setting_cubit.dart';
import 'package:resto/feature/resto/presentation/bloc/setting/setting_state.dart';
import 'package:resto/injection/injection.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var isNotificationEnable = false;

  @override
  void initState() {
    isNotificationEnable = sp.getNotificationState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SettingCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
            ),
            child: BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Setting',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Restaurant Notification',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Get recommendation of random restaurant',
                              ),
                            ],
                          ),
                        ),
                        Wrap(
                          children: [
                            Switch(
                              value: isNotificationEnable,
                              onChanged: (value) {
                                setState(() {
                                  isNotificationEnable = value;
                                  sp.setNotificationState(value);
                                  context.read<SettingCubit>().setScheduleNotification(value);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
