// -- IMPORTS

import "package:flutter/material.dart";
import "model_view_manager.dart";

// -- TYPES

class ModelViewNavigatorObserver extends NavigatorObserver
{
    // -- ATTRIBUTES

    static ModelViewNavigatorObserver
        instance = ModelViewNavigatorObserver();

    // -- CONSTRUCTORS

    ModelViewNavigatorObserver(
        ) :
        super();

    // -- OPERATIONS

    @override
    void didPop(
        Route<dynamic> route,
        Route<dynamic>? previousRoute
        )
    {
        ModelViewManager.manageChange();

        super.didPop( route, previousRoute );
    }
}
