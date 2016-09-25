# This is a fairly dodgy and person powershell profile, 
# probably best you not use too much of, just pick and choose 
# if anything :) 
# set-executionpolicy unrestricted

[Environment]::SetEnvironmentVariable("GIT_SSH", "C:\ProgramData\chocolatey\bin\plink.exe", "User")
[Environment]::SetEnvironmentVariable("GOPATH", "C:\Users\rmelton\Go", "User")
[Environment]::SetEnvironmentVariable("PATH", "C:\Program Files\ImageMagick-7.0.2-Q16;C:\Program Files\ImageMagick-7.0.1-Q16;C:\ProgramData\Oracle\Java\javapath;C:\Program Files\ImageMagick-6.9.3-Q16;C:\Program Files\ImageMagick-6.9.2-Q16;C:\Program Files\ImageMagick-6.9.1-Q16;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\ProgramData\chocolatey\bin;C:\Program Files (x86)\Subversion\bin;C:\Program Files (x86)\Bazaar\;C:\Program Files (x86)\vim\vim74;C:\Users\rmelton\.dnx\bin;C:\Program Files\Microsoft DNX\Dnvm\;C:\Program Files\Java\jdk1.7.0_76\bin;C:\Program Files (x86)\Gow\bin;C:\Program Files\Java\jdk1.7.0_79\bin;C:\Program Files\Mercurial;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit\;C:\Program Files\Microsoft SQL Server\130\Tools\Binn\;C:\Program Files\Java\jdk1.8.0_92\bin;C:\Users\rmelton\AppData\Local\Android\android-sdk\tools;C:\Users\rmelton\AppData\Local\Android\android-sdk\platform-tools;C:\Program Files\Java\jdk1.8.0_102\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Go\bin;C:\Program Files (x86)\Skype\Phone\;C:\Program Files\Git\cmd;C:\Users\rmelton\bin;C:\Go\bin;C:\Users\rmelton\Go\bin;C:\PROGRA~2\Oracle\VirtualBox;C:\Program Files\Mercurial\;C:\Users\rmelton\Google Drive\bin;C:\tools\cmder;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps", "User")

$downloads = "C:\Users\rmelton\Downloads"
$documents = "C:\Users\rmelton\Documents"
$personal = "C:\Users\rmelton\Projects"

# remove
remove-item alias:curl
remove-item alias:wget

# so lazy
$d = $downloads
$p = $personal

function up {
    cd ..
}

function hosts {
    vim C:\Windows\system32\drivers\etc\hosts
}

function rm-rf {
    if ($args) {
        rm -re -fo $args
    }
}

function prompt {
    $computername = ($env:computername).tolower()
    $username = ($env:username).tolower()
    $location = (get-location).path
    $host.ui.rawui.windowtitle = $location
    $private:h = @(get-history)
    $private:nextcommand = $private:h[$private:h.count - 1].id + 1
    $wi = [system.security.principal.windowsidentity]::getcurrent()
    $wp = new-object 'system.security.principal.windowsprincipal' $wi

    write-host -nonewline -foregroundcolor white "["
    write-host -nonewline -foregroundcolor green $private:nextcommand
    write-host -nonewline -foregroundcolor white "]["

    if ( $wp.isinrole("administrators") -eq 1 ) {
        write-host -nonewline -foregroundcolor red $username
    } else {
        write-host -nonewline -foregroundcolor red $username
    }

    write-host -nonewline -foregroundcolor white "."
    write-host -nonewline -foregroundcolor cyan ($env:computername).tolower() 
    write-host -nonewline -foregroundcolor white " "
    write-host -nonewline -foregroundcolor yellow $location
    write-host -nonewline -foregroundcolor white "]"
    write-host -nonewline -foregroundcolor magenta "$"
    return " "
}

# vim: set ft=ps1:
