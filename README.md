collectd-varnish-http-codes
================
This is a collectd plugin to pull Varnish (<http://www.varnish-cache.org>) http response codes stats.
It is written in Ruby and as such, runs under the collectd Exec plugin.

Requirements
------------
**Varnish**
To use this plugin, Varnish must be configured and running.

**collectd**
collectd must have the Exec plugin installed. See (<https://collectd.org/wiki/index.php/Plugin:Exec>)

Example
-------
Write something like this in ```/etc/collectd.conf```:

```xml
LoadPlugin exec
<Plugin "exec">
  Exec "varnish" "/usr/local/bin/varnish_top_errors.rb"
</Plugin>
```