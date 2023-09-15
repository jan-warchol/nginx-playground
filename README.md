Nginx playground
----------------

Some examples for experimenting with nginx setup, particularly for SPA.
Directories from `configs/` are mounted inside VM's `/etc/nginx/` so that
you can easily edit config files from host OS.

1.  Download and install
    [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and
    [Vagrant](https://www.vagrantup.com/intro/getting-started/install.html)
1.  Start development VM and login: `vagrant up && vagrant ssh`
1.  Inside VM, run `/vagrant/nginx-continuous-reload.sh` so that config changes
    will be applied continuously
1.  You can also run `./watch-for-nginx-config-error.sh` outside of the VM to
    get a notification in case of config error

There should be a sample vue app available at [localhost:8001](http://localhost:8001)
and [localhost:8002/my-app](http://localhost:8002/my-app).

> Note: sometimes you have to reload a page twice in your browser to see the
  effect of config changes.
