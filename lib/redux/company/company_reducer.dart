import 'package:redux/redux.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/company/company_state.dart';
import 'package:invoiceninja_flutter/redux/product/product_reducer.dart';
import 'package:invoiceninja_flutter/redux/client/client_reducer.dart';
import 'package:invoiceninja_flutter/redux/invoice/invoice_reducer.dart';
import 'package:invoiceninja_flutter/redux/dashboard/dashboard_reducer.dart';
import 'package:invoiceninja_flutter/redux/company/company_actions.dart';

CompanyState companyReducer(CompanyState state, dynamic action) {

  return state.rebuild((b) => b
      ..clientState.replace(clientsReducer(state.clientState, action))
      ..company.replace(companyEntityReducer(state.company, action))
      ..dashboardState.replace(dashboardReducer(state.dashboardState, action))
      ..productState.replace(productsReducer(state.productState, action))
      ..invoiceState.replace(invoicesReducer(state.invoiceState, action))
  );
}

Reducer<CompanyEntity> companyEntityReducer = combineReducers([
  TypedReducer<CompanyEntity, LoadCompanySuccess>(loadCompanySuccessReducer),
]);

CompanyEntity loadCompanySuccessReducer(CompanyEntity company, LoadCompanySuccess action) {
  return action.company;
}