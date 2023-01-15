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
            List<dynamic> updatedModelList = const []
        }
        )
    {
        if ( updatedModelList.isEmpty )
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
                var viewModelList = modelView.getModelList();

                if ( viewModelList.isEmpty )
                {
                    modelView.updateView();
                }
                else
                {
                    for ( var updatedModel in updatedModelList )
                    {
                        if ( viewModelList.contains( updatedModel ) )
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
