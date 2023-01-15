// -- IMPORTS

import "model_view.dart";

// -- TYPES

class ModelViewManager
{
    // -- ATTRIBUTES

    static Set<ModelView>
        modelViewSet = {};

    // -- CONSTRUCTORS

    ModelViewManager(
        ) :
        super();

    // -- OPERATIONS

    static void addView(
        ModelView modelView
        )
    {
        if ( !modelViewSet.contains( modelView ) )
        {
            modelViewSet.add( modelView );
        }
    }

    // ~~

    static void removeView(
        ModelView modelView
        )
    {
        modelViewSet.remove( modelView );
    }

    // ~~

    static void manageChange(
        {
            List<dynamic> updatedDependencyList = const []
        }
        )
    {
        if ( updatedDependencyList.isEmpty )
        {
            for ( var modelView in modelViewSet )
            {
                modelView.updateView();
            }
        }
        else
        {
            for ( var modelView in modelViewSet )
            {
                var viewDependencyList = modelView.getViewDependencyList();

                if ( viewDependencyList.isEmpty )
                {
                    modelView.updateView();
                }
                else
                {
                    for ( var updatedDependency in updatedDependencyList )
                    {
                        if ( viewDependencyList.contains( updatedDependency ) )
                        {
                            modelView.updateView();

                            break;
                        }
                    }
                }
            }
        }
    }
}
