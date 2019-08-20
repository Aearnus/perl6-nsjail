unit module NSJail;

class NSJail is export {
    has Str $!cmd = %?RESOURCES<nsjail-cli>.path;
    has Str @!args;

    # Config methods
    method mode(Str $v where * ~~ <l o e r TCP ONCE EXECVE RERUN>.any) {
        given $v {
            when <l TCP>.any { @!args.push: "-M l" }
            when <o ONCE>.any { @!args.push: "-M o" }
            when <e EXECVE>.any { @!args.push: "-M e" }
            when <r RERUN>.any { @!args.push: "-M r" }
        }
        self
    }
    method config($v where *.IO.f) { @!args.push: "-C $v"; self }
    method chroot($v where *.IO.d) { @!args.push: "-c $v"; self }
    method rw { @!args.push: '--rw'; self }
    method user(Str $v) { @!args.push: "-u $v"; self }
    method group(Str $v) { @!args.push: "-g $v"; self }
    method hostname(Str $v) { @!args.push: "-H $v"; self }
    method cwd(Str $v) { @!args.push: "-D $v"; self }
    method port(Int $v) { @!args.push: "-p $v"; self }
    method bindhost(Str $v) { @!args.push: "--bindhost $v"; self }
    method max-conn(Int $v) { @!args.push: "-i $v"; self }
    method log-file(IO::Path(Str) $v) { @!args.push: "-l $v"; self }
    multi method log-fd(Int $v) { @!args.push: "-L $v"; self }
    multi method log-fd("stdout") { @!args.push: "-L 1"; self }
    multi method log-fd("stderr") { @!args.push: "-L 2"; self }
    method time-limit(Int $v) { @!args.push: "-t $v"; self }
    method max-cpus(Int $v) { @!args.push: "--max_cpus $v"; self }
    method daemonize { @!args.push: '-d'; self }
    method verbose { @!args.push: '-v'; self }
    method quiet { @!args.push: '-q'; self }
    method really-quiet { @!args.push: '-Q'; self }
    method keep-env { @!args.push: '-e'; self }
    method env(Str $v) { @!args.push: "-E $v"; self }
    method keep-caps { @!args.push: '--keep_caps'; self }
    method cap(Str $v) { @!args.push: "--cap $v"; self }
    method silent { @!args.push: '--silent'; self }
    method stderr_to_null { @!args.push: '--stderr_to_null'; self }
    method skip-setsid { @!args.push: '--skip_setsid'; self }
    method pass-fd(Int $v) { @!args.push: "--pass_fd $v"; self }
    method disable-no-new-privs { @!args.push: '--disable_no_new_privs'; self }
    multi method rlimit-as(Int $v) { @!args.push: "--rlimit_as $v"; self }
    multi method rlimit-as(Str $v where * ~~ <max hard def soft inf>.any) { @!args.push: "--rlimit_as $v"; self }
    multi method rlimit-core(Int $v) { @!args.push: "--rlimit_core $v"; self }
    multi method rlimit-core(Str $v where * ~~ <max hard def soft inf>.any) { @!args.push: "--rlimit_core $v"; self }
    multi method rlimit-cpu(Int $v) { @!args.push: "--rlimit_cpu $v"; self }
    multi method rlimit-cpu(Str $v where * ~~ <max hard def soft inf>.any) { @!args.push: "--rlimit_cpu $v"; self }
    multi method rlimit-fsize(Int $v) { @!args.push: "--rlimit_fsize $v"; self }
    multi method rlimit-fsize(Str $v where * ~~ <max hard def soft inf>.any) { @!args.push: "--rlimit_fsize $v"; self }
    multi method rlimit-nofile(Int $v) { @!args.push: "--rlimit_nofile $v"; self }
    multi method rlimit-nofile(Str $v where * ~~ <max hard def soft inf>.any) { @!args.push: "--rlimit_nofile $v"; self }
    multi method rlimit-nproc(Int $v) { @!args.push: "--rlimit_nproc $v"; self }
    multi method rlimit-nproc(Str $v where * ~~ <max hard def soft inf>.any) { @!args.push: "--rlimit_nproc $v"; self }
    multi method rlimit-stack(Int $v) { @!args.push: "--rlimit_stack $v"; self }
    multi method rlimit-stack(Str $v where * ~~ <max hard def soft inf>.any) { @!args.push: "--rlimit_stack $v"; self }
    method disable-rlimits { @!args.push: '--disable_rlimits'; self }
    method persona-addr-compat-layout { @!args.push: '--persona_addr_compat_layout'; self }
    method persona-mmap-page-zero { @!args.push: '--persona_mmap_page_zero'; self }
    method persona-read-implies-exec { @!args.push: '--persona_read_implies_exec'; self }
    method persona-addr-limit-threegb { @!args.push: '--persona_addr_limit_3gb'; self }
    method persona-addr-no-randomize { @!args.push: '--persona_addr_no_randomize'; self }
    method disable-clone-newnet { @!args.push: '--disable_clone_newnet'; self }
    method disable-clone-newuser { @!args.push: '--disable_clone_newuser'; self }
    method disable-clone-newns { @!args.push: '--disable_clone_newns'; self }
    method disable-clone-newpid { @!args.push: '--disable_clone_newpid'; self }
    method disable-clone-newipc { @!args.push: '--disable_clone_newipc'; self }
    method disable-clone-newuts { @!args.push: '--disable_clone_newuts'; self }
    method disable-clone-newcgroup { @!args.push: '--disable_clone_newcgroup'; self }
    method uid-mapping(Str $v) { @!args.push: "-U $v"; self }
    method gid-mapping(Str $v) { @!args.push: "-G $v"; self }
    method bindmount-ro(Str $v) { @!args.push: "-R $v"; self }
    method bindmount(Str $v) { @!args.push: "-B $v"; self }
    method tempfsmount(Str $v) { @!args.push: "-T $v"; self }
    method mount(Str $v) { @!args.push: "-m $v"; self }
    method symlink(Str $v) { @!args.push: "-s $v"; self }
    method disable-proc { @!args.push: '--disable_proc'; self }
    method proc-path(Str $v where *.IO.d) { @!args.push: "-s $v"; self }
    method proc-rw { @!args.push: '--proc_rw'; self }
    method seccomp-policy(Str $v) { @!args.push: "-P $v"; self }
    method seccomp-string(Str $v) { @!args.push: "--seccomp_string $v"; self }
    method seccomp-log { @!args.push: '--seccomp_log'; self }
    method nice-level(Int $v where -20 <= * <= 19) { @!args.push: "--nice_level $v"; self }
    method cgroup-mem-max(Int $v where * >= 0) { @!args.push: "--cgroup_mem_max $v"; self }
    method cgroup-mem-mount($v where *.IO.f) { @!args.push: "--cgroup_mem_mount $v"; self }
    method cgroup-mem-parent(Str $v) { @!args.push: "--cgroup_mem_parent $v"; self }
    method cgroup-pids-max(Int $v where * >= 0) { @!args.push: "--cgroup_pids_max $v"; self }
    method cgroup-pids-mount($v where *.IO.f) { @!args.push: "--cgroup_pids_mount $v"; self }
    method cgroup-pids-parent(Str $v) { @!args.push: "--cgroup_pids_parent $v"; self }
    method cgroup-net-cls-classid(Int $v where * >= 0) { @!args.push: "--cgroup_net_cls_classid $v"; self }
    method cgroup-net-cls-mount($v where *.IO.f) { @!args.push: "--cgroup_net_cls_mount $v"; self }
    method cgroup-net-cls-parent(Str $v) { @!args.push: "--cgroup_net_cls_parent $v"; self }
    method cgroup-cpu-ms-per-sec(Int $v where * >= 0) { @!args.push: "--cgroup_cpu_ms_per_sec $v"; self }
    method cgroup-cpu-mount($v where *.IO.f) { @!args.push: "--cgroup_cpu_mount $v"; self }
    method cgroup-cpu-parent(Str $v) { @!args.push: "--cgroup_cpu_parent $v"; self }
    method cgroupv2-mount($v where *.IO.f) { @!args.push: "--cgroupv2_mount $v"; self }
    method use-cgroupv2 { @!args.push: '--use_cgroupv2'; self }
    method iface-no-lo { @!args.push: '--iface_no_lo'; self }
    method iface-own(Str $v) { @!args.push: "--iface_own $v"; self }
    method macvlan-iface(Str $v) { @!args.push: "--macvlan_iface $v"; self }
    method macvlan-vs-ip(Str $v) { @!args.push: "--macvlan_vs_ip $v"; self }
    method macvlan-vs-nm(Str $v) { @!args.push: "--macvlan_vs_nm $v"; self }
    method macvlan-vs-gw(Str $v) { @!args.push: "--macvlan_vs_gw $v"; self }
    method macvlan-vs-ma(Str $v) { @!args.push: "--macvlan_vs_ma $v"; self }

    # Execution methods
    method run(Str $file-path where *.IO.f, *@args) { 
        qqx[ { $!cmd } { @!args } -- $file-path { @args } ]
    }
}