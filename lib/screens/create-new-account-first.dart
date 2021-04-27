import 'dart:ui';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snu_traffik/pallete.dart';
import 'package:snu_traffik/widgets/widgets.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/bg_1.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400].withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'First name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'Last name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.addressCard,
                      hint: 'ARC number',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child:  Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Icon(
                                  FontAwesomeIcons.calendarAlt,
                                  size: 28,
                                  color: kWhite,
                                ),
                              ),

                              Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal,color: Colors.white),
                              ),
                              SizedBox(width: 20,),

                              RaisedButton(
                                onPressed: () => _selectDate(context), // Refer step 3
                                child: Text(
                                  'Select date',
                                  style:
                                  TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
                                ),
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: <Widget>[
                    //     Text(
                    //       "${selectedDate.toLocal()}".split(' ')[0],
                    //       style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                    //     ),
                    //     SizedBox(
                    //       height: 20.0,
                    //     ),
                    //     RaisedButton(
                    //       onPressed: () => _selectDate(context), // Refer step 3
                    //       child: Text(
                    //         'Select date',
                    //         style:
                    //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    //       ),
                    //       color: Colors.greenAccent,
                    //     ),
                    //   ],
                    // ),
                    // TextInputField(
                    //   icon: FontAwesomeIcons.envelope,
                    //   hint: 'Email',
                    //   inputType: TextInputType.emailAddress,
                    //   inputAction: TextInputAction.next,
                    // ),
                    // PasswordInput(
                    //   icon: FontAwesomeIcons.lock,
                    //   hint: 'Password',
                    //   inputAction: TextInputAction.next,
                    // ),
                    // PasswordInput(
                    //   icon: FontAwesomeIcons.lock,
                    //   hint: 'Confirm Password',
                    //   inputAction: TextInputAction.done,
                    // ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(buttonName: 'Next'),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
