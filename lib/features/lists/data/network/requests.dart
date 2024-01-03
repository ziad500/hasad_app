class AllListsRequest {
  String listEndPoint;
  AllListsRequest(this.listEndPoint);
}

class RegionsListRequest {
  List<int> regionsIds;
  RegionsListRequest(this.regionsIds);
}

class DepartmentsListRequest {
  List<int> departmentsIds;
  DepartmentsListRequest(this.departmentsIds);
}
