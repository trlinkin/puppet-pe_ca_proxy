# THIS MODULE IS ONLY FOR USE WITH PUPPET ENTERPRISE 3.7.0 - FOR ANY OTHER VERSION IT SHOULD NOT BE USED
# pe_ca_proxy

This module is a stop-gap solution for setting up CA proxying in PE
3.7.0 until full support is added to a future release. The PuppetServer
project already has proper support, this simply activates it.

## Usage

Making use of this module is rather simple. There is only one main
class, `pe_ca_proxy`, and it only has one required parameter,
`proxy_target`.

The best suggested usage is to create a new group in the PE Node
Classifier called "PE Certificate Authority Proxy", add the
`pe_ca_proxy` class to it, and set the `proxy_target` parameter. Then
pin the "compile only" (or spoke) masters to this group.

## PE Versions Supported

For the current term, this module will be considered applicable to
PE 3.7.0 only. It's use should be ceased during an upgrade to PE 3.7.1,
however this may change. The next version of PE should be able to
automatically clean up the effects of this module if it is simply
removed from a Master's classification.

## Cleaning Up Usage

When stopping usage of the module, be sure to manually remove the file "/etc/puppetlabs/puppetserver/conf.d/ca\_proxy.conf" from the masters on which this module was placed. **If you do not clean it up, puppetserver will fail to start!**
