# Support scripts

## gulpupd

The gulpupd script helps customers to keep the shipped images Up-to-date with the latest version of
vertice agent (gulpd)

```bash

# updates the 1.5 version, testing repo
gulpupd --version 1.5 --branch testing

# updates the 1.5 version, stable repo
gulpupd --version 1.5 --branch stable

````


## hook_vertice.rb
The Hook Manager present in OpenNebula enables the triggering of custom scripts tied to a change in state in a particular resource, being that a Host or a Virtual Machine.
Hook Manager configuration is set in /etc/one/oned.conf.

###Hooks for VirtualMachines
<ul class="simple">
<li><strong>name</strong> : for the hook, useful to track the hook (OPTIONAL)</li>
<li><strong>on</strong> : when the hook should be executed,<ul>
<li><strong>CREATE</strong>, when the VM is created (onevm create)</li>
<li><strong>RUNNING</strong>, after the VM is successfully booted</li>
<li><strong>SHUTDOWN</strong>, after the VM is shutdown</li>
<li><strong>STOP</strong>, after the VM is stopped (including VM image transfers)</li>
<li><strong>DONE</strong>, after the VM is destroyed or shutdown</li>
<li><strong>UNKNOWN</strong>, when the VM enters the unknown state</li>
<li><strong>CUSTOM</strong>, user defined specific STATE and LCM_STATE combination of states to trigger the hook.</li>
</ul>
</li>
<li><strong>command</strong> : path can be absolute or relative to <code class="docutils literal"><span class="pre">/var/lib/one/remotes/hooks</span></code></li>
<li><strong>arguments</strong> : for the hook. You can access the following VM attributes with $<ul>
<li><strong>$ID</strong>, the ID of the VM that triggered the hook execution</li>
<li><strong>$TEMPLATE</strong>, the template of the VM that triggered the hook, in xml and base64 encoded</li>
<li><strong>$PREV_STATE</strong>, the previous STATE of the Virtual Machine</li>
<li><strong>$PREV_LCM_STATE</strong>, the previous LCM STATE of the Virtual Machine</li>
</ul>
</li>
<li><strong>remote</strong> : values,<ul>
<li><strong>YES</strong>, The hook is executed in the host where the VM was allocated</li>
<li><strong>NO</strong>, The hook is executed in the OpenNebula server (default)</li>
</ul>
</li>
</ul>
<p>The following is an example of a hook tied to the DONE state of a VM:</p>

VM_HOOK = [
  name      = "vertice_hook",
  on        = "CUSTOM",
  state     = "ACTIVE",
  lcm_state = "BOOT",
  command   = "post_vertice_sync.rb",
  arguments = "$ID $TEMPLATE $PREV_STATE $PREV_LCM_STATE" ]

put your script file post_vertice_sync.rb in /var/lib/one/remotes/hooks

## letsencrypt
