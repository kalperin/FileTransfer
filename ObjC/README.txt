File Transfer Module README.txt
-------------------------------

Installation
------------

 * The File Transfer Module, including library, sample application, appledocs,
   and Unit tests, is provided as Xcode projects. For instructions on how to 
   configure your Xcode environment to build these projects, please see the
   'File Transfer Module Usage Guide for iOS' at 
   https://www.alljoyn.org/docs-and-downloads/modules


Known Issues
------------

  * Interoperability with Android devices: File Announcements from an Android device
    are not seen by an iOS device. This is caused by an inability by the iOS device
    to see the broadcast signal from the Android device.

  * To select files for sharing, the sample app allows the user to browse only the 
    picture library. This limitation is a result of iOS's restriction that an app
    can access only files within its sandbox, without specific 'file management'
    logic per media type.