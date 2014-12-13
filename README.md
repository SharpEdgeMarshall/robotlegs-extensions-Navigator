# AS3 Flex Navigator Robotlegs Extension

Navigator is an extension for Robotlegs 2.0. It offers:

+ Handling of application nested states ( path stile state )
+ Command execution based on state ( StateCommandMap )
+ View management based on state ( StateViewMap AS3 / Flex )
+ History management

This is a porting of the [Navigator for ActionScript 3.0](https://github.com/epologee/navigator-as3) library that is almost outdated.

## Documentation & Support

TODO: write documentation.
Until then refer to [Navigator Docs](https://github.com/epologee/navigator-as3/wiki).

# Quickstart

## Install NavigatorComplete Bundle

To get ready you just need to install NavigatorCompleteBundle that offers everything you'll need.

Plain ActionScript:

```as3
_context = new Context()
    .install(MVCSBundle)
    .install(NavigatorCompleteBundle)
    .configure(MyAppConfig, SomeOtherConfig)
    .configure(new ContextView(this));
```

Flex:

```xml
<fx:Declarations>
    <rl2:ContextBuilder>
        <mvcs:MVCSBundle/>
        <navigator:NavigatorCompleteBundle/>
        <config:MyAppConfig/>
    </rl2:ContextBuilder>
</fx:Declarations>
```

## Application & Module Configuration

A simple application configuration file might look something like this:

```as3
public class NavigatorConfig implements IConfig
{
    [Inject]
    public var statecommandMap:IStateCommandMap;

    [Inject]
    public var navigator:INavigator;

    public function configure():void
    {
        // Commands are triggered when the navigator enters the corresponding state
        statecommandMap.map("/", true).toCommand(HelloWorldCmd).once();
        
        // Finally, start navigating
        navigator.start("", "red");
    }
}
```
