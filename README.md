# bazel-multiworkspace-sampler

A issue using the "bazel-deps" from https://github.com/johnynek/bazel-deps while
having two sub-workspaces included using the "local_repository" rule.

1) Environment

Ubuntu 16.04, 4.4.0-81-generic #104-Ubuntu SMP, x86_64
$bazel version
Build label: 0.5.1
Build target: bazel-out/..
Build time: Tue Jun 6 10:34:11 2017 (1496745251)
Build timestamp: 1496745251
Build timestamp as int: 1496745251
2) Steps

$ git clone https://github.com/ramtej/bazel-multiworkspace-sampler.git
$ tree bazel-multiworkspace-sampler/ -L 3

bazel-multiworkspace-sampler/
├── LICENSE
├── profile # Development "Profile". A composition of all required components for the current tasks.
│ ├── BUILD
│ └── WORKSPACE
├── README.md
└── workspaces
├── a.app # Application A.app (e.g. frontend.app)
│ ├── 3rdparty
│ ├── BUILD
│ ├── src
│ ├── WORKSPACE
│ └── workspace.bzl
└── b.app # Application B.app (e.g. backend.app)
├── 3rdparty
├── BUILD
├── src
├── WORKSPACE
└── workspace.bzl

2.1) To build a single app works well

$ cd bazel-multiworkspace-sampler/workspaces/a.app/
$ bazel build //...

2.2) To build a single app from the "profile" workspace does not work, due to the
"Cannot redefine repository after any load statement in the WORKSPACE file" error message.

$ cd bazel-multiworkspace-sampler/profile/
$ bazel build @a_app//...

b_app/3rdparty/load.bzl", line 5, in callback
native.maven_jar(name = item["name"], artifact = it..."], ...)
Cannot redefine repository after any load statement in the WORKSPACE file (for repository 'asm_asm').

The native.maven_jar rules from the b_app project that resolves the external "asm" dependency
?conflicts? with the already resolved "asm" dependency by project a_app.

With a locally patched bazel version (simply removed the allowOverride flag) the above setup works fine. But I'm not sure what this "overriding" means in detail and what are the usecases.. and how to set the flag from e.g. WORKSPACE file.
