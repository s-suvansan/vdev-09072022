(1) git init

(2) git add README.md

(3) git commit -m "Empty project with README"

(4) git remote add origin https://github.com/s-suvansan/vdev-09072022.git

(5) git push -u origin master

(6) go to this link  https://docs.flutter.dev/get-started/install
    then, choose your operating system.

    - If Windows,
        System requirements
        To install and run Flutter, your development environment must meet these minimum requirements:

        1) Operating Systems: Windows 10 or later (64-bit), x86-64 based.
        2) Disk Space: 1.64 GB (does not include disk space for IDE/tools).
        3) Tools: Flutter depends on these tools being available in your environment.
            - Windows PowerShell 5.0 or newer (this is pre-installed with Windows 10)
            - Git for Windows 2.x, with the Use Git from the Windows Command Prompt option.

        If Git for Windows is already installed, make sure you can run git commands from the command prompt or PowerShell.

 
    - If Mac,
        System requirements
        To install and run Flutter, your development environment must meet these minimum requirements:

        1) Operating Systems: macOS
        2) Disk Space: 2.8 GB (does not include disk space for IDE/tools).
        3) Tools: Flutter uses git for installation and upgrade. We recommend installing Xcode, which includes git, but you can  also install git separately.


    - If Linux,
        System requirements
        To install and run Flutter, your development environment must meet these minimum requirements:

        1) Operating Systems: Linux (64-bit)
        2) Disk Space: 600 MB (does not include disk space for IDE/tools).
        3) Tools: Flutter depends on these command-line tools being available in your environment.
            - bash
            - curl
            - file
            - git 2.x
            - mkdir
            - rm
            - unzip
            - which
            - xz-utils
            - zip
        4) Shared libraries: Flutter test command depends on this library being available in your environment.
            - libGLU.so.1 - provided by mesa packages such as libglu1-mesa on Ubuntu/Debian and mesa-libGLU on Fedora.

# For Windows,
Download Flutter SDK and Extract the zip file and place the contained flutter in the desired installation location for the Flutter SDK (for example, C:\src\flutter).
        Warning: Do not install Flutter to a path that contains special characters or spaces.
        Warning: Do not install Flutter in a directory like C:\Program Files\ that requires elevated privileges.

Update your path
----------------
From the Start search bar, enter ‘env’ and select 'Edit environment variables for your account'.
In Dialog Window, Click on 'Environment Variable...', 
    Will open another Dialog Window,
In 'User variables for user' section, 
choose 'Path' and click on 'Edit...',
    Will open another Dialog Window,
click 'New', Add flutter sdk path like "C:\Users\User\flutter\bin" then click 'OK'

# For MacOS,
Download Flutter SDK and Unzip the zip archive in a folder, say /path/to/flutter

Update the system path to include flutter bin directory (in ~/.bashrc file).
    export PATH = "$PATH:/path/to/flutter/bin"

Enable the updated path in the current session using below command and then verify it as well.
    source ~/.bashrc
    source $HOME/.bash_profile  
    echo $PATH

# For Linux
Download Flutter SDK and Extract the downloaded package using the following command.
    tar xf ~/flutter.tar.xz

Add the flutter bin folder path to environment path by entering it in terminal.
    export PATH="$PATH:`pwd`/flutter/bin"

-----------------------------------

Run 'flutter doctor' command in Command Prompt to check flutter installation status

Install VS Code and Flutter and Dart Extensions

Install the latest Android SDK, if reported by flutter doctor

Install the latest Android Studio and add Flutter and Dart Plugins, if reported by flutter doctor


# For Create a New Flutter Project 

open cmd/powershell, type
> flutter create project_name

or you can create flutter project in Android studio or in VS Code

after create project, open it in IDE 
before run app, Open Emulator or Simulator

then, using below command to run flutter,
> flutter run

or you can run using VS Code or Android Studio IDE,


for build app
as APK File,
> flutter build apk

as app bundle,
> flutter build appbundle

