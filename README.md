Save logger package will help developer to save logger in Text format
and can delete and open the logger as well 

## Features

TODO: Save logger has crete logger and open logger and delete logger features.

## Getting started

```dart
save_logger: latest version
```

## Usage


```dart
SaveLogger.eventLog(className: "Hello Class",
methodName: "Method Name",
postRequest: "Post Req",
postResponse: "Past Response",
appLog: "App Log",
url: "Url will be here");

String path = await SaveLogger.getLogFilePath();

SaveLogger.printValue(path);

SaveLogger.openLogger(path: path);
```

## Additional information

You don't need any additional info for this
