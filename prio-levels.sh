# Priority tuning functions:
# nice_prio - scheduling policy dynamic priority
#   ranges from -20 (highest priority) to 19 (lowest priority)
#   default is 0
# sched_policy - scheduling policy
#   valid values:
#     0 - normal
#     2 X - realtime round robin, requires sched_prio
#     3 - batch
#     5 - idle, not influenced by nice
#   default is 0
# sched_prio - scheduling policy static priority
#   ranges from 1 (lowest priority) to 99 (highest priority)
#   default is 1
# ionice_class - I/O class policy
#   valid values:
#     1 X - realtime, requires ionice_prio
#     2 X - best effort (default), requires ionice_prio
#     3 - idle
#   default is 2
# ionice_prio - I/O class policy priority
#   ranges from 0 (highest priority) to 7 (lowest priority)
#   default is 4
# cpu_affinity - which CPUs the process can run
#   pass a bitmask like 0x3 or a list of numbers like 0,1
#   never use a 0x0 bitmask
#   default is 0xffffffff

function prio_defaults { prio_cpu_normal; prio_io_normal; }

#### CPU priority levels

function prio_cpu_rt_highest      { sched_policy 2; sched_prio 99; }
function prio_cpu_rt_high         { sched_policy 2; sched_prio 80; }
function prio_cpu_rt_above_normal { sched_policy 2; sched_prio 60; }
function prio_cpu_rt_normal       { sched_policy 2; sched_prio 50; }
function prio_cpu_rt_below_normal { sched_policy 2; sched_prio 40; }
function prio_cpu_rt_low          { sched_policy 2; sched_prio 20; }
function prio_cpu_rt_lowest       { sched_policy 2; sched_prio 1; }

function prio_cpu_highest       { sched_policy 0; nice_prio -20; }
function prio_cpu_high          { sched_policy 0; nice_prio -15; }
function prio_cpu_above_normal  { sched_policy 0; nice_prio -10; }
function prio_cpu_normal        { sched_policy 0; nice_prio 0; }
function prio_cpu_below_normal  { sched_policy 0; nice_prio 10; }
function prio_cpu_low           { sched_policy 0; nice_prio 15; }
function prio_cpu_lowest        { sched_policy 0; nice_prio 19; }

function prio_cpu_batch_highest       { sched_policy 3; nice_prio -20; }
function prio_cpu_batch_high          { sched_policy 3; nice_prio -15; }
function prio_cpu_batch_above_normal  { sched_policy 3; nice_prio -10; }
function prio_cpu_batch_normal        { sched_policy 3; nice_prio 0; }
function prio_cpu_batch_below_normal  { sched_policy 3; nice_prio 10; }
function prio_cpu_batch_low           { sched_policy 3; nice_prio 15; }
function prio_cpu_batch_lowest        { sched_policy 3; nice_prio 19; }

function prio_cpu_idle { sched_policy 5; }

####

function prio_cpu_interactive_important { prio_cpu_highest; }
function prio_cpu_interactive { prio_cpu_high; }
function prio_cpu_interactive_greedy { prio_cpu_below_normal; }

function prio_cpu_secondary_important { prio_cpu_above_normal; }
function prio_cpu_secondary { prio_cpu_normal; }
function prio_cpu_secondary_greedy { prio_cpu_low; }

function prio_cpu_latency_sensitive { prio_cpu_rt_high; }

function prio_cpu_system_daemon { prio_cpu_rt_lowest; }
function prio_cpu_user_daemon { prio_cpu_low; }

function prio_cpu_system_batch { prio_cpu_batch_low; }
function prio_cpu_user_batch { prio_cpu_batch_lowest; }

#### IO priority levels

function prio_io_rt_highest       { ionice_class 1; ionice_prio 1; }
function prio_io_rt_high          { ionice_class 1; ionice_prio 2; }
function prio_io_rt_above_normal  { ionice_class 1; ionice_prio 3; }
function prio_io_rt_normal        { ionice_class 1; ionice_prio 4; }
function prio_io_rt_below_normal  { ionice_class 1; ionice_prio 5; }
function prio_io_rt_low           { ionice_class 1; ionice_prio 6; }
function prio_io_rt_lowest        { ionice_class 1; ionice_prio 7; }

function prio_io_highest      { ionice_class 2; ionice_prio 1; }
function prio_io_high         { ionice_class 2; ionice_prio 2; }
function prio_io_above_normal { ionice_class 2; ionice_prio 3; }
function prio_io_normal       { ionice_class 2; ionice_prio 4; }
function prio_io_below_normal { ionice_class 2; ionice_prio 5; }
function prio_io_low          { ionice_class 2; ionice_prio 6; }
function prio_io_lowest       { ionice_class 2; ionice_prio 7; }

function prio_io_idle { ionice_class 3; }

####

function prio_io_interactive_important { prio_io_highest; }
function prio_io_interactive { prio_io_high; }
function prio_io_interactive_greedy { prio_io_below_normal; }

function prio_io_secondary_important { prio_io_above_normal; }
function prio_io_secondary { prio_io_normal; }
function prio_io_secondary_greedy { prio_io_low; }

function prio_io_latency_sensitive { prio_io_rt_highest; }

function prio_io_system_daemon { prio_io_rt_lowest; }
function prio_io_user_daemon { prio_io_low; }

function prio_io_system_batch { prio_io_low; }
function prio_io_user_batch { prio_io_lowest; }
