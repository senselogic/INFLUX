![](https://github.com/senselogic/INFLUX/blob/master/LOGO/influx.png)

# Influx

Flutter base library.

## Features

*   Model view manager with navigation observer

## Installation

Add `influx: ^0.1.7` to your `pubspec.yaml` dependencies:

```dart

dependencies:
  flutter:
    sdk: flutter
  ...
  influx: ^0.1.7
```

Import it:

```dart
import 'package:influx/influx.dart';
```

## Examples

### Model view manager

```dart
class AppViewState extends State<AppView>
{
    ...

    @override
    Widget build( BuildContext context )
    {
        return MaterialApp(
            ...
            navigatorObservers: <NavigatorObserver>[ ViewNavigatorObserver.instance ],
            ...
            );
    }
}
```

```dart
class AbcViewState extends State<AbcView> implements View
{
    Abc
        abc;

    ...

    @override
    Widget build( BuildContext build_context )
    {
        ViewManager.instance.addView( this );

        return Scaffold(
            ...
            );
    }

    @override
    void dispose()
    {
        ViewManager.instance.removeView( this );

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
        ViewManager.instance.updateViews( [ this ] );
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
