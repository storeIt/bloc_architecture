// import 'package:event_bus/event_bus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:remix/search/cubit/base_state.dart';
// import 'package:remix/search/cubit/request_cubit.dart';
// import 'package:remix/search/cubit/request_state.dart';
// import 'package:remix/search/cubit/search_cubit.dart';
//
// import '../../base/enums/stream_event.dart';
// import '../../base/view/page_base_actions.dart';
// import '../../base/view/rx_common_state.dart';
// import '../../data/network/retrofit_service.dart';
// import '../../materials/values/rx_colors.dart';
// import '../../service_locator.dart';
// import '../../utils/preference_utils.dart';
//
// abstract class RxBlocState<T extends StatefulWidget> extends State<T> with RxAction {
//   final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
//   //EventBus eventBus = locator<EventBus>();
//   OverlayEntry? overlayEntry;
//
//   Widget buildBody<C extends RequestCubit>(C cubit, {PreferredSizeWidget? appBar, Function? getBottomBar}) {
//     return ScaffoldMessenger(
//       key: scaffoldMessengerKey,
//       child: Scaffold(
//         appBar: getAppBar(appBar),
//         bottomNavigationBar: getBottomBar == null ? null : getBottomBar(),
//         body: BlocProvider<C>(
//             create: (context) => cubit,
//             child: BlocConsumer<C, RequestState>(
//               listener: (context, state) {
//                 if (state.status == RequestStatus.loading) {
//                   showLoading();
//                 } else {
//                   hideLoading();
//                 }
//
//                 listen(state);
//               },
//               buildWhen: (previous, current) {
//                 if (current.status == RequestStatus.loaded) {
//                   return true;
//                 }
//                 return false;
//               },
//               builder: (context, state) {
//                 // if (state.status == RequestStatus.loading) {
//                 //   WidgetsBinding.instance.addPostFrameCallback((_) => showLoading());
//                 //   return SizedBox.shrink();
//                 // } else {
//                 //   hideLoading();
//                 // }
//                 return body(context, state);
//               },
//             )),
//       ),
//     );
//   }
//
//   //@TODO think of a better way
//   //override if redraw is needed
//   PreferredSizeWidget? getAppBar(PreferredSizeWidget? appBar) {
//     return appBar;
//   }
//
//   Widget body(BuildContext context, RequestState state);
//
//   void listen(RequestState state) {}
//
//   // bool hasData() {
//   //   return getModel().hasData();
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//
//     // subscriptions.add(getModel().rxStream.listen((stream) {
//     //   switch(stream.type) {
//     //     case StreamEvent.error:
//     //       onError(stream.data);
//     //       break;
//     //     case StreamEvent.pushReplacementNamed:
//     //       Navigator.pushReplacementNamed(context, stream.get('page'),
//     //           arguments: stream.get('arguments'));
//     //       break;
//     //     case StreamEvent.push:
//     //       Navigator.of(context, rootNavigator: stream.get('root_navigator') == true)
//     //           .pushNamed(stream.get('page'), arguments: stream.get('arguments'));
//     //       break;
//     //     case StreamEvent.pop:
//     //       Navigator.pop(context, stream.data);
//     //       break;
//     //     case StreamEvent.snackBar:
//     //       showSnackBar(stream.data);
//     //       break;
//     //   }
//     // }));
//   }
//
//   // void showSnackBar(String message) {
//   //   scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
//   //   scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
//   //     content: Text(
//   //       message,
//   //       style: const TextStyle(color: RxColors.blackColor),
//   //     ),
//   //     backgroundColor: RxColors.gray10,
//   //     action: SnackBarAction(
//   //       onPressed: () {
//   //         scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
//   //       },
//   //       label: 'X',
//   //     ),
//   //   ));
//   // }
//
//   Widget emptyBody() {
//     return const SizedBox.shrink();
//   }
//
//   @override
//   void dispose() {
//     //getModel().unregisterSubscriptions();
//     super.dispose();
//   }
//
//   void showLoading() {
//     if (overlayEntry == null) {
//       overlayEntry = OverlayEntry(builder: (context) {
//         return buildRefreshIndicator(true);
//       });
//       Overlay.of(context)?.insert(overlayEntry!);
//     }
//   }
//
//   void hideLoading() {
//     if (overlayEntry != null) {
//       overlayEntry?.remove();
//       overlayEntry = null;
//     }
//   }
// }