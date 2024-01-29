import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

Bounceable constSearchIconButton() {
  return Bounceable(
    child: const Icon(CupertinoIcons.search, size: 30,color: Colors.white,),
    onTap: () {
      // Add your onPressed logic here
    },
  );
}

Bounceable constProfileIconButton() {
  return Bounceable(
    child: const Icon(CupertinoIcons.profile_circled, size: 30,color: Colors.white,),
    onTap: () {
      // Add your onPressed logic here
    },
  );
}