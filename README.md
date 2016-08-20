Linux Kernel - Build wrapper for mainline
=========================================


This build wrapper checks out the latest version of `torvalds` Linux kernel repository and performs a build,
generating RPM packages. They are for experimental use (NOT production)! Build happen on CentOS 7, but the
packages can also be installed on Fedora.


Usage
-----

Download the [kernel-mainline.repo](kernel-mainline.repo) file and place it in `/etc/yum.repos.d`.

```
$ dnf install -y kernel  # or yum
$ awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
$ grub2-set-default 0    # set default
$ grub2-editenv list     # verify
```

Note
----

This is pretty much the non-standard Fedora/CentOS way to build a kernel. More information about the
Fedora way can be found [here](https://fedoraproject.org/wiki/Building_a_custom_kernel).


Authors
-------

| [!["Gerard Braad"](http://gravatar.com/avatar/e466994eea3c2a1672564e45aca844d0.png?s=60)](http://gbraad.nl "Gerard Braad <me@gbraad.nl>") |
|---|
| [@gbraad](https://twitter.com/gbraad)  |

