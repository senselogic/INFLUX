// -- IMPORTS

import "view.dart";

// -- TYPES

class ViewManager
{
    // -- ATTRIBUTES

    static Set<View>
        viewSet = {};

    // -- CONSTRUCTORS

    ViewManager(
        ) :
        super();

    // -- OPERATIONS

    static void addView(
        View view
        )
    {
        if ( !viewSet.contains( view ) )
        {
            viewSet.add( view );
        }
    }

    // ~~

    static void removeView(
        View view
        )
    {
        viewSet.remove( view );
    }

    // ~~

    static void updateViews(
        {
            List<dynamic> updatedData = const []
        }
        )
    {
        if ( updatedData.isEmpty )
        {
            for ( var view in viewSet )
            {
                view.updateView();
            }
        }
        else
        {
            for ( var view in viewSet )
            {
                var viewData = view.getViewData();

                if ( viewData.isEmpty )
                {
                    view.updateView();
                }
                else
                {
                    for ( var updatedDependency in updatedData )
                    {
                        if ( viewData.contains( updatedDependency ) )
                        {
                            view.updateView();

                            break;
                        }
                    }
                }
            }
        }
    }
}
