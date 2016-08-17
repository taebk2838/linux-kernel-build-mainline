Linux Kernel - Build wrapper for mainline
=========================================


This build wrapper checks out the latest version of `torvalds` Linux kernel repository and performs a build,
generating RPM packages. They are for experimental use (NOT production)!


Usage
-----

Download the `kernel-mainline.repo` file and place it in `/etc/yum.repos.d`.

```
$ dnf install -y kernel  # or yum
```


Authors
-------

| [!["Gerard Braad"](http://gravatar.com/avatar/e466994eea3c2a1672564e45aca844d0.png?s=60)](http://gbraad.nl "Gerard Braad <me@gbraad.nl>") |
|---|
| [@gbraad](https://twitter.com/gbraad)  |

