#!/usr/bin/env nu

def main [] {
  let root = $env.FILE_PWD
  let nu_dir = $"($env.HOME)/Library/Application Support/nushell"

  [
    [nvim/init.lua            $"($env.HOME)/.config/nvim/init.lua"]
    [nushell/config.nu        $"($nu_dir)/config.nu"]
    [nushell/env.nu           $"($nu_dir)/env.nu"]
    [nushell/scripts/job.nu   $"($nu_dir)/scripts/job.nu"]
    [asdf/.tool-versions      $"($env.HOME)/.tool-versions"]
    [ssh/authorized_keys      $"($env.HOME)/.ssh/authorized_keys"]
  ]
  | each {|p|
      let src = $"($root)/($p.0)" | path expand
      let dest = $p.1
      mkdir ($dest | path dirname)
      if (^ln -s $src $dest | complete).exit_code == 0 {
        print $"ok 新建 ($dest)"
      } else if (ls -l $dest | get 0.target?) == $src {
        print $"ok 已有 ($dest)"
      } else {
        print $"fail ($dest)"
      }
    }
  | ignore
}
