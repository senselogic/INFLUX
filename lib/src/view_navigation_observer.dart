// -- IMPORTS

import "package:flutter/material.dart";
import "view_manager.dart";

// -- TYPES

class ViewNavigatorObserver extends NavigatorObserver
{
    // -- ATTRIBUTES

    static ViewNavigatorObserver
        instance = ViewNavigatorObserver();

    // -- CONSTRUCTORS

    ViewNavigatorObserver(
        ) :
        super();

    // -- OPERATIONS

    @override
    void didPop(
        Route<dynamic> route,
        Route<dynamic>? previousRoute
        )
    {
        ViewManager.instance.updateViews();

        super.didPop( route, previousRoute );
    }
}
