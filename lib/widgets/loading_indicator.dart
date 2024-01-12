import 'package:ggd_mart_admin/const/const.dart';


Widget loadingIndicator({circlecolor = purpleColor}) {
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(circlecolor),
  );
}
