
WatchmenOptions {
    notifies {
        eventlog @{
            eventid = '1'
            eventtype = 'error'
        }
        eventlog @{
            eventid = '10'
            eventtype = 'warning'
        }
        logfile 'c:\temp\watchmen.log'
        syslog 'localhost'
    }
}

# This test should PASS
WatchmenTest 'OVF.Example1' {
    version 0.1.0
    #parameters @{
    #    FreeSystemDriveThreshold = 50000
    #}
}

# This test should FAIL
WatchmenTest 'OVF.Example1' {
    version 0.1.0
    parameters @{
        FreeSystemDriveThreshold = 50000
    }
    notifies {
        logfile 'c:\temp\watchmen2.log'
    }
}

# Run tests with defaults for everything
WatchmenTest 'OVF.Example2' {}

# This test should FAIL because module is missing
# WatchmenTest 'MyOVFModule' {
#     fromsource 'PSGallery'
# }