import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talent_accelerator/core/providers/app.provider.dart';

class SortButton extends StatefulWidget {
  const SortButton({
    Key key,
  }) : super(key: key);

  @override
  _SortButtonState createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> with TickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(
          milliseconds: 500,
        ),
        lowerBound: 0,
        upperBound: 0.5,
        vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Confirmed',
              style: Theme.of(context).textTheme.headline6,
            ),
            Provider.of<AppProvider>(context).isSorted
                ? RotationTransition(
                    turns: controller,
                    child: const Icon(Icons.arrow_drop_up),
                  )
                : SizedBox(
                    height: 0,
                    width: 24,
                  )
          ],
        ),
        onPressed: () {
          context.read<AppProvider>().sortConfirmed
              ? controller.forward()
              : controller.reverse();
          Provider.of<AppProvider>(context, listen: false).sortContries();
        },
      ),
    );
  }
}
