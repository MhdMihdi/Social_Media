// ignore_for_file: must_be_immutable
import 'package:dev_space/modules/home_screen/posts%20cubit/posts_cubit.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: 100.0,
          decoration: const BoxDecoration(
            color: Constants.color,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ],
    );
  }
}

class MyFormField extends StatelessWidget {
  TextEditingController? controller;
  String? Function(String? value)? validate;
  String? label;
  Color? labelColor;
  IconData? prefix;
  Color? prefixColor;
  TextInputType? type;
  Function(String value)? onSubmit;
  Function(String value)? onChange;
  Function(String? value)? onSave;
  VoidCallback? onTap;
  IconData? suffix;
  Color? suffixColor;
  bool isPassword = true;
  VoidCallback? suffixFunction;
  EdgeInsetsGeometry? padding;
  double radius = 20.0;
  bool readOnly = false;
  List<TextInputFormatter>? format;
  TextAlign align;
  TextStyle? style;
  int? maxLine;

  MyFormField({
    super.key,
    this.controller,
    required this.label,
    this.prefix,
    this.validate,
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
    this.radius = 0.0,
    this.readOnly = false,
    this.format,
    this.align = TextAlign.start,
    this.style,
    this.maxLine = 1,
  });
  @override
  Widget build(BuildContext context) {
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
      inputFormatters: format,
      textAlign: align,
      style: style,
      maxLines: maxLine,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: labelColor,
        ),
        prefixIcon: Icon(
          prefix,
        ),
        prefixIconColor: prefixColor,
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}

class MyRadioButton extends StatelessWidget {
  String title;
  dynamic value;
  dynamic groupValue;
  Function(dynamic)? onChanged;
  double radius = 0.0;
  VisualDensity? visual;
  EdgeInsetsGeometry? padding;
  Color? color;
  double? titleSize;

  MyRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.radius = 0.0,
    this.visual,
    this.padding,
    this.color,
    this.titleSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      visualDensity: visual,
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: titleSize),
      ),
      contentPadding: padding,
      tileColor: color,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class MyCheckBox extends StatelessWidget {
  String title;
  bool value;
  Function(bool?)? onChanged;
  EdgeInsetsGeometry? padding;
  Color? color;
  VisualDensity? visual;
  double radius;
  MyCheckBox(
      {super.key,
      required this.title,
      required this.value,
      required this.onChanged,
      this.padding,
      this.visual,
      this.color,
      this.radius = 0.0});
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      visualDensity: visual,
      title: Text(title),
      value: value,
      onChanged: onChanged,
      contentPadding: padding,
      tileColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  double? width;
  double? height;
  Function()? onPressed;
  double radius = 0.0;
  Color? color;
  String title;
  IconData? icon;
  Color? titleColor;
  double? titleSize;
  Color side;

  MyButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.width,
    this.height,
    this.icon,
    this.radius = 0.0,
    this.titleColor,
    this.titleSize,
    this.side = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: side)),
        elevation: 0.0,
        onPressed: onPressed,
        color: color,
        child: icon != null
            ? Icon(
                icon,
                semanticLabel: title,
                color: Colors.white,
              )
            : Text(
                title,
                style: TextStyle(color: titleColor, fontSize: titleSize),
              ),
      ),
    );
  }
}

