// -- IMPORTS

import "package:flutter/material.dart";
import "data_view_manager.dart";

// -- TYPES

class DataViewNavigatorObserver extends NavigatorObserver
{
    // -- ATTRIBUTES

    static DataViewNavigatorObserver
        instance = DataViewNavigatorObserver();

    // -- CONSTRUCTORS

    DataViewNavigatorObserver(
        ) :
        super();

    // -- OPERATIONS

    @override
    void didPop(
        Route<dynamic> route,
        Route<dynamic>? previousRoute
        )
    {
        DataViewManager.instance.updateViews();

        super.didPop( route, previousRoute );
    }
}
