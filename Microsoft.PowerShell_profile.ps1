# This is a fairly dodgy and person powershell profile, 
# probably best you not use too much of, just pick and choose 
# if anything :) 
# set-executionpolicy unrestricted

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
