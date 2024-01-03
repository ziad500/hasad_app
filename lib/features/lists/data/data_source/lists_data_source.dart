import '../network/lists_api.dart';
import '../network/requests.dart';
import '../responses/lists_response.dart';

abstract class ListsRemoteDataSource {
  Future<ListsResponse> listsbyEndPoint(AllListsRequest allListsRequest);

  Future<ListsResponse> citiesLists(RegionsListRequest regionsListRequest);

  Future<ListsResponse> typesLists(DepartmentsListRequest departmentsListRequest);

  Future<ListsResponse> districtsLists(RegionsListRequest regionsListRequest);
}

class ListsRemoteDataSourceImpl implements ListsRemoteDataSource {
  final ListsAppServiceClient _appServiceClient;
  ListsRemoteDataSourceImpl(
    this._appServiceClient,
  );

  @override
  Future<ListsResponse> citiesLists(RegionsListRequest regionsListRequest) =>
      _appServiceClient.citiesLists(regionsListRequest.regionsIds);

  @override
  Future<ListsResponse> districtsLists(RegionsListRequest regionsListRequest) =>
      _appServiceClient.districtsLists(regionsListRequest.regionsIds);

  @override
  Future<ListsResponse> listsbyEndPoint(AllListsRequest allListsRequest) =>
      _appServiceClient.listsbyEndPoint(allListsRequest.listEndPoint);

  @override
  Future<ListsResponse> typesLists(DepartmentsListRequest departmentsListRequest) =>
      _appServiceClient.typesLists(departmentsListRequest.departmentsIds);
}
