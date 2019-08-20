unit module NSJail;

class NSJail {
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
    multi method log-fd(Str "stdout") { @!args.push: "-L 1"; self }
    multi method log-fd(Str "stderr") { @!args.push: "-L 2"; self }
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
    method persona-addr-limit-3gb { @!args.push: '--persona_addr_limit_3gb'; self }
    method persona-addr-no-randomize { @!args.push: '--persona_addr_no_randomize'; self }
    method disable-clone-newnet { @!args.push: '--disable_clone_newnet'; self }
    method disable-clone-newuser { @!args.push: '--disable_clone_newuser'; self }
    method disable-clone-newns { @!args.push: '--disable_clone_newns'; self }
    method disable-clone-newpid { @!args.push: '--disable_clone_newpid'; self }
    method disable-clone-newipc { @!args.push: '--disable_clone_newipc'; self }
    method disable-clone-newuts { @!args.push: '--disable_clone_newuts'; self }
    method disable-clone-newcgroup { @!args.push: '--disable_clone_newcgroup'; self }

    # Execution methods
    method run(Str $file-path where *.IO.f, Str *@args) { 
        qqx( { @!cmd } { @!args } -- $file-path { @args } ) 
    }

    method run-async(Str $file-path where *.IO.f, Str *@args) { 
        qqx( { @! } -- $file-path ) 
    }
}