
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class Header extends StatelessWidget
{
  const Header({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children:
      [
        Container(
          height:100.0,
          decoration: const BoxDecoration(
            color: Color(0XFF615AAB),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
            ),
          ),
        ),
        IconButton(
            onPressed: ()
            {
               Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )
        ),
      ],
    );
  }
}

class MyFormField extends StatelessWidget
{
  TextEditingController?controller;
  String? Function(String?value)?validate;
  String?label;
  Color?labelColor;
  IconData?prefix;
  Color?prefixColor;
  TextInputType? type;
  Function (String value)? onSubmit;
  Function (String value)? onChange;
  Function (String?value )? onSave;
  VoidCallback? onTap;
  IconData? suffix;
  Color?suffixColor;
  bool isPassword=true;
  VoidCallback? suffixFunction;
  EdgeInsetsGeometry?padding;
  double radius=20.0;
  bool readOnly=false;
  List<TextInputFormatter>?format;
  TextAlign align;
  TextStyle?style;
  int?maxLine;

   MyFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefix,
    required this.validate,
    this.labelColor,
    this.prefixColor,
    this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
     this.onSave,
    this.isPassword = false,
    this.suffix,
    this.suffixColor,
    this.suffixFunction,
    this.padding,
    this.radius=0.0,
    this.readOnly=false,
    this.format,
    this.align=TextAlign.start,
     this.style,
     this.maxLine=1,

  });
  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      onSaved: onSave,
      readOnly: readOnly,
      inputFormatters:format,
      textAlign: align,
      style:style ,
      maxLines: maxLine,
      decoration: InputDecoration(
      labelText: label,

      labelStyle: TextStyle(
        color: labelColor,
      ),
        prefixIcon: Icon(
        prefix,
      ),
      prefixIconColor:prefixColor,
      suffixIcon: suffix != null
      ? IconButton(
       icon: Icon(
        suffix,
       ),
       onPressed: suffixFunction,
       )
          : null,
      suffixIconColor: suffixColor,
      contentPadding: padding,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
   );
  }
}
class MyRadioButton extends StatelessWidget
{
  String title;
  dynamic value;
  dynamic groupValue;
  Function (dynamic)? onChanged;
  double radius=0.0;
  VisualDensity?visual;
  EdgeInsetsGeometry?padding;
  Color?color;
  double?titleSize;

  MyRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.radius=0.0,
    this.visual,
    this.padding,
    this.color,
    this.titleSize=16.0,
  });

  @override
  Widget build(BuildContext context)
  {
    return RadioListTile(
       visualDensity: visual,
       title: Text(
           title,
           textAlign: TextAlign.start,
           style:TextStyle(
             fontSize: titleSize

           ),
       ),
       contentPadding:padding,
       tileColor:color,
       value: value,
       groupValue: groupValue,
       onChanged: onChanged,
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
       ),
    );
  }
}
class MyCheckBox extends StatelessWidget
{
  String title;
  bool value;
  Function (bool?)? onChanged;
  EdgeInsetsGeometry?padding;
  Color?color;
  VisualDensity?visual;
  double radius;
  MyCheckBox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.padding,
    this.visual,
    this.color,
    this.radius=0.0
  });
  @override
  Widget build(BuildContext context)
  {
    return  CheckboxListTile(
       visualDensity:visual,
        title: Text(title),
        value: value,
        onChanged: onChanged,
        contentPadding:padding,
        tileColor:color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),

    );
  }
}

class MyButton extends StatelessWidget {
  double?width;
  double?height;
  Function ()? onPressed;
  double radius=0.0;
  Color?color;
  String title;
  Color?titleColor;
  double?titleSize;
  Color side;


  MyButton({
     super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.width,
    this.height,
    this.radius=0.0,
    this.titleColor,
    this.titleSize,
    this.side=Colors.white,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
           side: BorderSide(
             color: side
           )
        ),
        elevation: 0.0,
        onPressed:onPressed,
        color: color,
        child: Text(
           title,
          style:TextStyle(
              color: titleColor,
              fontSize: titleSize
          ) ,
        ),
      ),
    );
  }
}




