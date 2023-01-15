![](https://github.com/senselogic/INFLUX/blob/master/LOGO/influx.png)

# Influx

Flutter base library.

## Features

*   Update manager
*   Navigation observer

## Installation

Add `influx: ^0.1.1` to your `pubspec.yaml` dependencies and import it as follows:

```dart
import 'package:influx/influx.dart';
```

## Examples

### Update manager

```dart
import "model_view_navigation_observer.dart";

class AppViewState extends State<AppView>
{
    ...

    @override
    Widget build( BuildContext context )
    {
        return MaterialApp(
            ...
            navigatorObservers: <NavigatorObserver>[ ModelViewNavigatorObserver.instance ],
            ...
            );
    }
}
```

```dart
import "model_view.dart";
import "model_view_manager.dart";

class AbcViewState extends State<AbcView> implements ModelView
{
    Abc
        abc;

    ...

    @override
    Widget build( BuildContext build_context )
    {
        ModelViewManager.addView( this );

        return Scaffold(
            ...
            );
    }

    @override
    void dispose()
    {
        ModelViewManager.removeView( this );

        super.dispose();
    }

    @override
    void updateView()
    {
        setState( () {} );
    }

    @override
    List<dynamic> getModelList()
    {
        return [ abc ];
    }
}
```

```dart
import "model_view_manager.dart";

class Abc
{
    ...

    void ChangeSomething(
        )
    {
        ...
        ModelViewManager.manageChange( [ this ] );
    }
}
```

## Version

0.1

## Author

Eric Pelzer (ecstatic.coder@gmail.com).

## License

This project is licensed under the GNU Lesser General Public License version 3.

See the [LICENSE](LICENSE) file for details.
