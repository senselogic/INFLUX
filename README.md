![](https://github.com/senselogic/INFLUX/blob/master/LOGO/influx.png)

# Influx

Flutter base library.

## Features

*   Model dataView manager with navigation observer

## Installation

Add `influx: ^0.2.0` to your `pubspec.yaml` dependencies:

```dart

dependencies:
  flutter:
    sdk: flutter
  ...
  influx: ^0.2.0
```

Import it:

```dart
import 'package:influx/influx.dart';
```

## Examples

### Model dataView manager

```dart
class AppViewState extends State<AppView>
{
    ...

    @override
    Widget build( BuildContext context )
    {
        return MaterialApp(
            ...
            navigatorObservers: <NavigatorObserver>[ DataViewNavigatorObserver.instance ],
            ...
            );
    }
}
```

```dart
class AbcViewState extends State<AbcView> implements DataView
{
    Abc
        abc;

    ...

    @override
    Widget build( BuildContext build_context )
    {
        DataViewManager.instance.addView( this );

        return Scaffold(
            ...
            );
    }

    @override
    void dispose()
    {
        DataViewManager.instance.removeView( this );

        super.dispose();
    }

    @override
    List<dynamic> getViewData()
    {
        return [ abc ];
    }

    @override
    void updateView()
    {
        setState( () {} );
    }
}
```

```dart
class Abc
{
    ...

    void ChangeSomething(
        )
    {
        ...
        DataViewManager.instance.updateViews( [ this ] );
    }
}
```

## Version

0.2

## Author

Eric Pelzer (ecstatic.coder@gmail.com).

## License

This project is licensed under the GNU Lesser General Public License version 3.

See the [LICENSE](LICENSE) file for details.