class PostShimmer extends StatelessWidget {
  const PostShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Post extends StatefulWidget {
  Post(
      {super.key,
      this.name = 'Mohammad Mihdi',
      this.timeago = '14 minutes ago',
      this.likesCount = 0,
      this.dislikesCount = 0,
      this.id = 0,
      this.isLikedOrDisliked,
      this.description = 'on Fire'});
  String name;
  String timeago;
  String description;
  int likesCount;
  int dislikesCount;
  bool? isLikedOrDisliked;

  int id;
  @override
  State<Post> createState() => _PostState();
}

List<Widget> media = [
  Image.asset(
    'assets/images/2.jpg',
    fit: BoxFit.fill,
    filterQuality: FilterQuality.medium,
  ),
  Image.asset(
    'assets/images/2.jpg',
    fit: BoxFit.fill,
    filterQuality: FilterQuality.medium,
  ),
  Image.asset(
    'assets/images/2.jpg',
    fit: BoxFit.fill,
    filterQuality: FilterQuality.medium,
  ),
];

int currentPage = 0;

class _PostState extends State<Post> {
  _PostState();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => PostsCubit(),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: height * .03),
          width: width * .95,
          height: height * .45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Constants.color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      //backgroundImage: ,
                      radius: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          widget.timeago,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 140.0,
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 4,
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            CircleAvatar(
                              radius: 4,
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            CircleAvatar(
                              radius: 4,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Text(
                  widget.description,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: width,
                height: height * .25,
                child: Stack(
                  children: [
                    PageView(
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        children: media),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 30,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black54,
                          ),
                          child: Text(
                            '${currentPage + 1}/${media.length}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 8.0,
              //   ),
              //   child:
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${widget.likesCount} Likes',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '${widget.dislikesCount} DisLikes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              // ),
              // const SizedBox(
              //   height: 5.0,
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.0),
              //   child:
              const Divider(
                height: 1,
                color: Colors.white,
              ),
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      onPressed: () async {
                        await PostsCubit().likePosts(
                            context: context, id: widget.id.toString());
                        setState(() {
                          widget.isLikedOrDisliked == null ||
                                  widget.isLikedOrDisliked == false
                              ? {
                                  if (widget.isLikedOrDisliked == false)
                                    {widget.dislikesCount--},
                                  widget.isLikedOrDisliked = true,
                                  widget.likesCount++
                                }
                              : {
                                  widget.isLikedOrDisliked = null,
                                  widget.likesCount--
                                };
                        });
                      },
                      title: 'Like',
                      icon: widget.isLikedOrDisliked == true
                          ? Icons.thumb_up_off_alt_rounded
                          : Icons.thumb_up_alt_outlined,
                      titleColor: Colors.white,
                      side: Constants.color,
                      width: 60,
                    ),
                    Container(
                      width: 2,
                      height: 10,
                      color: Colors.white,
                    ),
                    MyButton(
                      onPressed: () async {
                        await PostsCubit().dislikePosts(
                            context: context, id: widget.id.toString());
                        setState(() {
                          if (widget.isLikedOrDisliked == null ||
                              widget.isLikedOrDisliked!) {
                            if (widget.isLikedOrDisliked!) {
                              widget.likesCount--;
                            }
                            widget.isLikedOrDisliked = false;
                            widget.dislikesCount++;
                          } else {
                            widget.isLikedOrDisliked = null;
                            widget.dislikesCount--;
                          }
                        });
                      },
                      title: 'DisLike',
                      icon: widget.isLikedOrDisliked == false
                          ? Icons.thumb_down
                          : Icons.thumb_down_alt_outlined,
                      titleColor: Colors.white,
                      side: Constants.color,
                      width: 80,
                    ),
                    MyButton(
                      onPressed: () {},
                      title: 'Comment',
                      titleColor: Colors.white,
                      side: Constants.color,
                      width: 95,
                    ),
                    MyButton(
                      onPressed: () {},
                      title: 'Share',
                      titleColor: Colors.white,
                      side: Constants.color,
                      width: 95,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SharedPost extends StatefulWidget {
  const SharedPost({super.key});

  @override
  State<SharedPost> createState() => _SharedPostState();
}

class _SharedPostState extends State<SharedPost> {
  List<Widget> media = [
    Image.asset(
      'assets/images/2.jpg',
      fit: BoxFit.fill,
      filterQuality: FilterQuality.medium,
    ),
    Image.asset(
      'assets/images/2.jpg',
      fit: BoxFit.fill,
      filterQuality: FilterQuality.medium,
    ),
    Image.asset(
      'assets/images/2.jpg',
      fit: BoxFit.fill,
      filterQuality: FilterQuality.medium,
    ),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Constants.color,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          //backgroundImage: ,
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'dasdkasl is shared a post',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '14 minutes ago',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Content',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 140.0,
                        ),
                        InkWell(
                            onTap: () {},
                            splashColor: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 4,
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  CircleAvatar(
                                    radius: 4,
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  CircleAvatar(
                                    radius: 4,
                                  ),
                                ],
                              ),
                            )),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      //backgroundImage: ,
                                      radius: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mohammad Mihdi',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          '14 minutes ago',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Flexible(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    'On Fire',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 350,
                                height: 150,
                                child: Stack(
                                  children: [
                                    PageView(
                                        onPageChanged: (index) {
                                          setState(() {
                                            currentPage = index;
                                          });
                                        },
                                        children: media),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 30,
                                          height: 20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: Colors.black54,
                                          ),
                                          child: Text(
                                            '${currentPage + 1}/${media.length}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Divider(
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '55 Likes',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '55 DisLikes',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyButton(
                              onPressed: () {},
                              title: 'Like',
                              titleColor: Colors.white,
                              side: Constants.color,
                              width: 60,
                            ),
                            Container(
                              width: 2,
                              height: 10,
                              color: Colors.white,
                            ),
                            MyButton(
                              onPressed: () {},
                              title: 'DisLike',
                              titleColor: Colors.white,
                              side: Constants.color,
                              width: 80,
                            ),
                            MyButton(
                              onPressed: () {},
                              title: 'Comment',
                              titleColor: Colors.white,
                              side: Constants.color,
                              width: 95,
                            ),
                            MyButton(
                              onPressed: () {},
                              title: 'Share',
                              titleColor: Colors.white,
                              side: Constants.color,
                              width: 95,
                            ),
                          ],
                        ),
                      ]))
            ]));
  }
}

void showScaffoldSnackBar({
  required String title,
  required BuildContext context,
  Color color = Colors.red,
}) {
  double getWidth = MediaQuery.of(context).size.width;
  double getHeight = MediaQuery.of(context).size.height;
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        backgroundColor: color,
        duration: const Duration(milliseconds: 1500),
      ))
      .closed
      .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
}
