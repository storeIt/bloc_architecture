// import 'dart:async';
//
// import 'package:equatable/equatable.dart';
// import 'package:event_bus/event_bus.dart';
//
// import '../../data/models/category/category.dart';
// import '../../data/models/search/new_products.dart';
// import '../../data/network/remix_service.dart';
// import '../../filters/events/on_boarding_event.dart';
// import '../../filters/utils/categories_manager.dart';
// import '../../firebase/deep_link_event.dart';
// import '../../home/events/category_event.dart';
// import '../../service_locator.dart';
// import '../../socketio/events/rx_message_event.dart';
// import '../../user/events/login_event.dart';
// import '../../util/service/rest_api_service.dart';
// import 'base_state.dart';
// import 'request_cubit.dart';
// import 'request_state.dart';
//
// part 'search_state.dart';
//
// class SearchCubit extends RequestCubit<RestClient> {
//   final Map<String, String> genderMap;
//   late NewProducts newProducts;
//   late List<Category> categories;
//
//   //common
//   final List<StreamSubscription> subscriptions = [];
//   final EventBus eventBus = locator<EventBus>();
//
//   SearchCubit(RestClient api, this.genderMap) : super(api);
//
//   @override
//   Future<void> loadData() async {
//     await Future.wait([
//       getCategories(),
//       getNewProducts(),
//       Future.delayed(const Duration(seconds: 10))
//     ]);
//
//     subscribeToEvents();
//
//     emit(SearchLoaded(categories, newProducts));
//   }
//
//   Future<void> getCategories() async {
//     categories = await api.getCategories();
//
//     locator<CategoriesManager>().categories = categories;
//     locator<EventBus>().fire(DeepLinkEvent());
//   }
//
//   Future<void> getNewProducts() async {
//     newProducts = await api.getNewProductsCount(params: genderMap);
//   }
//
//   void subscribeToEvents() {
//     subscriptions.add(eventBus.on<CategoryEvent>().listen((event) {
//       if (event.type == CategoryEventType.search && event.dataParams is Map) {
//         emit(OpenProducts(event));
//       }
//     }));
//
//     subscriptions.add(eventBus.on<OnBoardingEvent>().listen((event) {
//       emit(ShowOnBoarding());
//     }));
//
//     subscriptions.add(locator<EventBus>().on<LoginEvent>().listen((event) async {
//       await getNewProducts();
//       emit(SearchLoaded(categories, newProducts));
//     }));
//
//     subscriptions.add(locator<EventBus>().on<RxMessageEvent>().listen((event) {
//       emit(const RequestState.loading());
//       Future.delayed(const Duration(milliseconds: 500), () {
//         newProducts.show = event.show;
//         newProducts.newProductsCount = event.productsCount;
//         emit(SearchLoaded(categories, newProducts));
//       });
//     }));
//   }
// }
