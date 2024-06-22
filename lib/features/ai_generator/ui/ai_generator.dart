import 'dart:convert';
import 'dart:io';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class AiGenerator extends StatefulWidget {
  const AiGenerator({Key? key}) : super(key: key);

  @override
  _AiGeneratorState createState() => _AiGeneratorState();
}

class _AiGeneratorState extends State<AiGenerator> {
  File? _selectedFile;
  String? _message;
  String? _predictionResult;

  Future<void> _pickFile() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );

    if (pickedFile != null && pickedFile.files.isNotEmpty) {
      setState(() {
        _selectedFile = File(pickedFile.files.single.path!);
      });
    } else {
      setState(() {
        _selectedFile = null;
      });
    }
  }

  Future<void> _predictImage() async {
    if (_selectedFile == null) {
      setState(() {
        _message = 'Please select a file first.';
      });
      return;
    }

    // Convert selected file to base64
    String base64Image = base64Encode(_selectedFile!.readAsBytesSync());

    try {
      var response = await http.post(
        Uri.parse('https://72e2-197-43-14-149.ngrok-free.app/predict'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{'image': base64Image}),
      );

      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> result = jsonDecode(response.body);
          _predictionResult = result['result'];
        });
      } else {
        setState(() {
          _predictionResult = 'Prediction failed';
        });
      }
    } catch (e) {
      setState(() {
        _predictionResult = 'Error predicting';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: ManagerColor.mainred,
        centerTitle: true,
        title: Text(
          'AI Generator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Please, upload the file you would like to check:',
                style: TextStyles.font16GreysemiBold,
              ),
              SizedBox(height: 20.h),
              Center(
                child: AppTextButton(
                    onPressed: _pickFile,
                    textButton: "Upload File",
                    buttonWidth: 200.w,
                    buttonHeight: 50.h),
              ),
              if (_selectedFile != null) ...[
                SizedBox(height: 20.h),
                Image.file(
                  _selectedFile!,
                  height: 300.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.h),
                Text(
                  _message ?? '',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 20.h),
                AppTextButton(
                  textButton: "Predict",
                  buttonWidth: 200.w,
                  buttonHeight: 50.h,
                  onPressed: _predictImage,
                ),
                SizedBox(height: 20.h),
                _predictionResult != null
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey[300] ?? Colors.grey,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Prediction Result:\n$_predictionResult',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ManagerColor.grey,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
