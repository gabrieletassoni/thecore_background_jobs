Dependencies
------------

This gem depends on tiny\_tds, which depends on some debian packages to
be installed:

    sudo apt install freetds-dev redis-server

Sidekiq setup
-------------

Copy this into /lib/systemd/system/sidekiq-appname.service , change
**appname** with the actual name of your app.

    echo "Please provide the path to the app:";read APPPATH
    APPNAME=$(basename "$APPPATH")
    CURDIR=$(pwd)
    cd $APPPATH
    BUNDLEBIN=$(which bundle)
    cd $CURDIR
    cat <<EOM | sudo tee "/lib/systemd/system/sidekiq-$APPNAME.service"
    [Unit]
    Description=sidekiq-$APPNAME
    After=syslog.target network.target redis-server.service

    [Service]
    WorkingDirectory=$APPPATH
    Environment=SECRET_KEY_BASE=$(grep "SECRET_KEY_BASE" /etc/apache2/bancolini-confs/$APPNAME.conf|awk -F " " '{print $3}')
    Environment=TRACKER_DATABASE_PASSWORD=$APPNAME
    ExecStart=$BUNDLEBIN exec "sidekiq -e production" 
    User=${SUDO_USER:-$(whoami)}
    Type=simple
    RestartSec=1
    Restart=on-failure

    # output goes to /var/log/syslog
    StandardOutput=syslog
    StandardError=syslog
    SyslogIdentifier=sidekiq-$APPNAME

    [Install]
    WantedBy=multi-user.target
    EOM

Change **WorkingDirectory** to the current app path and **ExecStart** to
the sidekick used (usually a rvm path, comprised of gems)

Then enable it:

    sudo systemctl enable sidekiq-$APPNAME

and start:

    sudo service sidekiq-$APPNAME start

Now you can access the web ui, i.e.

    https://www.taris.it/development/ast/app/sidekiq

And you can manually test it in rails console:

    RAILS_ENV=production rails c

    ImportFromFtpWorker.perform_async

If you'd like to have the scheduled job run repeatedly, then add
**config/sidekiq.yml** with content like:

    :schedule:
      hello_world:
        cron: '0 * * * * *'   # Runs once per minute
        class: HelloWorld