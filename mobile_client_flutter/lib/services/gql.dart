import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;
import 'package:graphql_flutter/graphql_flutter.dart';

final String host =
    kIsWeb ? 'localhost' : Platform.isAndroid ? '10.0.2.2' : 'localhost';


Future<GraphQLClient> getClient() async {
  
  /// initialize Hive and wrap the default box in a HiveStore
  final store = await HiveStore.open();
  return GraphQLClient(
      /// pass the store to the cache for persistence
      cache: GraphQLCache(store: store),
      link: HttpLink('http://$host:4001/graphql'),
  );
}


/*
ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(cache: GraphQLCache(store: HiveStore()),
    link: HttpLink('http://$host:4001/graphql')),
);

*/