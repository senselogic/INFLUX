// -- IMPORTS

import "data_view.dart";

// -- TYPES

class DataViewManager
{
    // -- ATTRIBUTES

    Set<DataView>
        dataViewSet = {};
    static DataViewManager
        instance = DataViewManager();

    // -- CONSTRUCTORS

    DataViewManager(
        ) :
        super();

    // -- OPERATIONS

    void addView(
        DataView dataView
        )
    {
        if ( !dataViewSet.contains( dataView ) )
        {
            dataViewSet.add( dataView );
        }
    }

    // ~~

    void removeView(
        DataView dataView
        )
    {
        dataViewSet.remove( dataView );
    }

    // ~~

    void updateViews(
        {
            List<dynamic> updatedData = const []
        }
        )
    {
        if ( updatedData.isEmpty )
        {
            for ( var dataView in dataViewSet )
            {
                dataView.updateView();
            }
        }
        else
        {
            for ( var dataView in dataViewSet )
            {
                var viewData = dataView.getViewData();

                if ( viewData.isEmpty )
                {
                    dataView.updateView();
                }
                else
                {
                    for ( var updatedDependency in updatedData )
                    {
                        if ( viewData.contains( updatedDependency ) )
                        {
                            dataView.updateView();

                            break;
                        }
                    }
                }
            }
        }
    }
}
